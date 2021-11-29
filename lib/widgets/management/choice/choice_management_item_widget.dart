import 'package:flutter/material.dart';
import 'package:quizz/controllers/management/choice/choice_management_item_controller.dart';
import 'package:quizz/model/choice.dart';

class ChoiceManagementItemWidget extends StatefulWidget {
  Choice choice;
  bool isRightChoice;

  final void Function(Choice choice) onTapped;
  final void Function(Choice choice) onSelect;

  ChoiceManagementItemWidget(this.choice, this.isRightChoice, this.onTapped, this.onSelect, {Key? key}) : super(key: key);

  @override
  ChoiceManagementItemController createState() => ChoiceManagementItemController();
}