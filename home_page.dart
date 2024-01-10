import 'package:flutter/material.dart';
import 'package:petshop/modles/categories_model.dart';
import 'package:petshop/modles/pet_categories_model.dart';
import 'package:petshop/provider/my_provider.dart';
import 'package:petshop/screen/categories.dart';
import 'package:petshop/widget/bottom_Container.dart' ;
import 'package:provider/provider.dart';
import 'modles/pet_model.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  // 1st
  List<CategoriesModle> dogList = [];
  // 2nd
  List<CategoriesModle> catList = [];
  // 3rd
  List<CategoriesModle> birdList = [];
  // 4th
  List<CategoriesModle> bunnyList = [];
  // 5th
  List<CategoriesModle> horseList = [];

  List<PetModel> singlePetList = [];

  List<PetCategoriesModel> dogCategoriesList = [];
  List<PetCategoriesModel> catCategoriesList = [];

  Widget categoriesContainer({required Function onTap, required String  image,required String name})
  {
    return Column(
      children: [
      GestureDetector(
        onTap: (){onTap;},
         child: Container(
           margin: const EdgeInsets.only(left: 15),
           height: 50,
           width: 50,
           decoration: BoxDecoration(
             image: DecorationImage(image: NetworkImage(image),),
             color: Colors.white,
             borderRadius: BorderRadius.circular(10),
           ),
         ),
       ),
        Text(
          name,
          style: const TextStyle(fontSize: 10,color: Colors.black),),
      ],
    );
  }

  Widget drawerItem({required String name,required IconData icon}){
    return ListTile(
      leading: Icon(
         icon,
          color: Colors.black),
      title: Text(
        name,
        style: const TextStyle(fontSize: 20,color: Colors.black),),
    );
  }

  Widget dog(){
       return Row(
        children: dogList
            .map((e) => categoriesContainer(
            image: e.image,
            name: e.name,
             onTap: () {
              Navigator.push( context,
                  MaterialPageRoute(
                    builder: (context)=> dog()
                    //Categories(
                    //list: dogCategoriesList,
                 // ),
                ),
                );
             },)).toList(),
      );
  }
  Widget cat(){
    return Row(
      children: catList.map((e) => categoriesContainer(
        image: e.image,
        name: e.name,
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
             return Categories(list: catCategoriesList);}),);
        },
      )).toList(),
    );
  }
  Widget bird(){
    return Row(
      children: birdList.map((e) => categoriesContainer(
        image: e.image,
        name: e.name,
        onTap: (){},
      )).toList(),
    );
  }
  Widget bunny(){
    return Row(
      children: bunnyList.map((e) => categoriesContainer(
        image: e.image,
        name: e.name,
        onTap: (){},
      )).toList(),
    );
  }
  Widget horse(){
    return Row(
      children: horseList.map((e) => categoriesContainer(
        image: e.image,
        name: e.name,
        onTap: (){},
      )).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    // 1st
    provider.getDogCategory();
    dogList=provider.throwDogList;
    //2nd
    provider.getCatCategory();
    catList=provider.throwCatList;
    //3rd
    provider.getBirdCategory();
    birdList=provider.throwBirdList;
    //4th
    provider.getBunnyCategory();
    bunnyList=provider.throwBunnyList;
    //5th
    provider.getHorseCategory();
    horseList=provider.throwHorseList;

    /// single pet list ///
    provider.getPetList();
    singlePetList=provider.throwPetModelList;

    provider.getDogCategoriesList();
    dogCategoriesList=provider.throwDogCategoriesList;

    provider.getCatCategoriesList();
    dogCategoriesList=provider.throwCatCategoriesList;
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.grey[100],
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/background.png.jpg'),
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/woman-with-cat2.png'),
                  ),
                  accountName: Text("Nida Naqvi"),
                    accountEmail: Text('bsyedanida@gmail.com'),
                ),
                drawerItem(
                    icon: Icons.person,
                  name: "Profile",
                ),
                drawerItem(
                  icon: Icons.add_shopping_cart,
                  name: "Cart",
                ),
                drawerItem(
                  icon: Icons.shop,
                  name: "order",
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                const ListTile(
                   leading: Text("Communicate",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                ),
                ),
                 ),
                drawerItem(
                  icon: Icons.lock,
                  name: "Change",
                ),
                drawerItem(
                  icon: Icons.exit_to_app,
                  name: "Log Out",
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        actions: [
         Padding(
           padding: const EdgeInsets.all(9.0),
           child: CircleAvatar(
             backgroundColor: Colors.white,
              child: Image.asset('images/cat1.png'),
           ),
         )
         ]
      ),
        body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Pet",
                hintStyle: const TextStyle(color: Colors.black),
                prefixIcon: const Icon(Icons.search,color: Colors.black,),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide:  BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                )
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                dog(),
                cat(),
                bird(),
                bunny(),
                horse(),
                // categoriesContainer(image: 'images/cat.png',name: "Cats"),
                // categoriesContainer(image: 'images/dog.png',name: "Dogs"),
                // categoriesContainer(image: 'images/bird.png',name: "Birds"),
                // categoriesContainer(image: 'images/bunny.png', name: "Bunny"),
                // categoriesContainer(image: 'images/horse.png', name: "Horse"),
              ],
            ),
          ),
          Container(
               height: 510,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.count(
                       shrinkWrap: false,
                        primary: false,
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                       children: singlePetList.map(
                               (e) => BottomContainer(
                           image: e.image,
                           price: e.price,
                           name: e.name,
                       ),
                       ).toList()
                       /* children: const [
                     bottomContainer(
                   //    image: 'images/dog1.png',
                   //    name: 'Miko',
                   //       price: 12,
                  //   ),
                  //        bottomContainer(
                  //          image: 'images/dog1.png',
                // name: 'Miko',
                  //          price: 12,
                          ),
                          bottomContainer(
                            image: 'images/dog1.png',
                            name: 'Miko',
                            price: 12,
                          ),
                          bottomContainer(
                            image: 'images/dog1.png',
                            name: 'Miko',
                            price: 12,
                          ),
                   ],*/
                  ),
                ),
                  ],
      ),
    );
  }
}
