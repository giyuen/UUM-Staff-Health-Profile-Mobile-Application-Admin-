import 'package:flutter/material.dart';
import 'package:uumstaff_healthprofileadmin/loginPanel.dart';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:uumstaff_healthprofileadmin/userprofilePanel.dart';

class mainPanel extends StatefulWidget {
  @override
  _mainPanelState createState() => _mainPanelState();
}
 String suggestusername="";
class _mainPanelState extends State<mainPanel> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool searching, error;
  var data;
  String query;
  String dataurl =
      "https://joshuaooigy.com/uumstaffhealthprofile/php/searchsuggestion.php";
  // do not use http://localhost/ , Android emulator do not recognize localhost
  // insted use your local ip address or your live URL
  // hit "ipconfig" on Windows or "ip a" on Linux to get IP Address

  @override
  void initState() {
    searching = false;
    error = false;
    query = "";
    super.initState();
  }

  void getSuggestion() async {
    //get suggestion function
    var res = await http.post(dataurl + "?query=" + Uri.encodeComponent(query));
    //in query there might be unwant character so, we encode the query to url
    if (res.statusCode == 200) {
      setState(() {
        data = json.decode(res.body);
        //update data value and UI
      });
    } else {
      //there is error
      setState(() {
        error = true;
      });
    }
  }

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
            key: scaffoldKey,
            drawer: new Drawer(
              child: new ListView(
                padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          accountName: Text("Admin1"),
          accountEmail: Text("*******@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              "A",
              style: TextStyle(fontSize: 40.0, color: Colors.black),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Log Out'),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => loginPanel()));
          },
        ),
      ],
              ),
            ),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                leading: searching
                    ? IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          setState(() {
                            searching = false;
                          });
                        },
                      )
                    : Icon(Icons.play_arrow),
                title: searching ? searchField() : Text("Home"),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          searching = true;
                        });
                      }), 
                ],
                backgroundColor: Colors.black),
            body: Center(
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Container(
                        alignment: Alignment.center,
                        child: data == null
                            ? Container(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child:
                                    searching ? Text("Please wait") : Text("")
                                //if is searching then show "Please wait"
                                //else show search peopels text
                                )
                            : Container(
                                child: searching
                                    ? showSearchSuggestions()
                                    : Text(""),
                              )),
                               Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 0, 40),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            color: Colors.black,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.person,
                            ),
                            iconSize: 35,
                            color: Colors.white,
                            splashColor: Colors.white,
                            onPressed: () =>
                                scaffoldKey.currentState.openDrawer(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset('assets/images/logo1.png',
                        height: 250, scale: 1.7),
                         SizedBox(
                      height: 20,
                    ),
                    Container(
                        child:
                            Column(mainAxisSize: MainAxisSize.max, children: <
                                Widget>[
                      Container(
                          margin: const EdgeInsets.fromLTRB(0, 90, 20, 20),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Ink(
                                decoration: const ShapeDecoration(
                                  color: Colors.black,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.alarm,
                                    ),
                                    iconSize: 35,
                                    color: Colors.white,
                                    splashColor: Colors.white,
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                            elevation: 16,
                                            child: Container(
                                              height: 400.0,
                                              width: 360.0,
                                              child: ListView(
                                                children: <Widget>[
                                                  SizedBox(height: 20),
                                                  Center(
                                                    child: Text(
                                                      "Reminder",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(height: 30),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      child: Text(
                                                        " Medical Check-Up\n" +"          262543\n"+
                                                            "20/2/2021 11.30am",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          width: 18.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      child: Text(
                                                        "      Appointment\n" +"           262543\n"+
                                                            "25/2/2021 11.30am",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        border: Border.all(
                                                          width: 18.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "@",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "There are no any upcoming event.",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }),
                              )))
                    ]))
                  ])),
            ),
          ),
        ));
  }

  Widget showSearchSuggestions() {
    List<SearchSuggestion> suggestionlist =
        List<SearchSuggestion>.from(data["data"].map((i) {
      return SearchSuggestion.fromJSON(i);
    }));
    return Column(
      children: suggestionlist.map((suggestion) {
        return InkResponse(
            onTap: () {
              suggestusername=suggestion.name;
              Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => userprofilePanel()));
            },
            child: SizedBox(
                width: double.infinity, 
                child: Card(
                  color: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      suggestion.id + " "+suggestion.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )));
      }).toList(),
    );
  }

  Widget searchField() {
    return Container(
        child: TextField(
      autofocus: true,
      style: TextStyle(color: Colors.white, fontSize: 18),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white, fontSize: 18),
        hintText: "Search Staffs",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ), 
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ), 
      ), 
      onChanged: (value) {
        query = value; 
        getSuggestion(); 
      },
    ));
  }
}

class SearchSuggestion {
  String id, name;
  SearchSuggestion({this.id, this.name});

  factory SearchSuggestion.fromJSON(Map<String, dynamic> json) {
    return SearchSuggestion(
      id: json["id"],
      name: json["name"],
    );
  }
}
