import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/repositories/quiz_repository.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<Question> questions = [];

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

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('Test Screen'),
      ),
      body: questions.isEmpty
      ? Center(
        child: CircularProgressIndicator(),
      ) : ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(questions[index].question),
            subtitle: Text('Options: ${questions[index].options.join(',')}'),
          );
        },
      ),
    );
  }
}