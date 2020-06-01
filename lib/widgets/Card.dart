import 'package:flutter/material.dart';
import 'package:number_slide_animation/number_slide_animation.dart';

class ReuseCard extends StatefulWidget {
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
  _ReuseCardState createState() => _ReuseCardState();
}

class _ReuseCardState extends State<ReuseCard> {
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
                  '${widget.title}',
                  style: TextStyle(fontSize: 20, color: widget.color),
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
            padding: EdgeInsets.only(top: 25),
            child: NumberSlideAnimation(
              number: '${widget.data}',
              duration: Duration(seconds: 2),
              curve: Curves.decelerate,
              textStyle: TextStyle(
                fontSize: 38,
                color: widget.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
