import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class personalprofilePanel extends StatefulWidget {
  @override
  _personalprofilePanelState createState() => _personalprofilePanelState();
}

class _personalprofilePanelState extends State<personalprofilePanel> {
  final TextEditingController _fullnamecontroller = TextEditingController();
  final TextEditingController _staffID1controller = TextEditingController();
  final TextEditingController _gendercontroller = TextEditingController();
  final TextEditingController _agecontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();
  final TextEditingController _phone1controller = TextEditingController();

  String _fullname = "";
  String _staffID1 = "";
  String _gender = "";
  String _age = "";
  String _address = "";
  String _phone1 = "";

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
              backgroundColor: Colors.black, title: Text("Personal Profile")),
          body: Center(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      controller: _fullnamecontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: TextStyle(color: Colors.black),
                        icon: Icon(Icons.face_sharp, color: Colors.black),
                        errorStyle: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      controller: _staffID1controller,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Staff ID',
                        labelStyle: TextStyle(color: Colors.black),
                        icon: Icon(Icons.work_rounded, color: Colors.black),
                        errorStyle: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      controller: _gendercontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        labelStyle: TextStyle(color: Colors.black),
                        icon: Icon(Icons.person_outline_sharp,
                            color: Colors.black),
                        errorStyle: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      controller: _agecontroller,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        labelStyle: TextStyle(color: Colors.black),
                        icon: Icon(Icons.stairs_rounded, color: Colors.black),
                        errorStyle: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      controller: _addresscontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        labelStyle: TextStyle(color: Colors.black),
                        icon: Icon(Icons.home, color: Colors.black),
                        errorStyle: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      controller: _phone1controller,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Phone No.',
                        labelStyle: TextStyle(color: Colors.black),
                        icon: Icon(Icons.phone, color: Colors.black),
                        errorStyle: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: <Widget>[
                      
                    Padding(
                      padding: EdgeInsets.fromLTRB(130, 0, 0, 0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    minWidth: 150,
                    height: 50,
                    child: Text('Save', style: TextStyle(fontSize: 15)),
                    color: Colors.black,
                    textColor: Colors.white,
                    elevation: 15,
                    onPressed: _onSave,
                    ),),]),
        ])),
          ),
        ),
      ),
    );
  }

  Future<void> _onSave() async {
    _fullname = _fullnamecontroller.text;
    _staffID1 = _staffID1controller.text;
    _gender = _gendercontroller.text;
    _age = _agecontroller.text;
    _address = _addresscontroller.text;
    _phone1 = _phone1controller.text;

    ProgressDialog pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false);
    pr.style(
        message: '   Saving...',
        borderRadius: 20.0,
        backgroundColor: Colors.black,
        progressWidget: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white), strokeWidth: 5.0),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        messageTextStyle: TextStyle(
            color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600));
    await pr.show();

    http.post(
        "https://joshuaooigy.com/uumstaffhealthprofile/php/personalprofile.php",
        body: {
          "fullname": _fullname,
          "staffID1": _staffID1,
          "gender": _gender,
          "age": _age,
          "address": _address,
          "phone1": _phone1,
        }).then((res) {
      print(res.body);
      if (res.body == "succes") {
        Toast.show(
          "Personal Profile had successfully updated.",
          context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
        );
      } else {
        Toast.show(
          "Error.",
          context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
        );
      }
    }).catchError((err) {
      print(err);
    });
    await pr.hide();
  }


}
