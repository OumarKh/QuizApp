import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart';

class questionScreen extends StatefulWidget {
  final Question question;
  final Function(int) onOptionSelected;

  const questionScreen({
    required this.question,
    required this.onOptionSelected,
  });

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<questionScreen> {
  late Timer _timer;
  int _secondsRemaining = 10; // Change it to whatever duration you want

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          widget.onOptionSelected(-1); 
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  //restarting the timer on each question
  @override
  void didUpdateWidget(covariant questionScreen oldWidget){
    super.didUpdateWidget(oldWidget);
    if(widget.question != oldWidget.question){
      _secondsRemaining = 10;
      startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(212, 160, 233, 253),
      appBar: AppBar(
        backgroundColor:Color.fromARGB(212, 160, 233, 253),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Time: $_secondsRemaining sec',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color :Color(0xff000000),
            ),),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.question.question,
              style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: widget.question.options
                  .asMap()
                  .entries
                  .map((entry) =>Padding(
                    padding: EdgeInsets.fromLTRB(20,0,20,20),
                    child: _buildOptionButton(
                      entry.key,
                      entry.value
            ),
          ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

   Widget _buildOptionButton(int index, String option) {
    return ElevatedButton(
      onPressed: () {
        // Stop the timer when the user selects an option
        _timer.cancel();
        // Pass the selected option index to the callback function
        widget.onOptionSelected(index);
      },
      child: Text(option,
      style: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
      ),),
    );
  }
}
