import 'package:chirp/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:glitcheffect/glitcheffect.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/text_input.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  TextEditingController _emailcontroller = new TextEditingController();
   TextEditingController _passwordcontroller = new TextEditingController();


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlitchEffect(
              duration: Duration(seconds: 2) ,
              colors: [Colors.red, Colors.blue, Colors.green],
              child: Text("Chirp", style: GoogleFonts.lilyScriptOne(
                textStyle: TextStyle(fontSize: 50, fontWeight: FontWeight.w500)
              ),),
            ),
            SizedBox(height: 30,),
            Container(
                margin: EdgeInsets.symmetric(horizontal:30),

                child: TextInputField(controller: _emailcontroller, myLabelText: 'Email', myIcon: Icons.email_outlined,)),
            SizedBox(height: 20,),
            Container(
                margin: EdgeInsets.symmetric(horizontal:30),
                child: TextInputField(controller: _passwordcontroller, myLabelText: 'Password', myIcon: Icons.lock_open,toHide: true,)),
            SizedBox(height: 30,),
            Container(
                width: MediaQuery.of(context).size.width/3,

                child: ElevatedButton(onPressed: (){
                  AuthController.instance.login(_emailcontroller.text, _passwordcontroller.text);
                }, child: Text("Login")))

          ],
        ),
      ),

    );
  }
}
