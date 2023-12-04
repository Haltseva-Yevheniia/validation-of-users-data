import 'package:flutter/material.dart';
import 'package:validation_of_users_data/components/enum_answers.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen(
      {super.key,
      required this.surname,
      required this.name,
      required this.fatherName,
      required this.birthday,
      required this.aboutYou});

  final String surname;
  final String name;
  final String fatherName;
  final String birthday;
  final String aboutYou;

  //DateTime birthdayDate = DateTime.parse(formattedString)


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
                  //RowOfRadio(selectedAnswer: selectedAnswerSurname),
                  buildRowRadioCheck(0,selectedAnswerSurname),
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
                //RowOfRadio(selectedAnswer: selectedAnswerName),
                buildRowRadioCheck(1,selectedAnswerName),
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
                //RowOfRadio(selectedAnswer: selectedAnswerFatherName),
                buildRowRadioCheck(2,selectedAnswerFatherName),
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
                buildRowRadioCheck(3,selectedAnswerBirthday),
                //RowOfRadio(selectedAnswer: selectedAnswerBirthday),

                //buildRowRadioCheck(selectedAnswerBirthday),
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
                SizedBox( height: 60, width: 200, child: Text('About yourself ${widget.aboutYou}')),
                buildRowRadioCheck(4,selectedAnswerAboutYou),
                //RowOfRadio(selectedAnswer: selectedAnswerAboutYou),

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






  Row buildRowRadioCheck(int type, Answers selectedAnswer) {
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
                  switch(type) {
                    case 0: selectedAnswerSurname = value?? Answers.wrong;
                    case 1: selectedAnswerName = value?? Answers.wrong;
                    case 2: selectedAnswerFatherName = value?? Answers.wrong;
                    case 3: selectedAnswerBirthday = value?? Answers.wrong;
                    case 4: selectedAnswerAboutYou = value?? Answers.wrong;

                      //selectedAnswerAboutYou = value ?? Answers.wrong;

                  }
                  //selectedAnswer = value!;
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
    switch(type) {
    case 0: selectedAnswerSurname = value?? Answers.wrong;
    case 1: selectedAnswerName = value?? Answers.wrong;
    case 2: selectedAnswerFatherName = value?? Answers.wrong;
    case 3: selectedAnswerBirthday = value?? Answers.wrong;
    case 4: selectedAnswerAboutYou = value?? Answers.wrong;}

                  //selectedAnswer = value!;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

// class RowOfRadio extends StatefulWidget {
//   RowOfRadio({super.key, required this.selectedAnswer});
// Answers selectedAnswer;
//
//   @override
//   State<RowOfRadio> createState() => _RowOfRadioState();
// }
//
// class _RowOfRadioState extends State<RowOfRadio> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//
//       children: [
//         Column(
//           children: [
//             const Text('Right'),
//             Radio(
//               value: Answers.right,
//               groupValue: widget.selectedAnswer,
//               onChanged: (Answers? value) {
//                 setState(() {
//                   widget.selectedAnswer = value!;
//                 });
//               },
//             ),
//           ],
//         ),
//         Column(
//           children: [
//             const Text('Wrong'),
//             Radio(
//               value: Answers.wrong,
//               groupValue: widget.selectedAnswer,
//               onChanged: (Answers? value) {
//                 setState(() {
//                   widget.selectedAnswer = value!;
//                 });
//               },
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
