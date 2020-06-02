import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tracker/screens/search.dart';

class RegionalStats extends StatelessWidget {
  final List countryList;

  const RegionalStats({Key key, this.countryList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.grey[800],
        scaffoldBackgroundColor: Colors.grey[900],
        fontFamily: 'Montserrat',
        appBarTheme: AppBarTheme(
          brightness: Theme.of(context).brightness,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Regional Stats of Countries'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: Search(countryList));
              },
            )
          ],
        ),
        body: countryList != null
            ? Container(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(18),
                            child: Image.network(
                              countryList[index]['countryInfo']['flag'],
                              width: 100,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                    countryList[index]['country'],
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                    'Total Cases: ' +
                                        countryList[index]['cases'].toString(),
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                    'Recovered: ' +
                                        countryList[index]['recovered']
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.greenAccent),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.only(
                                      left: 10, top: 5, bottom: 2),
                                  child: Text(
                                    'Deaths: ' +
                                        countryList[index]['deaths'].toString(),
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.redAccent),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: countryList == null ? 0 : countryList.length,
                ),
              )
            : Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
    );
  }
}
