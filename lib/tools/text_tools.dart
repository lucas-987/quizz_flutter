import 'package:flutter/material.dart';

class TextTools {
  static TextEditingController newTextEditingController(String? text) {
    TextEditingController result = TextEditingController(text: text);

    if(text != null) {
      result.selection = TextSelection.fromPosition(TextPosition(offset: text.length));
    }

    return result;
  }
}