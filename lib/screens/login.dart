import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bus_ui/features/bus_route.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 0,horizontal: 50.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(),
                  ),
                )),
            SizedBox(
              height: 20.0,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 0,horizontal: 50.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(),
                  ),
                )),
            SizedBox(
              height: 10.0,
            ),
            TextButton(
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Bus_routes();
                }));
                },
                child: Text("Enter",style: TextStyle(color: Colors.white),),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15,horizontal: 50.0))
              ),
            )
          ],
        ),
      )
    );
  }
}
