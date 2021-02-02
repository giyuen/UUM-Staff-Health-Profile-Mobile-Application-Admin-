import 'package:flutter/material.dart';
import 'package:uumstaff_healthprofileadmin/healthprofilePanel.dart';
import 'package:uumstaff_healthprofileadmin/mainPanel.dart';
import 'package:uumstaff_healthprofileadmin/personalprofilePanel.dart';

class userprofilePanel extends StatefulWidget {
  @override
  _userprofilePanelState createState() => _userprofilePanelState();
}

class _userprofilePanelState extends State<userprofilePanel> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              backgroundColor: Colors.black, title: Text(suggestusername)),
          body: Center(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    minWidth: 250,
                    height: 80,
                    child: Text('Personal Profile',
                        style: TextStyle(fontSize: 18)),
                    color: Colors.black,
                    textColor: Colors.white,
                    elevation: 15,
                    onPressed: _onPersonalProfile,
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    minWidth: 250,
                    height: 80,
                    child:
                        Text('Health Profile', style: TextStyle(fontSize: 18)),
                    color: Colors.black,
                    textColor: Colors.white,
                    elevation: 15,
                    onPressed: _onHealthProfile,
                                      ),
                                    ])),
                              ),
                            ),
                          ),
                        );
                      }
                    
                      void _onPersonalProfile() {
                        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => personalprofilePanel()));
                      }
                    
                      void _onHealthProfile() {
                        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => healthprofilePanel()));
  }
}
