import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final TextEditingController userNameController = TextEditingController();
final TextEditingController userPassController = TextEditingController();
String errorMessage = "";

const String user = "admin";
const String password = "123456";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My First App",
      home: Start(),
    );
  }
}

class Start extends StatefulWidget {
  Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  void _updateErrorMessage(String message) {
    setState(() {
      errorMessage = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fullBody(),
    );
  }

  Widget fullBody() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://www.realmadrid.com/img/cc_1280px/estadiodji_0030_16x9_20230901100113.jpg"),
              fit: BoxFit.cover)),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          appName(),
          userNameField(),
          passwordField(),
          login(),
          if (errorMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ),
        ]),
      ),
    );
  }

  Widget appName() {
    return Text(
      "Log in",
      style: TextStyle(
          color: Colors.black, fontSize: 30, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold ),
    );
  }

  Widget userNameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: TextField(
        controller: userNameController,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            labelText: "Username:",
            labelStyle: TextStyle(color: Colors.black),
            fillColor: Color.fromARGB(35, 104, 98, 98),
            filled: true),
      ),
    );
  }

  Widget passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: TextField(
        controller: userPassController,
        style: TextStyle(color: Colors.black),
        obscureText: true,
        decoration: InputDecoration(
            labelText: "Password:",
            labelStyle: TextStyle(color: Colors.black),
            fillColor: Color.fromARGB(35, 104, 98, 98),
            filled: true),
      ),
    );
  }

  Widget login() {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromARGB(90, 217, 214, 214)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.login),
            SizedBox(
              width: 7,
            ),
            Text("Login"),
          ],
        ),
        onPressed: () {
          final String username = userNameController.text;
          final String pass = userPassController.text;
          print(DateTime.now());
          print(userNameController.text);
          print(userPassController.text);
          if (username == user && pass == password) {
            setState(() {
              errorMessage = "";
            });
            errorMessage = "Successful Entry";
          } else {
            setState(() {
              errorMessage = "Incorrect user credentials";
            });
          }
        },
      ),
    );
  }
}
