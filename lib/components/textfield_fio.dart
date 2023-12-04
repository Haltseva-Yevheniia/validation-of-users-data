import 'package:flutter/material.dart';

class TextFieldFio extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final Function(String) onChangedCallback;
//isFull;

  const TextFieldFio({
    super.key,
    required this.controller,
    required this.text,
    required this.onChangedCallback,
  });

  @override
  State<TextFieldFio> createState() => _TextFieldFioState();
}

class _TextFieldFioState extends State<TextFieldFio> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChangedCallback,
        /*(String value) {
          //controller.text= value;

          widget.isFull=true;
        },*/
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: widget.text,
          hintStyle: const TextStyle(color: Colors.grey),
          label: Text('Enter your ${widget.text}'),
        ),
      ),
    );
  }
}
