import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart'; // importing the question model
import 'package:quiz_app/repositories/quiz_repository.dart'; // importing the logic of loading the question from json
import 'package:quiz_app/widgets/question_widget.dart'; //importing the question widget


class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<Question> questions = [];
  int _score = 0;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }
  Future<void> loadQuestions() async {
    QuizRepository quizRepository = QuizRepository();
    List<Question> loadedQuestions = await quizRepository.getQuestionFromJson();
    setState(() {
      questions = loadedQuestions;
    });
  }

  // a function to update the score if the answer is correct
  void updateScore(bool isCorrect){
    setState(() {
      _score += isCorrect ? 10:0;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('Test Screen'),
      ),
      body: questions.isEmpty
      ? Center(
        child: CircularProgressIndicator(),
      ) : questionScreen( 
        question: questions[0], 
        onOptionSelected: (index){
          bool isCorrect = index == questions[0].correctAns;
          updateScore(isCorrect);
          setState(() {
            questions.removeAt(0);
          });

        },
      ),

      // showing the score at the bottom of the screen 
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Center(
            child: Text(
              'Score: $_score',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),

            )
          )
        )
      ),
    );
  }
}