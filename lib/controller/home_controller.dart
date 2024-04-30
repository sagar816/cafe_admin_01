import 'package:cafe_admin_01/model/menu/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // String test = "test String";

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference menuCollection;

  TextEditingController menuNameCtrl = TextEditingController();
  TextEditingController menuDescriptionCtrl = TextEditingController();
  TextEditingController menuImgCtrl = TextEditingController();
  TextEditingController menuPriceCtrl = TextEditingController();

  String category = 'general';
  String type = 'no type';
  bool discount = false;

  List<Menu> menus = [];

  @override
  Future<void> onInit() async {
    menuCollection = firestore.collection('menus');
    await fetchMenus();
    super.onInit();
  }

  // testMethod() {
  //   print(test);
  // }

  addMenu() {
    try {
      DocumentReference doc = menuCollection.doc();
      Menu menu = Menu(
        id: doc.id,
        name: menuNameCtrl.text,
        category: category,
        description: menuDescriptionCtrl.text,
        price: double.tryParse(menuPriceCtrl.text),
        type: type,
        image: menuImgCtrl.text,
        discount: discount,
      );
      final menuJson = menu.toJson();
      doc.set(menuJson);
      Get.snackbar('Success', 'Menu Added Successfully',
          colorText: Colors.green);
      setValuesDefault();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  fetchMenus() async {
    try {
      QuerySnapshot menuSnapshot = await menuCollection.get();
      final List<Menu> retrievedMenus = menuSnapshot.docs
          .map((doc) => Menu.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      menus.clear();
      menus.assignAll(retrievedMenus);
      Get.snackbar('Success', 'Menu fetched Successfully',
          colorText: Colors.blue);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }        
  }

    deleteMenu(String id) async {
    try {
      await menuCollection.doc(id).delete();
      fetchMenus();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  setValuesDefault() {
    menuNameCtrl.clear();
    menuPriceCtrl.clear();
    menuDescriptionCtrl.clear();
    menuImgCtrl.clear();
    category = "general";
    type = "no-type";
    discount = false;
    update();
  }
}
