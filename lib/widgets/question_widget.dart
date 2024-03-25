//this file serves as a widget to present the question and its options
//a reusable component so we only create it once and use it multiple times across the app
import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart';

class questionScreen extends StatelessWidget{
  final Question question;
  final Function(int) onOptionSelected;
  questionScreen({
    required this.question,
    required this.onOptionSelected,
  });
//this widget here is where the question will be displayed
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.question,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: question.options
              .asMap()
              .entries
              .map((entry) => _buildOptionButton(entry.key,entry.value))
              .toList(),
            ),
          ],
        ),
      ),
    );
  }
// this widget is the button with which the answer will be submitted
  Widget _buildOptionButton(int index, String option){
    return ElevatedButton(
      onPressed: () => onOptionSelected(index),
      child: Text(option));
  }
}