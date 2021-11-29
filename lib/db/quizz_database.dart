import 'dart:async';
import 'package:quizz/model/choice.dart';
import 'package:quizz/model/question.dart';
import 'package:quizz/model/quizz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class QuizzDatabase {

  static final QuizzDatabase instance = QuizzDatabase._init();

  static Database? _database;

  QuizzDatabase._init();

  Future<Database> get database async {
    if(_database != null) return _database!;

    _database = await _initDB("quizz.db");
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, filepath);

    return await openDatabase(path, version: 2, onCreate: _createDB, onConfigure: _onConfigure);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const textTypeNull = 'TEXT';
    const boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE $tableQuizz ( 
        ${QuizzFields.id} $idType, 
        ${QuizzFields.url} $textTypeNull,
        ${QuizzFields.title} $textType
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableQuestion (
        ${QuestionFields.id} $idType,
        ${QuestionFields.quizzId} $integerType,
        ${QuestionFields.sentence} $textType,
        ${QuestionFields.answer} $textType,
        ${QuestionFields.order} $integerType,
        FOREIGN KEY (${QuestionFields.quizzId}) REFERENCES $tableQuizz (${QuizzFields.id}) ON DELETE CASCADE ON UPDATE NO ACTION
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableChoice (
        ${ChoiceFields.id} $idType,
        ${ChoiceFields.questionId} $integerType,
        ${ChoiceFields.value} $textType,
        ${ChoiceFields.order} $integerType,
        FOREIGN KEY (${ChoiceFields.questionId}) REFERENCES $tableQuestion (${QuestionFields.id}) ON DELETE CASCADE ON UPDATE NO ACTION
      )
    ''');
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<List<Quizz>> getAllQuizzes() async {
    final db = await instance.database;

    final List<Map<String, Object?>> quizzesResult = await db.query(tableQuizz);
    
    List<Quizz> quizzes = quizzesResult.map((jsonQuizz) => Quizz.fromDbJson(jsonQuizz)).toList();

    for(Quizz quizz in quizzes) {
      if(quizz.id != null) {
        List<Map<String, Object?>> questionsResult = await db.query(
            tableQuestion,
            orderBy: QuestionFields.order,
            where: '${QuestionFields.quizzId} = ${quizz.id}');

        List<Question> questions = questionsResult.map((jsonQuestion) => Question.fromDbJson(jsonQuestion)).toList();

        for(Question question in questions) {
          List<Map<String, Object?>> choicesResult = await db.query(
              tableChoice,
              where: '${ChoiceFields.questionId} = ${question.id}',
              orderBy: '${ChoiceFields.order}');

          List<Choice> choices = choicesResult.map((jsonChoice) => Choice.fromDbJson(jsonChoice)).toList();
          question.choices = choices;
          // TODO create an object Choice to store id and value of the choice (because we will need id to manage choices in db)
        }

        quizz.questions = questions;
      }
    }

    return quizzes;
  }

  Future<Quizz> createQuizz(Quizz quizz) async {
    final db = await instance.database;

    final quizzId = await db.insert(tableQuizz, quizz.toDbJson());
    quizz.id = quizzId;

    for(Question question in quizz.questions) {
      question.quizzId = quizzId;
      final questionId = await db.insert(tableQuestion, question.toDbJson());
      question.id = questionId;

      for(Choice choice in question.choices) {
        choice.questionId = questionId;
        final choiceId = await db.insert(tableChoice, choice.toDbJson());
        choice.id = choiceId;
      }
    }

    quizz.questions = List<Question>.from(quizz.questions);
    return quizz;
  }

  Future<int> deleteQuizz(Quizz quizz) async {
    final db = await instance.database;

    return await db.delete(
      tableQuizz,
      where: "${QuizzFields.id} = ${quizz.id}"
    );
  }

  Future<int> updateQuizz(Quizz quizz) async {
    final db = await instance.database;

    return db.update(
        tableQuizz,
        quizz.toDbJson(),
        where: "${QuizzFields.id} = ?",
        whereArgs: [quizz.id]
    );

    //TODO update recursively questions ?
  }

  Future<Question> createQuestion(Question question) async {
    // TODO check that the quizzId of question correspond to an existing quizz
    final db = await instance.database;

    final questionId = await db.insert(tableQuestion, question.toDbJson());
    question.id = questionId;

    for(Choice choice in question.choices) {
      choice.questionId = questionId;
      final choiceId = await db.insert(tableChoice, choice.toDbJson());
      choice.id = choiceId;
    }

    return question;
  }

  Future<int> deleteQuestion(Question question) async {
    final db = await instance.database;

    return await db.delete(
      tableQuestion,
      where: "${QuestionFields.id} = ?",
      whereArgs: [question.id]
    );
  }

  Future<int> updateQuestion(Question question) async {
    final db = await instance.database;

    return db.update(
      tableQuestion,
      question.toDbJson(),
      where: "${QuestionFields.id} = ?",
      whereArgs: [question.id]
    );

    //TODO update recursively choices ?
  }

  Future<Choice> createChoice(Choice choice) async {
    final db = await instance.database;

    final choiceId = await db.insert(tableChoice, choice.toDbJson());
    choice.id = choiceId;

    return choice;
  }

  Future<int> deleteChoice(Choice choice) async {
    final db = await instance.database;

    return await db.delete(
        tableChoice,
        where: "${ChoiceFields.id} = ?",
        whereArgs: [choice.id]
    );
  }

  Future<int> updateChoice(Choice choice) async {
    final db = await instance.database;

    return db.update(
        tableChoice,
        choice.toDbJson(),
        where: "${ChoiceFields.id} = ?",
        whereArgs: [choice.id]
    );
  }
}