import 'package:flutter/material.dart';
import 'package:glitcheffect/glitcheffect.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/text_input.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  TextEditingController _emailcontroller = new TextEditingController();
  TextEditingController _setpasswordcontroller = new TextEditingController();
  TextEditingController _confirmpasswordcontroller = new TextEditingController();
  TextEditingController _usernamecontroller = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to ", style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 15, )
          
              ),),
              GlitchEffect(
                duration: Duration(seconds: 2) ,
                colors: [Colors.red, Colors.blue, Colors.green],
                child: Text("Chirp", style: GoogleFonts.lilyScriptOne(
                    textStyle: TextStyle(fontSize: 50, fontWeight: FontWeight.w500)
                ),),
              ),
          
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage("https://i.pinimg.com/236x/90/de/25/90de257fdac14d35d66a81ab8e282cad.jpg"), radius: 60,
                    ),
                    Positioned(
                        bottom: 0, right: 0,
                        child: Container(
                          padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white
                            ),
                            child: Icon(Icons.edit_rounded, size: 30,color: Colors.black,)))
                  ],
                ),
          
              SizedBox(height: 20,),
              Container(
                  margin: EdgeInsets.symmetric(horizontal:30),
          
                  child: TextInputField(controller: _usernamecontroller, myLabelText: 'Username', myIcon: Icons.person_2_outlined,)),
              SizedBox(height: 20,),
              Container(
                  margin: EdgeInsets.symmetric(horizontal:30),
          
                  child: TextInputField(controller: _emailcontroller, myLabelText: 'Email', myIcon: Icons.email_outlined,)),
              SizedBox(height: 20,),
              Container(
                  margin: EdgeInsets.symmetric(horizontal:30),
                  child: TextInputField(controller: _setpasswordcontroller, myLabelText: 'Set Password', myIcon: Icons.lock_open,toHide: true,)),
              SizedBox(height: 20,),
              Container(
                  margin: EdgeInsets.symmetric(horizontal:30),
                  child: TextInputField(controller: _confirmpasswordcontroller, myLabelText: 'Confirm Password', myIcon: Icons.lock_open,toHide: true,)),
              SizedBox(height: 30,),
              Container(
                  width: MediaQuery.of(context).size.width/3,
          
          
          
            ],
          ),
        ),
      ),

    );
  }
}
