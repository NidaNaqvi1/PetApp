import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  const BottomContainer({super.key,required this.image,required this.price,required this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 270,
        width: 220,
        decoration: BoxDecoration(
          color: Colors.blueGrey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/dog1.png'),
            ListTile(
              leading: Text(
                name,
                style: const TextStyle(fontSize: 20,color: Colors.black),
              ),
              trailing: Text(
                "\$ $price ",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Icon(Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
           // const Icon(Icons.female,
             // size: 30,
            //),
          ],
        ),
      ),
    );
  }
}