import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List countryList;

  Search(this.countryList);

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return ThemeData.dark();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.chevron_left),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countryList
        : countryList
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query))
            .toList();
    return Container(
      child: ListView.builder(
          itemCount: suggestionList.length,
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
                      suggestionList[index]['countryInfo']['flag'],
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
                            suggestionList[index]['country'],
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
                                suggestionList[index]['cases'].toString(),
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 10, top: 5),
                          child: Text(
                            'Recovered: ' +
                                suggestionList[index]['recovered'].toString(),
                            style: TextStyle(
                                fontSize: 16, color: Colors.greenAccent),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 10, top: 5, bottom: 2),
                          child: Text(
                            'Deaths: ' +
                                suggestionList[index]['deaths'].toString(),
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
          }),
    );
  }
}
