import 'package:food_app/models/food_model.dart';

class CartItem {
  Food food;
  List<Addon> selectedAddon;
  int quantity = 1;

  CartItem({required this.food, required this.selectedAddon});

  double get totalPrice {
    double addonPrice =
        selectedAddon.fold(0, (sum, addon) => sum + addon.price);
    return food.price + addonPrice;
  }
}
