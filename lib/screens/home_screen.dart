import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _f_nameController;
  late TextEditingController _l_nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _f_nameController = TextEditingController();
    _l_nameController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _f_nameController.dispose();
    _l_nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _startQuiz(BuildContext context) {
    final String f_name = _f_nameController.text;
    final String l_name = _l_nameController.text;
    final String email = _emailController.text;

    if (f_name.isNotEmpty && l_name.isNotEmpty && email.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TestScreen(
            f_name: f_name,
            l_name: l_name,
            email: email,
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Missing Information'),
          content: Text('Please fill in all fields to start the quiz.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _f_nameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _l_nameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _startQuiz(context),
              child: Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
