class shoppingCart_item{

  final String title;
  final double price;
  final double currentValue; //Spicy
  int portion;
  final String image;
  double currentPrice=0;

  shoppingCart_item({
    required this.title,
    required this.price,
    required this.currentValue,
    required this.portion,
    required this.image,
  });

}