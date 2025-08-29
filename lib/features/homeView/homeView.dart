import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/widgets/BurgerItemCard.dart';
import 'package:foodgo/data/data.dart';

class HomeVeiw extends StatefulWidget {
  const HomeVeiw({super.key});

  @override
  State<HomeVeiw> createState() => _HomeVeiwState();
}

class _HomeVeiwState extends State<HomeVeiw> {
  void toggleFavorite(int index) {
    setState(() {
      burgerList[index].isFavorite = !burgerList[index].isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Foodgo',
                        style: TextStyle(fontSize: 45, fontFamily: 'Lobster'),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Order your favourite food!',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff6A6A6A)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/images/mosab.png"),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Search bar & filter
              Row(
                children: [
                  Flexible(
                    flex: 6,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 4,
                      color: const Color(0xffFFFFFF),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const TextField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.search, color: Color(0xffEF2A39)),
                            hintText: "Search",
                            hintStyle: TextStyle(color: Color(0xffEF2A39)),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 4,
                      color: const Color(0xffEF2A39),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffEF2A39),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: const Icon(Icons.tune,
                            size: 25, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Grid of burgers
              DynamicHeightGridView(
                builder: (BuildContext context, int index) {
                  return BurgerItemCard(
                    imagePath: burgerList[index].imagePath,
                    title: burgerList[index].title,
                    subtitle: burgerList[index].subtitle,
                    rating: burgerList[index].rating,
                    isFavorite: burgerList[index].isFavorite,
                    description: burgerList[index].description,
                    minutes: burgerList[index].minutes,
                    price: burgerList[index].price,
                    onFavoriteToggle: () => toggleFavorite(index),
                  );
                },
                itemCount: burgerList.length,
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
