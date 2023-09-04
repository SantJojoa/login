import 'package:flutter/material.dart'; //Importamos la biblioteca de 'Material dart'

//Metodo main (Es lo primero que hace la app) - Metodo runApp - recibe la app para que la lea
void main() => runApp(MyApp());
final TextEditingController userNameController=TextEditingController();
final TextEditingController userPassController=TextEditingController();
//Creamos
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fullBody()
          );
        } 
      }

Widget fullBody(){
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage("https://s3.sportstatics.com/relevo/www/multimedia/202306/16/media/cortadas/nuevo-bernabeu-RDXB7HL4Thet1jLf4cGVW5N-1200x648@Relevo.jpeg"),
        fit: BoxFit.cover
        ), 
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          appName(),
          userNameField(),
          passwordField(),
          login()
        ],)
      
  )
  );
}

Widget appName(){
  return Text(
    "Iniciar Sesion",
    style: TextStyle(
      color: Colors.yellow,
      fontSize: 30,
      fontStyle: FontStyle.normal
    ),
  );
    
  }

Widget userNameField() {
  return  Container(
    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
    child: TextField(
      controller: userNameController,
      style: TextStyle(color:Colors.white),
      decoration: InputDecoration(
        labelText: "Nombre de usuario",
        labelStyle: TextStyle(color: Colors.white),
        fillColor: Color.fromARGB(50, 217, 214, 214),
        filled: true
      ) ,
    ),
  );
}

Widget passwordField() {
  return  Container(
    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
    child: TextField(
      controller: userPassController,
      obscureText: true,
      style: TextStyle(color:Colors.white),
      decoration: InputDecoration(
        labelText: "Contraseña",
        labelStyle: TextStyle(color: Colors.white),
        fillColor: Color.fromARGB(50, 217, 214, 214),
        filled: true
      ) ,
    ),
  );
}

Widget login(){
  return Center(
    child: ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(90, 1217, 214, 214))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.login_outlined),
          SizedBox(width: 7,),
          Text("Ingresar")
        ],
      ),
      onPressed: (){
        print(DateTime.now());
        print(userNameController.text);
        print(userPassController.text);
      },
    ),
  );
}
