import 'package:flutter/material.dart';
import 'package:validation_of_users_data/components/textfield_birthday.dart';
import 'package:validation_of_users_data/components/textfield_fio.dart';
import 'package:validation_of_users_data/screens/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController surnameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController aboutYouController = TextEditingController();
  String surname = '';
  String name = '';
  String fatherName = '';
  String birthday = '';
  String aboutYou = '';
  bool isButtonActive = false;
  bool isSurnameFull = false;
  bool isNameFull = false;
  bool isFatherNameFull = false;
  bool isBirthdayFull = false;
  bool isAboutYouFull = false;

  void checkButton() {
    setState(() {
      if (isSurnameFull &&
          isNameFull &&
          isFatherNameFull &&
          isBirthdayFull &&
          isAboutYouFull) {
        isButtonActive = true;
      } else {
        isButtonActive = false;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'First Screen. Enter your details',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: ListView(
          children: [
            TextFieldFio(
              controller: surnameController,
              text: 'Surname',
              onChangedCallback: (String value) {
                isSurnameFull = value.isNotEmpty;
                checkButton();
              },
            ),
            TextFieldFio(
              controller: nameController,
              text: 'Name',
              onChangedCallback: (String value) {
                isNameFull = value.isNotEmpty;

                checkButton();
              },
            ),
            TextFieldFio(
              controller: fatherNameController,
              text: 'FatherName',
              onChangedCallback: (String value) {
                isFatherNameFull = value.isNotEmpty;
                setState(() {
                  checkButton();
                });
              },
            ),
            TextFieldBirthday(
              controller: birthdayController,
              text: 'Birthday',
              isFull: () {
                isBirthdayFull = true;
                checkButton();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                style: const TextStyle(
                  fontSize: 10,
                ),
                decoration: const InputDecoration(
                  labelText: 'About yourself',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                maxLength: 300,
                controller: aboutYouController,
                onChanged: (value) {
                  checkButton();
                  isAboutYouFull = true;
                //   setState(() {
                //     //aboutYouController.text = value;
                //
                //     isAboutYouFull = true;
                //   });
                },
                // onSubmitted: (String value) {
                //   debugPrint(value);
                // },
              ),
            ),
            ElevatedButton(
              onPressed: isButtonActive
                  ? () async {
                surname = surnameController.text;
                surnameController.clear();
                name = nameController.text;
                nameController.clear();
                fatherName = fatherNameController.text;
                fatherNameController.clear();
                birthday = birthdayController.text;
                birthdayController.clear();
                aboutYou = aboutYouController.text;
                aboutYouController.clear();

                Map<String, dynamic> result = await sendData();
                // variant if we have 2 conditions true or false
                // setState(() {
                //   result['result']
                //       ? showAlertTrue(context)
                //       : showAlertFalse(context);
                // });

                // variant if we have 3 conditions true, false, null

                setState(() {
                  if (result['result']!=null ) {
                    result['result']? showAlertTrue(context): showAlertFalse(context);
                  }

                });
              }
                  : null,
              child: const Text('Send data'),
            ),
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> sendData() async {
    Map<String, dynamic> result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            SecondScreen(
                surname: surname,
                name: name,
                fatherName: fatherName,
                birthday: birthday,
                aboutYou: aboutYou),
      ),
    );
    return result;
  }


  void showAlertTrue(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Results'),
            content: const ListTile(
              leading: Icon(
                Icons.check,
                color: Colors.green,
                size: 15,
              ),
              title: Text('All your details are correct'),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  Future<AlertDialog?> showAlertFalse(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Results'),
            content: const ListTile(
              leading: Icon(
                Icons.close,
                color: Colors.red,
                size: 15,
              ),
              title: Text('Some of your details are not correct'),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    // surnameController.dispose();
                    // nameController.dispose();
                    // fatherNameController.dispose();
                    // birthdayController.dispose();
                    // aboutYouController.dispose();
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

 // Future<AlertDialog?> showAlertNull(BuildContext context) async {
 //    await showDialog(context: context, builder: (BuildContext context) {
 //      return AlertDialog(
 //        title: Text('Details are not checked'),
 //        actions: [
 //          OutlinedButton(onPressed: (){
 //            Navigator.of(context).pop();
 //          }, child: Text('OK'),),
 //        ],
 //      );
 //    },);

 }


