import 'package:flutter/material.dart';

class MostAffectedCountry extends StatelessWidget {
  final List countryData;
  MostAffectedCountry({this.countryData});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: <Widget>[
                Image.network(
                  countryData[index]['countryInfo']['flag'],
                  width: 60,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        countryData[index]['country'],
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Deaths: ' + countryData[index]['deaths'].toString(),
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
