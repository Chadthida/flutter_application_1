import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Question> questions = [
    // คำถาม 1
    Question(
      text: 'เกม ROV เปิดตัวครั้งแรกปีใด?',
      options: [
        '2015',
        '2016',
        '2017',
        '2018',],
      answer: '2015',),

    // คำถาม 2
    Question(
      text: 'เกม ROV มีกี่ตำแหน่ง?',
      options: [
        '3',
        '4',
        '5',
        '6',],
      answer: '5',),

    // คำถาม 3
    Question(
      text: 'Arena of Valor มีชื่อเก่าว่าอะไร?',
      options: [
        'ลีกออฟเลเจ็นดส์(LOL)',
        'ฮีโร่ออฟนิวเวิส(HON)',
        'เรียล์มออฟเวเลอร์(ROV)',
        'อารีนาออฟเวเลอร์(AOV)',],
      answer: 'เรียล์มออฟเวเลอร์(ROV)',),

    // คำถาม 4
    Question(
      text: 'ฮีโร่ล่าสุดในเกม ROV? (7/2/67)',
      options: [
        'Bijan',
        'Erin',
        'Ming',
        'Bonnie',],
      answer: 'Erin',),

    // คำถาม 5
    Question(
      text: 'ฮีไร่ใดต่างจากพวก?',
      options: [
        'Violet',
        'Teeri',
        'Erin',
        'Iggy',],
      answer: 'Iggy',),

    // คำถาม 6
    Question(
      text: 'Helen ถูกนำมาแทนฮีโร่ใด?',
      options: [
        'Preyta',
        'Batman',
        'Yue',
        'Payna',],
      answer: 'Payna',),

    // คำถาม 7
    Question(
      text: 'แรงค์สูงสุดในเกม ROV?',
      options: [
        'Glorious Ruler',
        'Supreme Conqueror',
        'Conqueror',
        'Commander',],
      answer: 'Glorious Ruler',),

    // คำถาม 8
    Question(
      text: 'ฮีโร่ทั้งหมดในเกม ROV มีกี่ฮีโร่? (7/2/67)',
      options: [
        '118 ฮีโร่',
        '117 ฮีโร่',
        '116 ฮีโร่',
        '115 ฮีโร่',],
      answer: '117 ฮีโร่',),

    // คำถาม 9
    Question(
      text: 'สกินทั้งหมดในเกม ROV มีกี่สกิน? (7/2/67)',
      options: [
        '804 สกิน',
        '803 สกิน',
        '802 สกิน',
        '801 สกิน',],
      answer: '804 สกิน',),

    // คำถาม 10
    Question(
      text: 'ฮีไร่ใดเป็นฮีโร่ชาย?',
      options: [
        'Iggy',
        'Bonnie',
        'Veera',
        'Krixi',],
      answer: 'Iggy',),
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(questions[currentQuestionIndex].text),
            ...questions[currentQuestionIndex].options.map((answer) {
              return ListTile(
                title: Text(answer),
                onTap: () {
                  if (answer == questions[currentQuestionIndex].answer) {
                    score++;
                  }
                  setState(() {
                    if (currentQuestionIndex < questions.length - 1) {
                      currentQuestionIndex++;
                    } else {
                      // แสดงผลลัพธ์
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('ผลลัพธ์'),
                          content: Text('คุณได้คะแนน $score จาก ${questions.length} คะแนน'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('ปิด'),
                            ),
                          ],
                        ),
                      );
                    }
                  });
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  final String answer;

  Question({
    required this.text,
    required this.options,
    required this.answer,
  });
}