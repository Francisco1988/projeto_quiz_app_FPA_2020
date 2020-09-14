import'package:flutter/material.dart';
import 'dart:math';


class CustomOverlay extends StatefulWidget{
    final bool _iscorrect;
    CustomOverlay(this._iscorrect);
    @override
    State createState() =>  new CustomOverlayState();
}

class CustomOverlayState extends State<CustomOverlay> with SingleTickerProviderStateMixin{
  Animation _iconAnimation;
  AnimationController _iconanimationController;

  @override
  void initState(){
    super.initState();
    _iconanimationController = new AnimationController(vsync: this, duration: new Duration(seconds: 2));
    _iconAnimation = new CurvedAnimation(parent: _iconanimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(()=> this.setState(() { }));
    _iconanimationController.forward();
  }


  @override
  void dispose(){
    _iconanimationController.dispose();
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: widget._iscorrect ? Colors.green : Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            width: double.infinity,
            child: new Transform.rotate(
                angle: _iconAnimation.value*2*pi,
              child: new Icon(widget._iscorrect? Icons.done : Icons.clear, size: _iconAnimation.value*40.0, color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }

}