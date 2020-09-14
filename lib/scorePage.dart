import 'package:flutter/material.dart';
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
                  Icons.refresh), iconSize: 80.0, color: Colors.blue,
                  onPressed: ()=> Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context)=> new StartPage()), (Route route) => route = null),
          )
        ],
      )
    );
  }


}
