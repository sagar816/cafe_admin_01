import 'package:cafe_admin_01/controller/home_controller.dart';
import 'package:cafe_admin_01/widgets/drop_down_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        initState: (_) {},
        builder: (ctrl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Cafe Menu'),
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Add Cafe Menu',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.indigoAccent,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    TextField(
                      controller: ctrl.menuNameCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: Text("Menu name"),
                          hintText: 'Enter your Menu Name'),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: ctrl.menuDescriptionCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: Text("Menu Description"),
                          hintText: 'Enter your Menu Description'),
                      maxLines: 4,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: ctrl.menuImgCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: Text("Image URL"),
                          hintText: 'Enter your Image URL'),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: ctrl.menuPriceCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: Text("Menu Price"),
                          hintText: 'Enter your Menu Price'),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Flexible(
                            child: DropDownBtn(
                          items: ['Food', 'Drinks', 'Meal'],
                          selectedItemText: ctrl.category,
                          onSelected: (selectedValue) {
                            ctrl.category = selectedValue ?? 'general';
                            ctrl.update();
                            // print(selectedValue);
                          },
                        )),
                        Flexible(
                            child: DropDownBtn(
                          items: ['Type1', 'Type2', 'Type3'],
                          selectedItemText: ctrl.type,
                          onSelected: (selectedValue) {
                            ctrl.type = selectedValue ?? 'No Type';
                            ctrl.update();
                            // print(selectedValue);
                          },
                        )),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Discount Offer Any ?"),
                    SizedBox(height: 10),
                    DropDownBtn(
                      items: ['true', 'false'],
                      selectedItemText: ctrl.discount.toString(),
                      onSelected: (selectedValue) {
                        ctrl.discount =
                            bool.tryParse(selectedValue ?? 'false') ?? false;
                        ctrl.update();
                        // print(selectedValue);
                      },
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigoAccent,
                            foregroundColor: Colors.white),
                        onPressed: () {
                          ctrl.addMenu();
                        },
                        child: Text("Add Menu"))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
