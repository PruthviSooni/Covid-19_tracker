import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
    fetchData();
  }

  void worldwideStats() async {
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
        print('------------------');
        print(totalCases);
        print(totalRecoveries);
        print(dailyCases);
        print(totalDeaths);
        return data;
      } else {
        print('data not found');
      }
    });
  }

  void countryStats() async {
    countryData = await NetworkHelper().getCountryData(countryData);
    setState(() {
      if (countryData != null) {
        return countryData;
      } else {
        return print('data not found');
      }
    });
  }

  Future fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      worldwideStats();
      countryStats();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COVID-19 Tracker"),
      ),
      body: data != null
          ? SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.down,
              child: RefreshIndicator(
                backgroundColor: Colors.white,
                onRefresh: fetchData,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              "WORLDWIDE",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Montserrat',
                                  letterSpacing: 2),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegionalStats(
                                      countryList: countryData,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                "Regional",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                        ],
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
                      margin: EdgeInsets.only(top: 25, left: 10),
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
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Center(
                          child: Text(
                        'WE ARE TOGETHER IN THE FIGHT',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
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
