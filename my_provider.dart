import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:petshop/modles/categories_model.dart';
import 'package:petshop/modles/pet_categories_model.dart';
import '../modles/pet_model.dart';

class MyProvider extends ChangeNotifier {
  List<CategoriesModle> dogList = [];
  late CategoriesModle dogModle;

  Future<void> getDogCategory() async {
    List<CategoriesModle>   newDogList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Categories')
        .doc('fAsBiNiM89fWj54WJE6m')
        .collection('Dog')
        .get();
    for (var element in querySnapshot.docs) {
      dogModle = CategoriesModle(
        image: element['image'],
        name: element['name'],
      );
      newDogList.add(dogModle);
      dogList = newDogList;
    }
    notifyListeners();
  }

  get throwDogList {
    return dogList;
  }

  /// 2nd category ///
  List<CategoriesModle> catList = [];
  late CategoriesModle catModle;

  Future<void> getCatCategory() async {
    List<CategoriesModle> newCatList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Categories')
        .doc('fAsBiNiM89fWj54WJE6m')
        .collection('Cat')
        .get();
    for (var element in querySnapshot.docs) {
      catModle = CategoriesModle(
        image: element['image'],
        name: element['name'],
      );
      newCatList.add(catModle);
      catList = newCatList;
    }
    notifyListeners();
  }

  get throwCatList {
    return catList;
  }

  /// 3rd category ///
  List<CategoriesModle> birdList = [];
  late CategoriesModle birdModle;

  Future<void> getBirdCategory() async {
    List<CategoriesModle> newBirdList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Categories')
        .doc('fAsBiNiM89fWj54WJE6m')
        .collection('Bird')
        .get();
    for (var element in querySnapshot.docs) {
      birdModle = CategoriesModle(
        image: element['image'],
        name: element['name'],
      );
      newBirdList.add(birdModle);
      birdList = newBirdList;
    }
    notifyListeners();
  }

  get throwBirdList {
    return birdList;
  }

  /// 4th category ///
  List<CategoriesModle> bunnyList = [];
  late CategoriesModle bunnyModle;

  Future<void> getBunnyCategory() async {
    List<CategoriesModle> newBunnyList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Categories')
        .doc('fAsBiNiM89fWj54WJE6m')
        .collection('Bunny')
        .get();
    for (var element in querySnapshot.docs) {
      bunnyModle = CategoriesModle(
        image: element['image'],
        name: element['name'],
      );
      newBunnyList.add(bunnyModle);
      bunnyList = newBunnyList;
    }
    notifyListeners();
  }

  get throwBunnyList {
    return bunnyList;
  }

  /// 5th category ///
  List<CategoriesModle> horseList = [];
  late CategoriesModle horseModle;

  Future<void> getHorseCategory() async {
    List<CategoriesModle> newHorseList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Categories')
        .doc('fAsBiNiM89fWj54WJE6m')
        .collection('Horse')
        .get();
    for (var element in querySnapshot.docs) {
      horseModle = CategoriesModle(
        image: element['image'],
        name: element['name'],
      );
      newHorseList.add(horseModle);
      horseList = newHorseList;
    }
    notifyListeners();
  }

  get throwHorseList {
    return horseList;
  }

  /// Single pet item ///
  List<PetModel> petModelList = [];
  late PetModel petModel;

  Future<void> getPetList() async {
    List<PetModel> newPetModelList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(
        'Pets').get();
    for (var element in querySnapshot.docs) {
      petModel = PetModel(
        image: element['image'],
        name: element['name'],
        price: element['price'],
      );
       newPetModelList.add(petModel);
      petModelList = newPetModelList;
    }
    notifyListeners();
  }

  get throwPetModelList {
    return petModelList;
  }

  /// dog categories list///
  List<PetCategoriesModel> dogCategoriesList = [];
  late PetCategoriesModel dogCategoriesModel;

  Future<void> getDogCategoriesList() async {
    List<PetCategoriesModel> newDogCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('petcategories')
      .doc('kNLI75ZQn749vujG0Tf2')
      .collection('dog')
        .get();
    for (var element in querySnapshot.docs) {
      dogCategoriesModel = PetCategoriesModel(
        image: element['image'],
        name: element['name'],
        price: element['price'],
      );
      newDogCategoriesList.add(dogCategoriesModel);
      dogCategoriesList = newDogCategoriesList;
    }
    notifyListeners();
  }

  get throwDogCategoriesList {
    return dogCategoriesList;
  }

  /// cat categories list///
  List<PetCategoriesModel> catCategoriesList = [];
  late PetCategoriesModel catCategoriesModel;

  Future<void> getCatCategoriesList() async {
    List<PetCategoriesModel> newCatCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('petcategories')
        .doc('kNLI75ZQn749vujG0Tf2')
        .collection('cat')
        .get();
    for (var element in querySnapshot.docs) {
      catCategoriesModel = PetCategoriesModel(
        image: element['image'],
        name: element['name'],
        price: element['price'],
      );
      newCatCategoriesList.add(catCategoriesModel);
      catCategoriesList = newCatCategoriesList;
    }
    notifyListeners();
  }

  get throwCatCategoriesList {
    return catCategoriesList;
  }
}