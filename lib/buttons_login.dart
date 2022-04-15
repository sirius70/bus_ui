import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bus_ui/screens/login.dart';

class Buttons_login extends StatefulWidget {
  const Buttons_login({Key? key}) : super(key: key);

  @override
  State<Buttons_login> createState() => _Buttons_loginState();
}

class _Buttons_loginState extends State<Buttons_login> {
  var busroutes= [
    "Ghamapur",
    "Ranjhi",
    "Satpula",
    "Teen patti"
  ];
  var Schools= [
    "st Gabriel",
    "st joseph",
    "st Xavier"
  ];

  String dropdownvalue = "Bus routes";
  String schoolname = "Schools";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Padding(
             padding: const EdgeInsets.only(left:130,right: 50),
             child: DropdownButton(
                 hint: Text("Bus",style: TextStyle(color: Colors.black)),
                 items: busroutes.map((String busroutes) {
                   return DropdownMenuItem(
                     value: busroutes,
                     child: Text(busroutes),
                   );
                 }).toList(),
          onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
          }),
           ),
            Padding(
              padding: const EdgeInsets.only(left:130,right: 50),
              child: DropdownButton(
                hint: Text("Schools",style: TextStyle(color: Colors.black)),
                  items: Schools.map((String schools) {
                    return DropdownMenuItem(
                      value: schools,
                      child: Text(schools),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      schoolname = newValue!;
                    });
                  }),
            ),
            Container(
              padding: EdgeInsets.only(left: 70),
              child: ElevatedButton(
                style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10,horizontal: 40))),
                child: Text("Enter"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Login();
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
