/* this class is a model to import questions from the json files*/

class Question{
  final String question ;
  final List<dynamic> options;
  final int correctAns;

  Question({required this.question,required this.options,required this.correctAns});

  factory Question.fromJson(Map<String, dynamic> json){
    return Question(
      question: json['question'],
      options: json['options'],
      correctAns: json['answer'],
    );
  }
}