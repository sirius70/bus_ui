import "package:flutter/material.dart";
import 'package:bus_ui/buttons_login.dart';
import 'button_signup.dart';

void main(){
      runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: App_ui(),
      ));
}

class App_ui extends StatefulWidget {
  const App_ui({Key? key}) : super(key: key);

  @override
  State<App_ui> createState() => _App_uiState();
}

class _App_uiState extends State<App_ui> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Homepage"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50,left: 50),
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                ),
                child: Text("Login"),
                onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Buttons_login();
                    }));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50,left: 50),
              child: ElevatedButton(
                child: Text("Signup"),
                style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 35.0),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                          ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Buttons_signup();
                  }));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
