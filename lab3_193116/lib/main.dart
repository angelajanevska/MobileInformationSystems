// @dart=2.19
import 'package:flutter/material.dart';
import 'models/subject.dart';
import 'dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExamTermsList(),
    );
  }
}

class ExamTermsList extends StatefulWidget {
  const ExamTermsList({Key? key}) : super(key: key);

  @override
  _ExamTermsListState createState() => _ExamTermsListState();
}

class _ExamTermsListState extends State<ExamTermsList> {
  List<Subject> examsList = [];

  @override
  Widget build(BuildContext context) {
    void addTermData(Subject subject) {
      setState(() {
        examsList.add(subject);
      });
    }

    void showTermDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: AddTermDialog(addTermData),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam terms List'),
        actions: [
          IconButton(
          icon: const Icon(Icons.add),
          onPressed: showTermDialog,
          alignment: Alignment.centerRight,
          )
        ],
      ),
      body: Container(
        height: 400,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              margin: const EdgeInsets.all(4),
              elevation: 8,
              child: ListTile(
                title: Text(
                  examsList[index].title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      examsList[index].date,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey
                      ),
                    ),
                    Text(
                      examsList[index].time,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: examsList.length,
        ),
      ),
    );
  }
}