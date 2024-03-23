import 'dart:convert';
import 'package:quiz_app/models/question.dart';
import 'package:flutter/services.dart';


//class to parse the json file and transform the questions into Question model
class QuizRepository{
  Future<List<Question>> getQuestionFromJson() async {
    //loading the json file
    String jsonString = await rootBundle.loadString('assets/questions.json');
    

    //parse the json
    List<dynamic> jsonList = jsonDecode(jsonString);

    //Converting JSON Data to Question object
    List<Question> questions = jsonList.map((json) => Question.fromJson(json)).toList();
    return questions;
  }
}