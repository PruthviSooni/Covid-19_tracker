import 'package:flutter/material.dart';

import 'Card.dart';

class WorldWideData extends StatefulWidget {
  const WorldWideData({
    Key key,
    @required this.totalCases,
    @required this.totalRecoveries,
    @required this.dailyCases,
    @required this.totalDeaths,
  }) : super(key: key);

  final int totalCases;
  final int totalRecoveries;
  final int dailyCases;
  final int totalDeaths;

  @override
  _WorldWideDataState createState() => _WorldWideDataState();
}

class _WorldWideDataState extends State<WorldWideData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          ReuseCard(
            title: 'Total Cases',
            data: widget.totalCases,
            color: Color(0xffFFFF00),
          ),
          ReuseCard(
            title: 'Total Recoveries',
            data: widget.totalRecoveries,
            color: Color(0xff32cd32),
          ),
          ReuseCard(
            title: 'Daily Cases',
            data: widget.dailyCases,
            color: Color(0xffffc30b),
          ),
          ReuseCard(
            title: 'Total Deaths',
            data: widget.totalDeaths,
            color: Color(0xffdc143c),
          ),
        ],
      ),
    );
  }
}
