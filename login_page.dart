import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petshop/widget/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  bool loading=false;
  late UserCredential userCredential;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RegExp regExp = RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\])|(([a-zA-Z\-\d]+\.)+[a-zA-Z]{2,}))$');

  Future loginAuth()async{
    try {
     userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: password.text
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No user found for that email.'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Wrong password provided for that user.'),
          ),
        );
        setState(() {
          loading = false;
        });
      }
      setState(() {
        loading = false;
      });
    }
  }

  void validation(){
    if(email.text.trim().isEmpty&&password.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('All fields is empty'),
        ),
      );
      return;
    }
    if(email.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email is empty'),
        ),
      );
      return;
    }
    else if(!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please enter valid email",
          ),
        ),);
      return;
    }
    if(password.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('password is empty'),
        ),
      );
      return;
    }
    else{
      setState(() {
        loading = true;
      });
      loginAuth();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 140),
              child: Text(
                "Log In",
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                MyTextField(
                  controller: email,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                MyTextField(
                  controller: password,
                  hintText: 'Password',
                  obscureText: true,
                ),
              ],
            ),
           loading? const CircularProgressIndicator(): SizedBox(
              height: 60,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.teal,
                ),
                child: const Text("Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: (){
                  validation();
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("new user?",style: TextStyle(color: Colors.black),),
                Text("Register now",style: TextStyle(color: Colors.teal),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}