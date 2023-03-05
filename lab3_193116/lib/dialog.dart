import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/subject.dart';

class AddTermDialog extends StatefulWidget {
  final Function(Subject) addTerm;

  AddTermDialog(this.addTerm);

  @override
  _AddTermDialogDialogState createState() => _AddTermDialogDialogState();
}

class _AddTermDialogDialogState extends State<AddTermDialog> {
  @override
  Widget build(BuildContext context) {
    Widget buildTextField(String hint, TextEditingController controller) {
      return Container(
        margin: EdgeInsets.all(4),
        child: TextField(
          decoration: InputDecoration(
            labelText: hint,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black38,
              ),
            ),
          ),
          controller: controller,
        ),
      );
    }

    var titleController = TextEditingController();
    var dateController = TextEditingController();
    var timeController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Add Exam Term',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.blueGrey,
              ),
            ),
            buildTextField('Subject', titleController),
            TextField(
                controller: dateController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: "Enter Exam Term Date"),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    dateController.text = formattedDate;
                  }
                }),
            TextField(
                controller: timeController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.access_time),
                    labelText: "Enter Exam Term Time"),
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                  );

                  if (pickedTime != null) {
                    final format = DateFormat.jm();
                    final now = DateTime.now();
                    final dateTime = DateTime(now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);
                    timeController.text = format.format(dateTime);
                  }
                }),
            ElevatedButton(
              onPressed: () {
                final term = Subject(titleController.text, dateController.text, timeController.text);
                widget.addTerm(term);
                Navigator.of(context).pop();
              },
              child: const Text('Add Term'),
            ),
          ],
        ),
      ),
    );
  }
}
