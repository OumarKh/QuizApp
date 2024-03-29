import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart'; // importing the question model
import 'package:quiz_app/repositories/quiz_repository.dart'; // importing the logic of loading the question from json
import 'package:quiz_app/widgets/question_widget.dart'; //importing the question widget
import 'package:quiz_app/models/user.dart'; //importing the user model 
import 'package:quiz_app/screens/result_screen.dart'; //importing the result screen


class TestScreen extends StatefulWidget {

  final String f_name ;
  final String l_name ;
  final String email ;

  TestScreen({
    required this.f_name,
    required this.l_name,
    required this.email
  });

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<Question> questions = [];
  late User user;

  @override
  void initState() {
    super.initState();
    user = User(f_name: widget.f_name, l_name: widget.l_name, email: widget.email);
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
        elevation: 4,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor:Color(0xff01a8fe),
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title:Text('Quiz App',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: 17,
          color: Color(0xff000000),
        )),
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
        color:Color(0xff04a9fd) ,
        child: Container(
          height: 20,
          child: Center(
            child: Text(
              '${user.f_name} ${user.l_name}, Score: ${user.calculateTotalScore()}',
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),

            )
          )
        )
      ),
    );
  }
}