import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/models/user.dart';


class ResultScreen extends StatelessWidget{
  late final User user;
  ResultScreen({required this.user});

  @override 
  Widget build(BuildContext context) {
    double passingPourcentage = 70.0 ;
    int totalQuestions = user.scoreEntries.length * 10 ;
    int totalScore = 0 ;

    //calculating the total score
    for (var entry in user.scoreEntries){
      totalScore += entry.score;
    }

    //calulating the pourcentage
    double pourcentage = (totalScore / totalQuestions) * 100 ;
    bool passed = pourcentage >= passingPourcentage ;

    //the layout of the screen
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor:Color(0xff01a8fe) ,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          'Quiz Result',
          style:TextStyle(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 17,
            color: Color(0xff000000),
          ),
          ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${user.f_name} ${user.l_name}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height:10),
              Text(
                'Final Score: $totalScore / $totalQuestions',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                '${DateFormat('yyyy-MM-dd').format(DateTime.now())}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                passed ? 'Congratulations! You passed.' : 'Sorry! You failed.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: passed ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '${pourcentage.toStringAsFixed(2)}%',
                style: TextStyle(fontSize: 20),
              ),
            ]
          )
        )
      )
    );
  }
}