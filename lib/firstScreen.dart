import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);

  @override
  FirstScreenState createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  final themedata = GetStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    themedata.writeIfNull("darkmode", false);
    bool isdarkMode=themedata.read("darkmode");
    return Scaffold(
        appBar: AppBar(
          title: Text('GetX shared Preference demo'),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Indian Innovation"),
                accountEmail: Text("indianinnovation@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/day.png"),
                ),
                decoration: BoxDecoration(
                    color: isdarkMode?Colors.black:Colors.lightBlue,
                    image: DecorationImage(
                        image: AssetImage("assets/giphy.gif"),
                        fit: BoxFit.cover)),
              ),

              SwitchListTile(
                secondary: Icon(Icons.ac_unit),
                title: Text("Theme",),
                value:isdarkMode,
                onChanged: (value) {
                  setState(() {
                   isdarkMode = value;
                });
                  isdarkMode?Get.changeTheme(ThemeData.dark()):Get.changeTheme(ThemeData.light());
                  themedata.write('darkmode', value);
                },
                activeThumbImage: AssetImage("assets/half-moon.png"),
                inactiveThumbImage: AssetImage("assets/sun.png"),
                activeColor: Colors.blue,
                inactiveTrackColor: Colors.grey,
              ),
              ListTile(
                title: Text("New group"),
                leading: Icon(Icons.group),
              ),
              ListTile(
                title: Text("Contacts"),
                leading: Icon(Icons.perm_contact_calendar),
              ),
              ListTile(
                title: Text("Calls"),
                leading: Icon(Icons.call),
              ),
              ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
              ),
              ListTile(
                title: Text("Ratings"),
                leading: Icon(Icons.star),
              ),
            ],
          ),
        ),
        body: Center(
          child: Container(
            child: Icon(
              Icons.lightbulb_outline,
              color: Colors.amber,
              size: 100.0,
            ),
          ),
        ));
  }
}
