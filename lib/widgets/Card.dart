import 'package:flutter/material.dart';

class ReuseCard extends StatelessWidget {
  final String data;
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
            padding: EdgeInsets.only(top: 25),
            child: Text(
              "$data",
              style: TextStyle(
                fontSize: 36,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
