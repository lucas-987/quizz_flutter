final String tableChoice = "choices";

class ChoiceFields {
  static final List<String> values = [
    /// Add all fields
    id, value, questionId
  ];

  static const String id = '_id';
  static const String value = 'value';
  static const String questionId = 'questionId';
}

class Choice {
  int? id;
  int? questionId;
  String value;

  Choice(this.value);
  Choice.WithQuestionId(this.value, this.questionId);
  Choice.WithIds(this.value, this.questionId, this.id);

  static Choice fromDbJson(Map<String, Object?> json) {
    return Choice.WithIds(
      json[ChoiceFields.value] as String,
      json[ChoiceFields.questionId] as int?,
      json[ChoiceFields.id] as int?
    );
  }

  Map<String, Object?> toDbJson() {
    return {
      ChoiceFields.id: id,
      ChoiceFields.questionId: questionId,
      ChoiceFields.value: value
    };
  }
}