import 'dart:convert';
import 'dart:io';

import 'package:chirp/model/user.dart';
import 'package:chirp/view/screen/auth/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../view/screen/Home.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  File? proimg;

  pickImage()async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;

    final img = File(image.path);
    this.proimg = img;
  }

  //user state persistance

  late Rx <User?> _user;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialView);
  }

  _setInitialView(User? user){
    if(user==null){
      Get.offAll(()=> LoginScreen());
    }else{
      Get.offAll(()=> HomeScreen());
    }
  }


  //register
  void SignUp (
      String username, String email, String password, File? image)async{
    try{
      print(username);
      print(email);
      print(password);
      print(image);

      if(
      username.isNotEmpty && email.isNotEmpty && password.isNotEmpty && image!=null){
        UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        String downloadurl = await _uploadProPic(image);

        myUser user = myUser(name: username, email: email, profilePhoto: downloadurl, uid: credential.user!.uid);

        await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set(user.toJson());
      }else{
        Get.snackbar("Error Creating Account", "Please enter all the required fields");
      }

    }catch(e){
      print(e);
      Get.snackbar("Error Occurred", e.toString());
    }
  }

  Future<String> _uploadProPic(File image) async {
    try {
      final url = Uri.parse("https://api.cloudinary.com/v1_1/diyj7s2z0/upload");
      final request = http.MultipartRequest('POST', url)
        ..fields['upload_preset'] = 'myupload'
        ..files.add(await http.MultipartFile.fromPath(
          'file', // Key for the file parameter
          image.path,
        ));

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        final responseBody = jsonDecode(responseData.body);

        // Retrieve the secure URL
        final String downloadUrl = responseBody['secure_url'];
        print('Upload successful: $downloadUrl');
        return downloadUrl;
      } else {
        print('Upload failed with status: ${response.statusCode}');
        return "https://i.pinimg.com/236x/90/de/25/90de257fdac14d35d66a81ab8e282cad.jpg";
      }
    } catch (e) {
      print('Error: $e');
      return "https://i.pinimg.com/236x/90/de/25/90de257fdac14d35d66a81ab8e282cad.jpg";
    }
  }

  void login(String email, String password)async{

    try{
    if(email.isNotEmpty && password.isNotEmpty){
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    }else{
      Get.snackbar("Error Logging In", "Please enter all the Fields");
    }

    }catch(e){
    Get.snackbar("Error Logging In", e.toString());
    }
  }
}