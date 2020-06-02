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
  dynamic data;
  dynamic countryData;
  var time;
  int timeStamp;
  int totalCases;
  int totalDeaths;
  int totalRecoveries;
  int dailyCases;
  String quote =
      "The easiest way to become a superhero now is to Just Stay At Home!";

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  worldwideStats() async {
    data = await NetworkHelper().getWorldWideData();
    setState(() {
      if (data != null) {
        timeStamp = data['updated'];
        time = new DateTime.fromMillisecondsSinceEpoch(timeStamp);
        print(time);
        print(data['cases'].toString());
        return data;
      } else {
        return print('data not found');
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
    setState(() {
      worldwideStats();
      countryStats();
    });
    print('fetching');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COVID-19 Tracker"),
      ),
      body: data != null
          ? SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.start,
              child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(Duration(seconds: 3));
                  fetchData();
                },
                backgroundColor: Colors.white,
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
              WorldWideData(worldData: data),
              //Updated Time
              Container(
                margin: EdgeInsets.all(9),
                child: Text(
                  "Updated on : " + time.toString(),
                  style: TextStyle(color: Colors.grey, letterSpacing: 1),
                ),
              ),
              //Effected Countries Title
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 0, left: 10),
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
