import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
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
                      hintText: "Name",
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
                      hintText: "Enrollment no.",
                      border: OutlineInputBorder(),
                    ),
                  )),
              SizedBox(
                height: 10.0,
              ),
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
                height: 20.0,
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 0,horizontal: 50.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Re-enter password",
                      border: OutlineInputBorder(),
                    ),
                  )),
              SizedBox(
                height: 20.0,
              ),
              TextButton(
                onPressed: null,
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
