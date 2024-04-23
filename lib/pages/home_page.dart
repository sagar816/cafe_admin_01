import 'package:cafe_admin_01/pages/add_product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CafeApp Admin'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Title'),
            subtitle: Text('Price : 100'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                print("delete pressed");
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
  }
}
