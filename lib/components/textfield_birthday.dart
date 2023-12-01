import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextFieldBirthday extends StatefulWidget {
  TextFieldBirthday({
    super.key,
    required this.controller,
    required this.text,
    required this.isFull,
  });

  final TextEditingController controller;
  final String text;
  bool isFull;

  @override
  State<TextFieldBirthday> createState() => _TextFieldBirthdayState();
}

class _TextFieldBirthdayState extends State<TextFieldBirthday> {


  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime(2024),
    );

    if (pickedDate != null) {

     setState(() {
       widget.controller.text = DateFormat('dd-MM-yyyy').format(pickedDate);
       widget.isFull=true;
     });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: widget.controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          hintText: widget.text,
          label: Text('Select your ${widget.text}'),
        ),
        onTap: () {
          selectDate(context);


        },
      ),
    );
  }
}
