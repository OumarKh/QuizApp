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
     backgroundColor: Color(0xffffffff),
     appBar: AppBar(
      elevation: 4,
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xff01a8fe),
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      title: Text(
        "Quiz App",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: 17,
          color: Color(0xff000000),
        ),
        ),
     ),

     body: Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin:EdgeInsets.all(0),
        padding:EdgeInsets.all(0),
        width:MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color(0xffcdf5fd),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.zero,
          border:Border.all(color:Color(0x4d9e9e9e),width:1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding:EdgeInsets.fromLTRB(20,0,20,20),
              child:TextField(
                controller: _f_nameController,
                obscureText: false,
                textAlign: TextAlign.start,
                maxLines: 1,
                style:TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color:Color(0xff000000),
                ),
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xff04a9fd),
                      width:1
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xff04a9fd),
                      width:1
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xff04a9fd),
                      width:1
                    ),
                  ),
                  hintText:"First Name",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize:14,
                    color:Color(0xff000000),
                  ),
                  filled: true,
                  fillColor: Color(0xfff2f2f3),
                  isDense: false,
                  contentPadding: EdgeInsets.symmetric(vertical:8,horizontal:12),
                ),
              ),
            ),

            Padding(
              padding:EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: TextField(
                controller: _l_nameController,
                obscureText: false,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: TextStyle(
                  fontWeight:FontWeight.w400,
                  fontStyle:FontStyle.normal,
                  fontSize:14,
                  color:Color(0xff000000),
                ),

                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xff04a9fd),
                      width:1
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xff04a9fd),
                      width:1
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color:Color(0xff04a9fd),
                      width:1
                    ),
                  ),
                  hintText: "Last Name",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color:Color(0xff000000),
                  ),
                  filled: true,
                  fillColor: Color(0Xfff2f2f3),
                  isDense: false,
                  contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal:12),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child:TextField(
                controller: _emailController,
                obscureText: false,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color:Color(0xff000000),
                ),

                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:BorderSide(
                      color: Color(0xff04a9fd),
                      width: 1
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xff04a9fd),
                      width:1
                    ),
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(10.0),
                    borderSide:BorderSide(
                      color: Color(0xff04a9fd),
                      width:1
                    ),
                  ),
                  hintText:"Email",
                  hintStyle:TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color:Color(0Xff000000),
                  ),
                  filled:true,
                  fillColor: Color(0Xfff2f2f3),
                  isDense:false,
                  contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                ),
              ),
            ),
            MaterialButton(onPressed: () => _startQuiz(context),
            color: Color(0xff01a9fe),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color:Color(0xff01a7fc),width:1 ),
            ),
            padding:EdgeInsets.all(16),
            child: Text("Start Quiz",style:TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),),
            textColor: Color(0xff000000),
            height: 40,
            minWidth: 140,
            ),
          ],
        ),
      ),
     ),
    );
  }
}
