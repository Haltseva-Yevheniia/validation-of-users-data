import 'package:flutter/material.dart';
import 'package:validation_of_users_data/components/build_row_radio_check.dart';
import 'package:validation_of_users_data/components/enum_answers.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen(
      {super.key,
      required this.surname,
      required this.name,
      required this.fatherName,
      required this.birthday,
      required this.aboutYou});

  String surname;
  String name;
  String fatherName;
  String birthday;
  String aboutYou;
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Answers selectedAnswerSurname = Answers.wrong;
  Answers selectedAnswerName = Answers.wrong;
  Answers selectedAnswerFatherName = Answers.wrong;
  Answers selectedAnswerBirthday= Answers.wrong;
  Answers selectedAnswerAboutYou = Answers.wrong;
bool result = false;
  void isDataCorrect (){

    if ( selectedAnswerSurname == Answers.right &&
    selectedAnswerName == Answers.right &&
    selectedAnswerFatherName == Answers.right &&
    selectedAnswerBirthday== Answers.right &&
    selectedAnswerAboutYou == Answers.right) {
      result=true;
    } else {result = false;}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const Center(child: Text('Check your personal details \nand confirm if they are right', style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),),),
           const SizedBox(height: 50,),
           Padding(
             padding: const EdgeInsets.all(15.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox( height: 30, child: Text('Surname is ${widget.surname}')),
                  buildRowRadioCheck(selectedAnswerSurname),
                ],
              ),
           ),
            const Divider(
              color: Colors.black,
            ),


          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox( height: 30, child: Text('Name is ${widget.name}')),
                buildRowRadioCheck(selectedAnswerName),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox( height: 30, child: Text('Fathername is ${widget.fatherName}')),
                buildRowRadioCheck(selectedAnswerFatherName),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox( height: 30, child: Text('Birthday is ${widget.birthday}')),
                buildRowRadioCheck(selectedAnswerBirthday),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox( height: 30, child: Text('About yourself ${widget.aboutYou}')),
                buildRowRadioCheck(selectedAnswerAboutYou),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              isDataCorrect();
              Navigator.pop(context, {
                'surname': widget.surname,
                'name':widget.name,
                'fatherName': widget.fatherName,
                'birthday': widget.birthday,
                'about': widget.aboutYou,
                'result': result,
              },);
            },
            child: const Text(
              'Check and send answers',
            ),
          ),
        ],
      ),
    );
  }

  Row buildRowRadioCheck(Answers selectedAnswer) {
    return Row(

      children: [
        Column(
          children: [
            const Text('Right'),
            Radio(
              value: Answers.right,
              groupValue: selectedAnswer,
              onChanged: (Answers? value) {
                setState(() {
                  selectedAnswer = value!;
                });
              },
            ),
          ],
        ),
        Column(
          children: [
            const Text('Wrong'),
            Radio(
              value: Answers.wrong,
              groupValue: selectedAnswer,
              onChanged: (Answers? value) {
                setState(() {
                  selectedAnswer = value!;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
