import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petshop/widget/my_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{
  bool loading = false;
  late UserCredential userCredential;

  RegExp regExp = RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\])|(([a-zA-Z\-\d]+\.)+[a-zA-Z]{2,}))$');

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Future sendData()async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
      );
        FirebaseFirestore.instance.collection('userData').doc(userCredential.user?.uid).set({
          'firstName': firstName.text.trim(),
          'lastName': lastName.text.trim(),
          'email': email.text.trim(),
          'userid':userCredential.user?.uid,
          'password': password.text.trim(),
        });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("The password provided is too weak."),),);
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('The account already exists for that email.'),),);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('e'),),);
      setState(() {
        loading=false;
      });
    }
    setState(() {
      loading=false;
    });
  }

  void validation() {
    if (firstName.text
        .trim()
        .isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "firstName is Empty",
          ),
        ),);
      return;
    }
    if (lastName.text
        .trim()
        .isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "lastName is Empty",
          ),
        ),);
      return;
    }
    if (email.text
        .trim()
        .isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "email is Empty",
          ),
        ),);
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
    if (password.text
        .trim()
        .isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "password is Empty",
          ),
        ),);
      return;
    }
    else{
      setState(() {
        loading=true;
      });
      sendData();
    }
  }

  Widget button(
      {required String buttonName, required Color color, required Color textColor}) {
    return SizedBox(
      width: 120,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white,
        ),
        onPressed: () {},
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 20, color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Sign up",
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextField(
                      hintText: 'firstName',
                      obscureText: false,
                      controller: firstName,),
                    MyTextField(
                      hintText: 'lastName',
                      obscureText: false,
                      controller: lastName,),
                    MyTextField(
                      hintText: 'Email',
                      obscureText: false,
                      controller: email,),
                    MyTextField(
                      hintText: 'Password',
                      obscureText: true,
                      controller: password,),

                  ],
                ),
              ),
            loading?Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
              ],
            )
                :
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,

                    ),
                    child: const Text('Cancel'),
                  ),

                  const SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      validation();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,

                    ),
                    child: const Text('register'),
                  ),

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}