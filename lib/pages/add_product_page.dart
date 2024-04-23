import 'package:cafe_admin_01/widgets/drop_down_btn.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              const Text(
                'Add Cafe Menu',
                style: TextStyle( 
                    fontSize: 30,
                    color: Colors.indigoAccent,
                    fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    label: Text("Menu name"),
                    hintText: 'Enter your Menu Name'
                ),
              ),
               SizedBox(height: 10),
               TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    label: Text("Menu Description"),
                    hintText: 'Enter your Menu Description'
                ),
                maxLines: 4,
              ),
               SizedBox(height: 10),
               TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    label: Text("Image URL"),
                    hintText: 'Enter your Image URL'
                ),
              
              ),
               SizedBox(height: 10),
               TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    label: Text("Menu Price"),
                    hintText: 'Enter your Menu Price'
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Flexible(child: DropDownBtn(items: ['Cate1', 'Cate2', 'Cate3'])),
                  Flexible(child: DropDownBtn(items: ['Brand1', 'Brand2', 'Brand3'],)),
                ],
              ),
              SizedBox(height: 10),
              Text("Discount Offer Any ?"),
              SizedBox(height: 10),
              DropDownBtn(items: ['true', 'false'],)
            ],
          ),
        ),
      ),
    );
  }
}
