import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:uumstaff_healthprofileadmin/displayPanel.dart';
import 'package:uumstaff_healthprofileadmin/healthprofilePanel2.dart';

class healthprofilePanel extends StatefulWidget {
  @override
  _healthprofilePanelState createState() => _healthprofilePanelState();
}

class _healthprofilePanelState extends State<healthprofilePanel> {
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
          title: Text(
            "Health Profile",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  Widget yesButton = FlatButton(
                    child: Text("Yes"),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      Toast.show("Deleting...", context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                    },
                  );
                  Widget noButton = FlatButton(
                    child: Text("No"),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  );
                  AlertDialog alert = AlertDialog(
                    title: Text("Delete ?"),
                    content: Text("Are you sure you want to delete?"),
                    actions: [
                      yesButton,
                      noButton,
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
              )
            ],
          backgroundColor: Colors.black,
        ), 
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      minWidth: 150,
                      height: 60,
                      child: Text("Add New", style: TextStyle(fontSize: 15)),
                      color: Colors.black,
                      textColor: Colors.white,
                      elevation: 15,
                      onPressed: _showForm,
                    ),
                       SizedBox(
                      height: 30,
                    ),
                     MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      minWidth: 280,
                      height: 60,
                      child: Text('Medical Check-Up\n'+"      20/9/2020", style: TextStyle(fontSize: 15)),
                      color: Colors.black,
                      textColor: Colors.white,
                      elevation: 15,
                      onPressed: _loadDetails,
                    ),
                     SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      minWidth: 280,
                      height: 60,
                      child: Text('Medical Check-Up\n'+"      03/6/2020", style: TextStyle(fontSize: 15)),
                      color: Colors.black,
                      textColor: Colors.white,
                      elevation: 15,
                      onPressed: _loadDetails,
                    ),
                     SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      minWidth: 280,
                      height: 60,
                      child: Text('Medical Check-Up\n'+"      20/3/2020", style: TextStyle(fontSize: 15)),
                      color: Colors.black,
                      textColor: Colors.white,
                      elevation: 15,
                      onPressed: _loadDetails,
                    ),
                     SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      minWidth: 280,
                      height: 60,
                      child: Text('Medical Check-Up\n'+"      03/1/2020", style: TextStyle(fontSize: 15)),
                      color: Colors.black,
                      textColor: Colors.white,
                      elevation: 15,
                      onPressed: _loadDetails,
                    ),
                     SizedBox(
                      height: 30,
                    ),
                    ]),
              ),
            ),
          ),
        ));
  }

  _showForm(){
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => healthprofilePanel2()));
  }

  _loadDetails() {
Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => displayPanel()));

  }
  
}