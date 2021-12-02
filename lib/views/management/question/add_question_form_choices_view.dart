import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizz/controllers/management/question/add_question_form_choices_controller.dart';
import 'package:quizz/tools/text_tools.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/management/question/add_question_form_choices_widget.dart';

class AddQuestionFormChoicesView extends WidgetView<AddQuestionFormChoicesWidget, AddQuestionFormChoicesController> {

  AddQuestionFormChoicesView(AddQuestionFormChoicesController state, {Key? key}): super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Expanded(
            child: ReorderableListView(
              children: [
                for(var i=0; i<this.widget.choices.length; i++) Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  child: ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.dehaze)
                      ],
                    ),
                    contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    title: GestureDetector(
                      child: TextFormField(
                        controller: TextTools.newTextEditingController(this.widget.choices[i]),
                        decoration: InputDecoration(
                            hintText: "Answer ${i+1}",
                            labelText: "Answer ${i+1}"
                        ),
                        enabled: false,
                        validator: (value) => this.state.validateChoice(value),
                      ),
                      onTap: () => this.state.onChoiceClicked(i),
                    ),
                    trailing: Checkbox(
                      value: widget.selectedIndex-1 == i,
                      onChanged: (value) {
                        if(widget.selectedIndex-1 != i)
                          this.widget.onSelectedAnswerChanged(i);
                      },
                    ),
                  ),
                  onDismissed: (direction) => widget.onChoiceDismissed(i),
                ),
              ],

              onReorder: (oldIndex, newIndex) => this.widget.onChoiceOrderChanged(oldIndex, newIndex),
            ),
          )
        ),
        SizedBox(height: 20,),
        ElevatedButton(
          onPressed: () => this.widget.onChoiceAdded(),
          style: ElevatedButton.styleFrom(primary: Colors.amber),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}