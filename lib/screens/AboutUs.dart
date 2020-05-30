import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
      ),
      title: "My Card",
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.chevron_left),
                  label: Text(""),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('images/ic_user.png'),
                    backgroundColor: Colors.blueGrey,
                  ),
                  Text(
                    "Pruthvi Soni",
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "LEARNING FLUTTER",
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 3.0,
                    ),
                  ),
                  SizedBox(
                    width: 150.0,
                    child: Divider(
                      color: Colors.blueGrey,
                    ),
                  ),
                  Card(
                    color: Colors.blueGrey,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        size: 30,
                        color: Colors.white,
                      ),
                      title: Text(
                        "+91 7016260268",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.blueGrey,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        size: 30,
                        color: Colors.white,
                      ),
                      title: Text(
                        "pruthvisoni7@gmail.com",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
