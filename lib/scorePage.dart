import 'package:flutter/material.dart';
import 'package:quiz_app/sign.dart';
import 'main.dart';

class ScorePage extends StatelessWidget{
  final int _score;
  final _totalQuestion;

  ScorePage(this._score, this._totalQuestion);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("PONTUAÇÃO", style: TextStyle(color: Colors.blue, fontSize:50.0,fontWeight: FontWeight.bold),),
          new Text(_score.toString() + "/" + _totalQuestion.toString(), style: TextStyle(color: Colors.blue, fontSize:30.0,fontWeight: FontWeight.bold),),
          new IconButton(
              icon: new Icon(
                  Icons.refresh), iconSize: 40.0, color: Colors.blue,
              onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new StartPage())
              )),
          Text("Jogar novamente", style: TextStyle(fontSize: 20),),
          Padding(
            padding: EdgeInsets.only(top: 40.0),
          ),
          new IconButton(icon: new Icon(Icons.exit_to_app),iconSize: 40.0, color: Colors.blue,

              onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new SignIn())
              )),
          Text("Sair", style: TextStyle(fontSize: 20),),

          //new IconButton(icon: new Icon(Icons.exit_to_app),iconSize: 80.0, color: Colors.blue,

             // onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new SignIn())
           //   )),
        ],
      )
    );
  }


}
