import 'package:flutter/material.dart';

import 'Card.dart';

class WorldWideData extends StatelessWidget {
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
            data: totalCases,
            color: Color(0xffFFFF00),
          ),
          ReuseCard(
            title: 'Total Recoveries',
            data: totalRecoveries,
            color: Color(0xff32cd32),
          ),
          ReuseCard(
            title: 'Daily Cases',
            data: dailyCases,
            color: Color(0xffffc30b),
          ),
          ReuseCard(
            title: 'Total Deaths',
            data: totalDeaths,
            color: Color(0xffdc143c),
          ),
        ],
      ),
    );
  }
}
