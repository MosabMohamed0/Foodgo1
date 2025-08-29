import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodgo/models/shoppingCart_item.dart';
import 'package:foodgo/widgets/OrderManager.dart';

class BurgerDetails extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double rating;
  final bool isFavorite;
  final String description;
  final int minutes;
  final double price;

  const BurgerDetails({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.isFavorite,
    required this.description,
    required this.minutes,
    required this.price,
  });

  @override
  State<BurgerDetails> createState() => _BurgerDetailsState();
}

class _BurgerDetailsState extends State<BurgerDetails> {
  double currentValue = 0;
  int portion = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                  ],
                ),
                SizedBox(
                  child: Center(
                      child: Image.asset(
                    widget.imagePath,
                    scale: 0.2,
                  )),
                  height: 200,
                  width: MediaQuery.sizeOf(context).width,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.title + " " + widget.subtitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange),
                    const SizedBox(width: 20),
                    Text(
                      widget.rating.toString(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "   -   " + widget.minutes.toString() + ' mins',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.description,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Spicy: ${currentValue.toInt()}',
                          style: TextStyle(fontSize: 20),
                        ),
                        Slider(
                          value: currentValue,
                          min: 0,
                          max: 5,
                          divisions: 5,
                          label: currentValue.toStringAsFixed(1),
                          activeColor: Colors.red,
                          inactiveColor: Colors.grey[300],
                          onChanged: (value) {
                            setState(() {
                              currentValue = value;
                            });
                          },
                        ),
                        Row(
                          children: [
                            Text(
                              'Mild',
                              style: TextStyle(color: Colors.green),
                            ),
                            SizedBox(width: 80),
                            Text(
                              'Hot',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Portion',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (portion > 1) portion--;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.redAccent
                                                  .withOpacity(0.3),
                                              blurRadius: 10,
                                              offset: Offset(2, 4),
                                            ),
                                          ],
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Icon(Icons.remove,
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      '$portion',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(width: 10),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          portion++;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.redAccent
                                                  .withOpacity(0.3),
                                              blurRadius: 10,
                                              offset: Offset(2, 4),
                                            ),
                                          ],
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Icon(Icons.add,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 150,
                ),
                Row(
                  children: [
                    Spacer(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: Color(0xffEF2A39),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.5),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        '\$${widget.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF3C2F2F).withOpacity(0.5),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Added successfully')),
                              );
                              OrderManager().addOrder(shoppingCart_item(
                                  price: widget.price,
                                  title: widget.title,
                                  currentValue: currentValue,
                                  portion: portion,
                                  image: widget.imagePath));
                              print(portion);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: Color(0xFF3C2F2F),
                            padding: EdgeInsets.symmetric(
                                horizontal: 60, vertical: 20),
                          ),
                          child: Text(
                            "ADD TO CART",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
