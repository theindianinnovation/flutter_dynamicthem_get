import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key key}) : super(key: key);

  @override
  FirstScreenState createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  final themeData = GetStorage();
  bool isdarkMode = false;
  @override
  void initState() {
    super.initState();
    themeData.writeIfNull("darkmode", false);
    isdarkMode = themeData.read("darkmode");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Theme Demo'),
      ),
      drawer: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: const Text("Indian Innovation"),
                accountEmail: const Text("indianinnovation@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/day.png"),
                ),
                decoration: BoxDecoration(
                  color: isdarkMode ? Colors.black : Colors.lightBlue,
                  image: DecorationImage(
                    image: AssetImage("assets/giphy.gif"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SwitchListTile(
                secondary: const Icon(Icons.ac_unit),
                title: const Text(
                  "Theme",
                ),
                value: isdarkMode,
                onChanged: (value) {
                  setState(() {
                    isdarkMode = value;
                  });
                  isdarkMode
                      ? Get.changeTheme(ThemeData.dark())
                      : Get.changeTheme(ThemeData.light());
                  themeData.write('darkmode', value);
                },
                activeThumbImage: const AssetImage("assets/half-moon.png"),
                inactiveThumbImage: const AssetImage("assets/sun.png"),
                activeColor: Colors.blue,
                inactiveTrackColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: const Icon(
            Icons.lightbulb_outline,
            color: Colors.amber,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
