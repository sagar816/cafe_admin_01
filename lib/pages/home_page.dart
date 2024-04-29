import 'package:cafe_admin_01/controller/home_controller.dart';
import 'package:cafe_admin_01/pages/add_product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        initState: (_) {},
        builder: (ctrl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('CafeApp Admin'),
            ),
            body: ListView.builder(
              // itemCount: 10,
              itemCount: ctrl.menus.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(ctrl.menus[index].name ?? ''),
                  // title: Text('Ram'),
                  subtitle: Text((ctrl.menus[index].price ?? 0).toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // ctrl.testMethod();
                      // ctrl.test;QD
                      // print("delete pressed");
                    },
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // print('add new data');
                Get.to(AddProductPage());
              },
              child: Icon(Icons.add),
            ),
          );
        });
  }
}
