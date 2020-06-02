import 'package:flutter/material.dart';

import 'Card.dart';

class WorldWideData extends StatelessWidget {
  WorldWideData({
    @required this.worldData,
  });

  final Map worldData;

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
            data: worldData['cases'].toString(),
            color: Color(0xffFFFF00),
          ),
          ReuseCard(
            title: 'Total Recoveries',
            data: worldData['recovered'].toString(),
            color: Color(0xff32cd32),
          ),
          ReuseCard(
            title: 'Active',
            data: worldData['active'].toString(),
            color: Color(0xffffc30b),
          ),
          ReuseCard(
            title: 'Total Deaths',
            data: worldData['deaths'].toString(),
            color: Color(0xffdc143c),
          ),
        ],
      ),
    );
  }
}
