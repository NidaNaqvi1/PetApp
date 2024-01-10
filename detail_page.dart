import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white),
          onPressed: (){},
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset('images/dog0.png'),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
             decoration: const BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(10),
                 topRight: Radius.circular(10),
               )
             ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Lucifer",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.black),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                           decoration: BoxDecoration(
                             color: Colors.black,
                             borderRadius: BorderRadius.circular(10)
                           ),
                            child: const Icon(Icons.remove,color: Colors.white,),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                               const Text("1",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                               const SizedBox(
                                 width: 10,
                               ),
                               Container(
                                   height: 40,
                                    width: 40,
                                   decoration: BoxDecoration(
                                   color: Colors.black,
                                   borderRadius: BorderRadius.circular(10)
                                   ),
                                       child: const Icon(Icons.add,color: Colors.white,),
                               ),
                        ],
                      ),
                      const Text("\$ 400",style: TextStyle(color: Colors.black,fontSize: 30,),)
                    ],
                  ),
                  const Text("Description",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                  const Text("A pet shop is a essential services retailer which sells animals and pets to the public. A variety of animal supplies in pet shops. The pets sold include Cats,Dogs,Horses,Bunnies,Birds.",style: TextStyle(color: Colors.black87, ),),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.shopping_cart,color: Colors.white,),
                        SizedBox(width: 10,),
                        Text("Add to Cart",style: TextStyle(fontSize: 20,color: Colors.white),)
                      ],
                    ),
                  ),
                )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
