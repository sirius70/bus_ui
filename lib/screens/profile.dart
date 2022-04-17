import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
   File? image;
   bool isObscurePassword = true;
   bool isObscure = true;

   Future takePhoto(ImageSource source) async {
     try{
     final image1 = await ImagePicker().getImage(source: source);
     if (image1 == null) return;

     final imageTemporary = File(image1.path);
     setState(() {
       this.image = imageTemporary;
     });
   }  catch (e){
     print('Failed to pick image: $e');
   }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My profile"),
        // actions: <Widget>[
        //   InkWell(
        //     onTap: (
        //
        //         ) {},
        //     child: Padding(
        //       padding: EdgeInsets.fromLTRB(0, 0, 15.0, 0),
        //       child: Icon(
        //         Icons.edit,
        //         color: Colors.white,
        //       ),
        //     ),
        //   )
        // ],
      ),

      body: SingleChildScrollView(
         child: Stack(

        alignment: Alignment.center,
          children: [Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: Column(

          children: [
            imageProfile(),

            SizedBox(
              height: 50,
            ),

            // buildTextField("Name", "Hemashree", false),
            // buildTextField("Email", "hema@gmail.com", false),
            // buildTextField("Phone no.", "8896547123", false),
            //  buildTextField("Alternate Phone no.", "9632012596", false),
            // buildTextField("Password", "hello", true),


            ListTile(
              //leading: Icon(Icons.email),
              title: Text("Name"),
              subtitle: Text("Mikey"),
              trailing: Icon(Icons.arrow_forward_ios, size: 15,),
              onTap: (){
                _nameChange(context);
              },
            ),
            Divider(height: 0,),

            ListTile(
              //leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("mikey@gmail.com"),
              trailing: Icon(Icons.arrow_forward_ios, size: 15,),
              onTap: (){
                _emailChange(context);},
            ),
            Divider(height: 0,),

            ListTile(
              //leading: Icon(Icons.email),
              title: Text("Phone no."),
              subtitle: Text("9644528322"),
              trailing: Icon(Icons.arrow_forward_ios, size: 15,),
              onTap: (){
                _phoneChange(context);},
            ),
            Divider(height: 0,),

            ListTile(
              //leading: Icon(Icons.email),
              title: Text("Alternate Phone no."),
              subtitle: Text("9668577410"),
              trailing: Icon(Icons.arrow_forward_ios, size: 15, ),
              onTap: (){
                _altphoneChange(context);},
            ),
            Divider(height: 0,),

            ListTile(
              //leading: Icon(Icons.email),
              title: Text("Password"),
              subtitle: Text(isObscure == false?"hello": '${"Password".replaceAll(RegExp(r"."), "*")}'),
              trailing: Icon(Icons.arrow_forward_ios, size: 15,),
              onTap: (){
                _passwordChange(context);
              },
            ),
            Divider(height: 0,),
          ],
        ),
      ),],
      ),
    )
    );
  }


  Widget imageProfile(){
    return Center(
      child: Stack(
      children: [

        image != null?
      ClipOval(
          child: Image.file(image!, width: 160,  height: 160, fit: BoxFit.cover,))
              :ClipOval(
          child: Image.asset("assets/images/image.jpg",width: 160,  height: 160, fit: BoxFit.cover,),),

        Positioned(
          bottom: 10,
          right: 20,
          child: InkWell(
            onTap: (){
             _selectPhoto();
            },
            child: Icon(
            Icons.camera_alt,
            color: Colors.teal,
            size: 28,
          ),)
        ),
      ],
    ),
    );
  }

   _nameChange(BuildContext context) {
     showDialog(
         context: context,
         builder: (BuildContext context) {
           return AlertDialog(
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(20.0))),

             content: Container(
               width: 200.0,
               height: 150.0,
               decoration: BoxDecoration(
                 shape: BoxShape.rectangle,
                 color: const Color(0xFFFFFF),
               ),

               child: Column(
                 children: [
                   SizedBox(height: 18,),
                   buildTextField("Name", "Change name", false),
                   Material(
                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                     color: Colors.blueAccent,
                     child: OutlineButton(
                       child: Text(
                         'Save',
                         style: TextStyle(
                           fontSize: 13,
                           color: Colors.white,
                         ),
                         textAlign: TextAlign.justify,
                       ),
                       onPressed: (){
                         Navigator.pop(context);
                       },
                     ),
                   ),
                 ],
               ),
             ),
           );
         });
   }

   _emailChange(BuildContext context) {
     showDialog(
         context: context,
         builder: (BuildContext context) {
           return AlertDialog(
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(20.0))),

             content: Container(
               width: 200.0,
               height: 150.0,
               decoration: BoxDecoration(
                 shape: BoxShape.rectangle,
                 color: const Color(0xFFFFFF),
               ),

               child: Column(
                 children: [
                   SizedBox(height: 18,),
                   buildTextField("Email", "Change email", false),
                   Material(
                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                     color: Colors.blueAccent,
                     child: OutlineButton(
                       child: Text(
                         'Save',
                         style: TextStyle(
                           fontSize: 13,
                           color: Colors.white,
                         ),
                         textAlign: TextAlign.justify,
                       ),
                       onPressed: (){
                         Navigator.pop(context);
                       },
                     ),
                   ),
                 ],
               ),
             ),
           );
         });
   }

   _phoneChange(BuildContext context) {
     showDialog(
         context: context,
         builder: (BuildContext context) {
           return AlertDialog(
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(20.0))),

             content: Container(
               width: 200.0,
               height: 150.0,
               decoration: BoxDecoration(
                 shape: BoxShape.rectangle,
                 color: const Color(0xFFFFFF),
               ),

               child: Column(
                 children: [
                   SizedBox(height: 18,),
                   buildTextField("Phone no.", "Change phone no.", false),
                   Material(
                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                     color: Colors.blueAccent,
                     child: OutlineButton(
                       child: Text(
                         'Save',
                         style: TextStyle(
                           fontSize: 13,
                           color: Colors.white,
                         ),
                         textAlign: TextAlign.justify,
                       ),
                       onPressed: (){
                         Navigator.pop(context);
                       },
                     ),
                   ),
                 ],
               ),
             ),
           );
         });
   }

   _altphoneChange(BuildContext context) {
     showDialog(
         context: context,
         builder: (BuildContext context) {
           return AlertDialog(
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(20.0))),

             content: Container(
               width: 200.0,
               height: 150.0,
               decoration: BoxDecoration(
                 shape: BoxShape.rectangle,
                 color: const Color(0xFFFFFF),
               ),

               child: Column(
                 children: [
                   SizedBox(height: 18,),
                   buildTextField("Alternate Phone no.", "Change alternate no.", false),
                   Material(
                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                     color: Colors.blueAccent,
                     child: OutlineButton(
                       child: Text(
                         'Save',
                         style: TextStyle(
                           fontSize: 13,
                           color: Colors.white,
                         ),
                         textAlign: TextAlign.justify,
                       ),
                       onPressed: (){
                         Navigator.pop(context);
                       },
                     ),
                   ),
                 ],
               ),
             ),
           );
         });
   }

   _passwordChange(BuildContext context) {
     showDialog(
         context: context,
         builder: (BuildContext context) {
           return AlertDialog(
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(20.0))),

             content: Container(
               width: 200.0,
               height: 150.0,
               decoration: BoxDecoration(
                 shape: BoxShape.rectangle,
                 color: const Color(0xFFFFFF),
               ),

               child: Column(
                 children: [
                   SizedBox(height: 18,),
                   buildTextField("Change password", "Enter new password", true),
               Material(
                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
                       color: Colors.blueAccent,
                       child: OutlineButton(
                         child: Text(
                           'Save',
                           style: TextStyle(
                             fontSize: 13,
                             color: Colors.white,
                           ),
                           textAlign: TextAlign.justify,
                         ),
                         onPressed: (){
                           Navigator.pop(context);
                         },
                       ),
                     ),
                 ],
               ),
             ),
           );
         });
   }

  Future _selectPhoto() async {
    await showModalBottomSheet(
        context: context,
        builder: (context) =>
            BottomSheet(
              onClosing: () {},
              builder: (context) =>
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.camera),
                        title: Text('Camera'),
                        onTap: () {
                          Navigator.of(context).pop();
                          takePhoto(ImageSource.camera);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.filter),
                        title: Text('Pick a file'),
                        onTap: () {
                         Navigator.of(context).pop();
                          takePhoto(ImageSource.gallery);
                        },
                      )
                    ],
                  ),

            ));
  }

  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField){
     return Padding(
         padding: EdgeInsets.only(bottom: 30),
       child: TextField(
         obscureText: isPasswordTextField? isObscurePassword: false,
         decoration: InputDecoration(
               contentPadding: EdgeInsets.only(bottom: 5),
         labelText: labelText,
         floatingLabelBehavior: FloatingLabelBehavior.always,
           hintText: placeholder,
           hintStyle: TextStyle(
             fontSize: 16,
             fontWeight: FontWeight.bold,
             color: Colors.grey,
           )
         ),
       ),
     );
  }
}


