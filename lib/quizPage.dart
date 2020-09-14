
import 'package:flutter/material.dart';
import 'package:quiz_app/scorePage.dart';
import 'package:quiz_app/ui/questionBox.dart';
import 'dart:async';
import 'utils/question.dart';
import 'utils/questionList.dart';
import 'ui/questionBox.dart';
import 'ui/overlay.dart';

class QuizPage extends StatefulWidget{
  @override
  State createState() => new _QuizPageState();

}


class _QuizPageState extends State<QuizPage>{

  _QuizPageState(){
    init();
  }
  Question _currentQuestion;
  QuestionList _quizQuestions = new QuestionList([
    new Question("Quais os fundamentos da POO?", "Apenas Herança e Polimorfismo","Encapsulamento e Polimorfismo, apenas","Abstração e Polimorfismo, mas não a Herança","Herança, Encapsulamento e Polimorfismo","D"),
    new Question("O que caracteriza um objeto?", "A classe","O método","Seus atributos","Outro objeto","C"),
    new Question("Qual a primeira linguagem a usar conceitos de OO", "Java","Pyton","Cobol","Simula","D"),
    new Question("Quem é considerado o 'pai' da Programação Orientada a Objetos?", "Alan Kay","Alan Turing","Steve Jobs","James Gosling","A"),
    new Question("Conceito de OO que permite que classes mais especializadas reaproveitem comportamentos de uma classe generalista", "Interface","Abstração","Polimorfismo","Herança","D"),
  ]);

  int _questionNumber = 0;
  int _score = 0;
  bool _isCorrect;
  bool _overlayVisible;

  void init(){
    _overlayVisible = false;
    _currentQuestion= _quizQuestions.nextQuestion;
    _questionNumber= _quizQuestions.questionNumber;
  }

  void choiceHandler (String choice){
    if (_questionNumber == _quizQuestions.length){
      Timer(Duration(seconds: 3), ()=> this.setState(() {
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new ScorePage(_score, _quizQuestions.length)));
      }));
    }

    _isCorrect = (choice == _currentQuestion.correctChoice);
    _score = (_isCorrect)? _score + 1 : _score;

    this.setState(() {_overlayVisible = true; });
    Timer(Duration(seconds: 3), ()=> this.setState(() {
      init();

    }));
  }

  Column createQuizQuestion(Question obj){
    return Column(
      children: <Widget>[
        Row(
          children: <Widget> [
            new QuestionBox(Colors.deepOrange,"A",obj.choiceA, (){choiceHandler("A");}),
            new QuestionBox(Colors.blue,"B",obj.choiceB, (){choiceHandler("B");})
          ],
        ),

        Row(
          children: <Widget> [
            new QuestionBox(Colors.yellow,"C",obj.choiceC, (){choiceHandler("C");}),
            new QuestionBox(Colors.green,"D",obj.choiceD, (){choiceHandler("D");})
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context){
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Container(
          decoration: BoxDecoration(
            image:new DecorationImage(image: AssetImage('assets/BG1.jpg'), fit: BoxFit.fill),
          ),
        ),
        new Column(
          children: <Widget>[
            Center(
              child: Container(
                color: new Color(0x476879ff),
                width: double.infinity,
                padding: new EdgeInsets.all(6.0),
                child: Center(
                  child: Text("PERGUNTA " + _questionNumber.toString(), style: new TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),),
                ),
              ),
            ),

            Center(
              child: new Container(
                width: double.infinity,
                decoration: new BoxDecoration(color: Colors.black54),
                padding: new EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0, bottom: 10),
                child: Text( _currentQuestion.questionText, style: new TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),),
              ),
            ),

            Padding(
               padding: EdgeInsets.only(top: 10.0),
            ),


            createQuizQuestion(_currentQuestion),

            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),

            _overlayVisible? new CustomOverlay(_isCorrect) : new Container(),
          ],
        )
      ],
    );
  }
}