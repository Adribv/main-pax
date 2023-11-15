import 'package:flutter/material.dart';
import 'package:untitled3/screen/home_screen.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MentalHealthQuestionsPage(),
    );
  }
}

class MentalHealthQuestionsPage extends StatelessWidget {
  final List<String> questions = [
    'How are you feeling today?',
    'Have you been sleeping well?',
    'Are you able to concentrate on tasks?',
    'Do you have a support system?',
    'Have you been engaging in activities you enjoy?',
    'Have you experienced any mood swings?',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pax'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HhomeScreen()));
                // Add your logic to process the answers here
                // This is where you can analyze the user's responses
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 20), // Add some space between the button and questions
            Text(
              'Answer the following questions honestly:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            for (String question in questions) ...[
              MentalHealthQuestionCard(question: question),
              SizedBox(height: 10),
            ],
          ],
        ),
      ),
    );
  }
}

class MentalHealthQuestionCard extends StatefulWidget {
  final String question;

  const MentalHealthQuestionCard({required this.question});

  @override
  _MentalHealthQuestionCardState createState() => _MentalHealthQuestionCardState();
}

class _MentalHealthQuestionCardState extends State<MentalHealthQuestionCard> {
  bool answer = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(widget.question, style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      answer = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: answer ? Colors.green : Colors.grey,
                  ),
                  child: Text('Yes'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      answer = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: !answer ? Colors.red : Colors.grey,
                  ),
                  child: Text('No'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
