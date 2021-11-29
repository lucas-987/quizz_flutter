final String tableChoice = "choices";

class ChoiceFields {
  static final List<String> values = [
    /// Add all fields
    id, value, questionId, order
  ];

  static const String id = '_id';
  static const String value = 'value';
  static const String questionId = 'questionId';
  static const String order = "position";
}

class Choice {
  int? id;
  int? questionId;
  String value;
  int order = 1;

  Choice(this.value);
  Choice.WithQuestionId(this.value, this.questionId);
  Choice.WithIds(this.value, this.questionId, this.id, this.order);

  static Choice fromDbJson(Map<String, Object?> json) {
    return Choice.WithIds(
      json[ChoiceFields.value] as String,
      json[ChoiceFields.questionId] as int?,
      json[ChoiceFields.id] as int?,
      json[ChoiceFields.order] as int
    );
  }

  Map<String, Object?> toDbJson() {
    return {
      ChoiceFields.id: id,
      ChoiceFields.questionId: questionId,
      ChoiceFields.value: value,
      ChoiceFields.order: order
    };
  }
}