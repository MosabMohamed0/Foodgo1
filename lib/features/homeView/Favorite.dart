import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/widgets/BurgerItemCard.dart';
import 'package:foodgo/data/data.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final favoriteList = burgerList.where((item) => item.isFavorite).toList();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Foodgo',
                          style: TextStyle(
                            fontSize: 45,
                            fontFamily: 'Lobster',
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Your favourite foods',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff6A6A6A),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                favoriteList.isEmpty
                    ? Column(
                        children: [
                          const SizedBox(height: 250),
                          Center(
                            child: Text(
                              "The Favorite page is empty",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 20),
                            ),
                          ),
                        ],
                      )
                    : DynamicHeightGridView(
                        builder: (BuildContext context, int index) {
                          return BurgerItemCard(
                            onFavoriteToggle: () {
                              setState(() {
                                final mainIndex =
                                    burgerList.indexOf(favoriteList[index]);
                                burgerList[mainIndex].isFavorite =
                                    !burgerList[mainIndex].isFavorite;
                              });
                            },
                            imagePath: favoriteList[index].imagePath,
                            title: favoriteList[index].title,
                            subtitle: favoriteList[index].subtitle,
                            rating: favoriteList[index].rating,
                            isFavorite: favoriteList[index].isFavorite,
                            description: favoriteList[index].description,
                            minutes: favoriteList[index].minutes,
                            price: favoriteList[index].price,
                          );
                        },
                        itemCount: favoriteList.length,
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
