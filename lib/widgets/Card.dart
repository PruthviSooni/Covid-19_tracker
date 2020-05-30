import 'package:flutter/material.dart';
import 'package:number_slide_animation/number_slide_animation.dart';

class ReuseCard extends StatelessWidget {
  final dynamic data;
  final String title;
  final Color color;
  final TextStyle textStyle;

  ReuseCard(
      {@required this.data,
      @required this.title,
      @required this.color,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 2,
      height: 100.0,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                child: Text(
                  '$title',
                  style: TextStyle(fontSize: 20, color: color),
                ),
                padding: EdgeInsets.only(
                  top: 5,
                ),
                alignment: Alignment.center,
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 30),
            child: NumberSlideAnimation(
              number: '$data',
              duration: Duration(seconds: 2),
              curve: Curves.decelerate,
              textStyle: TextStyle(
                fontSize: 40,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
