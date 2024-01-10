import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  Widget button({
    required String name,
    Color? color,
    Color? textColor,
  }){
    return  SizedBox(
      height: 45,
      width: 200,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: color,
          side: const BorderSide(color: Colors.teal),
        ),
        onPressed: (){},
        child:  Text(
          name,
          style: TextStyle(color: textColor),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: Center(
                  child: Image.asset('images/petlogo.jpg')),
          ),

          Expanded(
            child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Welcome to petapp",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                ),
                ),
                Column(

                  children: const [
                    Text("Order pets from our shop"),
                  ],
                ),
                button(name: 'Login', color: Colors.teal,textColor: Colors.white,
                ),
                button(name: 'signup', color: Colors.white,textColor: Colors.teal)
              ],
            ),
          ),
        ],
      ),
    );
  }
}