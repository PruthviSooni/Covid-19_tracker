import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:tracker/screens/regionalStats.dart';
import 'package:tracker/services/networking.dart';
import 'package:tracker/widgets/mostaffectedcountrydata.dart';
import 'package:tracker/widgets/worldwidedata.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data;
  dynamic countryData;
  int totalCases;
  int totalDeaths;
  int totalRecoveries;
  int dailyCases;
  String quote =
      "The easiest way to become a superhero now is to Just Stay At Home!";

  @override
  void initState() {
    super.initState();
    countryStats();
    worldwideStats();
  }

  worldwideStats() async {
    data = await NetworkHelper().getWorldWideData();
    setState(() {
      if (data != null) {
        var totalCase = data['cases'];
        totalCases = totalCase;
        var recover = data['recovered'];
        totalRecoveries = recover;
        var deaths = data['deaths'];
        totalDeaths = deaths;
        var daily = data['todayCases'];
        dailyCases = daily;
        print(totalCases);
        print(totalDeaths);
        print(dailyCases);
        print(totalRecoveries);
        return data;
      } else {
        print('data not found');
      }
    });
  }

  countryStats() async {
    countryData = await NetworkHelper().getCountryData(countryData);
    setState(() {
      if (countryData != null) {
        return countryData;
      } else {
        return print('data not found');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    countryStats();
    return Scaffold(
      appBar: AppBar(
        title: Text("COVID-19 Tracker"),
        actions: [
          Tooltip(
            message: 'Regional',
            child: FlatButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegionalStats(
                        countryList: countryData,
                      ),
                    ),
                  );
                });
              },
              child: Icon(
                Ionicons.md_map,
                size: 30,
                color: Colors.white,
                semanticLabel: 'Regional',
              ),
            ),
          ),
        ],
      ),
      body: data != null
          ? SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //Covid quote
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.orange[100],
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "$quote",
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          letterSpacing: 1),
                    ),
                  ),
                  //Worldwide Title
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      "WORLDWIDE",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Montserrat',
                          letterSpacing: 2),
                    ),
                  ),
                  //worldwide stats
                  WorldWideData(
                      totalCases: totalCases,
                      totalRecoveries: totalRecoveries,
                      dailyCases: dailyCases,
                      totalDeaths: totalDeaths),
                  //Effected Countries Title
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      "Most Effected Countries",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Montserrat',
                          letterSpacing: 2),
                    ),
                  ),
                  countryData != null
                      ? MostAffectedCountry(countryData: countryData)
                      : CircularProgressIndicator(),
                ],
              ),
            )
          : Center(
              child: Container(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
    );
  }
}
