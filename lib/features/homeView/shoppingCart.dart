import 'package:flutter/material.dart';
import 'package:foodgo/features/homeView/TabControlle.dart';
import 'package:foodgo/features/homeView/payment.dart';
import 'package:foodgo/models/shoppingCart_item.dart';
import 'package:foodgo/widgets/OrderManager.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    List<shoppingCart_item> cartItems = OrderManager().orders;
    double total = 0;
    for (var item in cartItems) {
      total += item.currentPrice;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TabControlle()));
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/mosab.png"),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Your order",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: cartItems.isEmpty
                    ? Center(
                        child: Text(
                        "The cart is empty",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20),
                      ))
                    : ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Container(
                                    width: 70,
                                    child: Image.asset(item.image),
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.title,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                            "price:  \$${item.currentPrice.toStringAsFixed(2)}"),
                                        Text(
                                            "Spicy:  ${item.currentValue.toInt()}"),
                                        Text("portion:  ${item.portion}"),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () {
                                      setState(() {
                                        OrderManager().removeOrder(
                                            item.title, item.currentValue);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
              if (cartItems.isNotEmpty)
                Column(
                  children: [
                    Divider(
                      color: Colors.grey[400],
                      thickness: 1,
                      height: 20,
                      endIndent: 50,
                      indent: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "Total price",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "\$" + " " + "${total.toStringAsFixed(2)}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Spacer(),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          Payment(),
                                    ));
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
                                "ORDER NOW",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
