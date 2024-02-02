import 'dart:convert';

import 'package:coffee_app/screens/widgets/bottom_navigation.dart';
import 'package:coffee_app/screens/widgets/category_item.dart';
import 'package:coffee_app/screens/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedCategory = 0;
  int _selectedIndex = 1;
  BottomNavigationBarType _bottomNavType = BottomNavigationBarType.shifting;

  List<String> list = ['Cappuccino', 'Machiato', 'Latte', 'Americano'];
  List<Map<String, dynamic>> products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts().then((value) {
      setState(() {
        products = value;
      });
    });
  }

  Future<List<Map<String, dynamic>>> _loadProducts() async {
    String jsonString = await rootBundle.loadString('assets/products.json');
    List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.cast<Map<String, dynamic>>();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    list.length,
                    (index) => CategoryItem(
                      index: index,
                      title: list[index],
                      selectedCategory: selectedCategory,
                      onClick: () {
                        setState(() => selectedCategory = index);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: size.width / 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 239,
                ),
                itemCount: products.where((product) => product['category'] == list[selectedCategory]).length,
                itemBuilder: (context, productIndex) {
                  var filteredProducts = products.where((product) => product['category'] == list[selectedCategory]).toList();
                  return Item(
                    image: filteredProducts[productIndex]['image'],
                    name: filteredProducts[productIndex]['name'],
                    description: filteredProducts[productIndex]['description'],
                    price: filteredProducts[productIndex]['price'].toDouble(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SimpleBottomNavigation(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff6200ee),
        unselectedItemColor: const Color(0xff757575),
        type: _bottomNavType,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
