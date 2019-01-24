
import 'package:flutter/material.dart';
import 'package:rbk/widgets/home/AddItem.dart';

class Input extends State<AddItem> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'add an Item',
      ),
      onSubmitted: (String s) {
        print(widget);
        widget.model.onAddItem(s);
        controller.text = '';
      },
    );
  }
}