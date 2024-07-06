import 'package:flutter/material.dart';

class Prediction extends StatelessWidget {
  const Prediction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         // Your title here
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('We will check and predict you desease .....',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 27,
                ),
              ),
                SizedBox(height: 30,),
                CustomQuestion(question: 'DO you have any heart related diseases?'),
              CustomQuestion(question: 'Are you GAY'),
              CustomQuestion(question: 'Are you feeling well'),
              SizedBox(height: 20,),

              ElevatedButton(onPressed: (){},
                  child: Text('Predict',style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
                    backgroundColor: Color(0xff51604F),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Prediction(),
  ));
}

class CustomQuestion extends StatefulWidget {
  const CustomQuestion({
    Key? key,
    required this.question,
  }) : super(key: key);

  final String question;

  @override
  State<CustomQuestion> createState() => _CustomQuestionState();
}

class _CustomQuestionState extends State<CustomQuestion> {
  Color yesButtonColor = Color(0xFFE9EAEC);
  Color noButtonColor = Color(0xFFE9EAEC);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 10.0), // Adjust gap as needed
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      yesButtonColor = Color(0xFFFF7373);
                      noButtonColor = Color(0xFFE9EAEC);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 13.0),
                    child: Text(
                      'Yes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: yesButtonColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0), // Adjust gap as needed
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      yesButtonColor = Color(0xFFE9EAEC);
                      noButtonColor = Color(0xFFE3EBBD);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 13.0),
                    child: Text(
                      'No',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: noButtonColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
