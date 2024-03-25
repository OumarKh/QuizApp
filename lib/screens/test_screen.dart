import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart'; // importing the question model
import 'package:quiz_app/repositories/quiz_repository.dart'; // importing the logic of loading the question from json
import 'package:quiz_app/widgets/question_widget.dart'; //importing the question widget
import 'package:quiz_app/models/user.dart'; //importing the user model 
import 'package:quiz_app/screens/result_screen.dart'; //importing the result screen


class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<Question> questions = [];
  late User user;

  @override
  void initState() {
    super.initState();
    user = User(f_name: "Jhon", l_name: "Neon", email: "john@example.com");
    loadQuestions();
  }
  //loading the question from the json file
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
      user.addScore(isCorrect ? 10 : 0,isCorrect);
    });
  }

  //to navigate the result screen 
  void navigateToResultScreen(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ResultScreen(user: user),
      ),
    );
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
            if (questions.isEmpty){
              navigateToResultScreen();
            }
          });

        },
      ),

      // showing the score at the bottom of the screen 
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Center(
            child: Text(
              'Name : ${user.f_name} ${user.l_name}, Score: ${user.calculateTotalScore()}',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),

            )
          )
        )
      ),
    );
  }
}