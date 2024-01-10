import 'package:flutter/material.dart';
import 'package:petshop/home_page.dart';
import '../modles/pet_categories_model.dart';
import '../widget/bottom_Container.dart';
class Categories extends StatelessWidget {
   Categories({super.key, required this.list});
   List<PetCategoriesModel> list=[];
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>const HomePage()));
          },
        ),
      ),
      body: GridView.count(
          shrinkWrap: false,
          primary: false,
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: list
              .map((e) => BottomContainer(
              image: e.image,
              price: e.price,
              name: e.name,
            ),
          ).toList()
      ),
    );
  }
}
