//this file represents a user model to which we will associate 
//a user with its corresponding score in the quiz

import 'package:intl/intl.dart';
import 'package:quiz_app/models/score.dart';

class User{
  final f_name;
  final l_name;
  final email ;
  List<ScoreEntry> scoreEntries = [];

  User({
    required this.f_name,
    required this.l_name,
    required this.email,
  });

  //function to add the score with the date of taking the quiz
  void addScore(int score){
    String date= DateFormat('yyyy-MM-dd').format(DateTime.now()); // to get the current date
    scoreEntries.add(ScoreEntry(score: score, date: date));
  }
}

