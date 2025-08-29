import 'package:foodgo/models/shoppingCart_item.dart';

class OrderManager {
  // دي نسخة واحدة بس من الكلاس هتشتغل في التطبيق كله
  static final OrderManager _instance = OrderManager._internal();

  // ده اللي هتستخدمه لما تيجي تستدعي الكلاس
  factory OrderManager() => _instance;

  // دي الليست اللي هنخزن فيها الطلبات
  final List<shoppingCart_item> _orders = [];

  // كونستراكتور داخلي بيمنع إنشاء أكتر من نسخة
  OrderManager._internal();

  // فنكشن تضيف طلب جديد
  void addOrder(shoppingCart_item item) {
    for (var existingItem in _orders) {
      if (existingItem.title == item.title &&
          existingItem.currentValue == item.currentValue) {
        existingItem.portion += item.portion;
        existingItem.currentPrice = item.price * existingItem.portion;
        return;
      }
    }
    print(item.currentPrice);
    if (item.currentPrice == 0) item.currentPrice = item.price * item.portion;
    _orders.add(item);
  }

  // فنكشن ترجّع كل الطلبات
  List<shoppingCart_item> get orders => _orders;

  void removeOrder(String title, double currentValue) {
    _orders.removeWhere(
        (item) => item.title == title && item.currentValue == currentValue);
  }
}
