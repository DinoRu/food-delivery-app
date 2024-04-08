import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/cart_item.dart';
import 'package:intl/intl.dart';

import 'food_model.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    //Burgers
    Food(
        name: 'Cheese Burger',
        description:
            "A sizzling 100% U.S. Beef patty and melty American cheese topped with ketchup, mustard, and pickles all on a lightly toasted bun.",
        price: 4.90,
        imgPath: "assets/burgers/1.png",
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: 'Frit', price: 0.99),
          Addon(name: 'Soda', price: 1.5),
        ]),
    Food(
        name: "Original Bacon CheeseBurger",
        description:
            "This is everything a Bacon Cheeseburger should be. We know, because we invented it. 100% U.S. Beef and hickory-smoked bacon—one of the world’s great duos. Add American cheese, lettuce, tomato, onions and pickles and you have an All-American Classic.",
        price: 5.89,
        imgPath: 'assets/burgers/2.png',
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: 'Frit', price: 4.05),
          Addon(name: 'Coca-Cola', price: 2.5)
        ]),
    Food(
        name: "Pape Burger",
        description:
            "Two juicy 100% U.S. Beef patties with two slices of melted American cheese. Finished off with lettuce, tomato, onion, pickles and our classic A&W Papa Sauce all on a lightly toasted bun… it doesn’t get better than this.",
        price: 3.75,
        imgPath: 'assets/burgers/3.png',
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: 'Frit', price: 4.05),
          Addon(name: 'Coca-Cola', price: 2.5)
        ]),
    Food(
        name: "Chicken Burger",
        description:
            "Two juicy 100% U.S. Beef patties with two slices of melted American cheese. Finished off with lettuce, tomato, onion, pickles and our classic A&W Papa Sauce all on a lightly toasted bun… it doesn’t get better than this.",
        price: 3.75,
        imgPath: 'assets/burgers/4.png',
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: 'Fri', price: 4.05),
          Addon(name: 'Juicy', price: 2.5)
        ]),

    //Salads
    Food(
        name: "Cesar Salad",
        description:
            "Back then, in the 1920s, during the Prohibition era, Tijuana was flourishing as many Californians, including Hollywood jet set, would often drive over to party and enjoy the good life",
        price: 7.99,
        imgPath: 'assets/salads/1.png',
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: 'Bread', price: 2.99),
          Addon(name: 'Extra Parmesan', price: 1.99)
        ]),
    Food(
        name: "Cobb Salad",
        description:
            "A shining example of American ingenuity and creativity, Cobb salad was invented in the 1930s at The Brown Derby, a famous Los Angeles restaurant ",
        price: 7.99,
        imgPath: 'assets/salads/2.png',
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: 'Bread', price: 2.99),
          Addon(name: 'Extra Parmesan', price: 1.99)
        ]),
    Food(
        name: "Conch Salad",
        description:
            "Conch salad is one of the most popular Bahamian dishes that is both a flavorful comfort food and a colorful, edible work of art.",
        price: 7.99,
        imgPath: 'assets/salads/3.png',
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: 'Bread', price: 2.99),
          Addon(name: 'Extra Parmesan', price: 1.99)
        ]),
    Food(
        name: "Waldorf Salad",
        description:
            "Waldorf salad had been invented in 1896 by Oscar Tschirky, a dining room manager at New York's Waldorf-Astoria Hotel",
        price: 5.99,
        imgPath: 'assets/salads/4.jpg',
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: 'Bread', price: 2.99),
          Addon(name: 'Extra Parmesan', price: 1.99)
        ]),
    Food(
        name: "Salpicón de res",
        description:
            "Salpicón de res is a flavorful Mexican salad that is popular throughout Latin America. It consists of beef steak pieces, onions, tomatoes, hot chiles, and avocado slices.",
        price: 10.99,
        imgPath: 'assets/salads/5.jpg',
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: 'Bread', price: 2.99),
          Addon(name: 'Extra Parmesan', price: 1.99)
        ]),

    //Drinks
    Food(
        name: "Cola",
        description:
            "Muddling is gently mashing herbs or fruits to release their juices.",
        price: 20,
        imgPath: 'assets/drinks/1.png',
        category: FoodCategory.drinks,
        availableAddons: [Addon(name: 'Spaghetti', price: 20)]),
    Food(
        name: "Tonik",
        description:
            "Muddling is gently mashing herbs or fruits to release their juices.",
        price: 3.5,
        imgPath: 'assets/drinks/2.png',
        category: FoodCategory.drinks,
        availableAddons: [Addon(name: 'Cake', price: 30.0)]),
    Food(
        name: "Strawberry",
        description:
            "Muddling is gently mashing herbs or fruits to release their juices. ",
        price: 5.96,
        imgPath: 'assets/drinks/3.png',
        category: FoodCategory.drinks,
        availableAddons: [Addon(name: 'Stek Beef', price: 56)]),
    Food(
        name: "Pinacolada",
        description:
            "Muddling is gently mashing herbs or fruits to release their juices. ",
        price: 2.99,
        imgPath: 'assets/drinks/5.png',
        category: FoodCategory.drinks,
        availableAddons: [Addon(name: 'Vegan Eat', price: 30.9)]),

    //Sides
    Food(
        name: "Fries",
        description: "Kitchen Fri and Fries",
        price: 7.99,
        imgPath: 'assets/Sides/1.png',
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: 'Coca Cola', price: 5.9),
          Addon(name: 'Kitchen', price: 10)
        ]),
    Food(
        name: "Frit & Ketchup",
        description: "Eat with Kitchen Frit",
        price: 20.8,
        imgPath: 'assets/Sides/2.png',
        category: FoodCategory.sides,
        availableAddons: [Addon(name: 'Juice', price: 5.0)]),
    Food(
        name: "Fri and Salad",
        description: "",
        price: 20.4,
        imgPath: 'assets/Sides/3.png',
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: 'Kitchen frit', price: 2.09),
          Addon(name: 'Juice', price: 4.0)
        ]),
    Food(
        name: "Gateau Garni",
        description: "",
        price: 34.8,
        imgPath: 'assets/Sides/4.png',
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: 'Honey', price: 5.5),
          Addon(name: 'Tea', price: 4.5),
        ]),
    Food(
        name: "Pastel Four",
        description: "",
        price: 25.09,
        imgPath: 'assets/Sides/5.png',
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: 'Milk', price: 10.9),
          Addon(name: 'Coffee', price: 5.5)
        ]),

    //Desserts
    Food(
        name: "Fries",
        description: "Kitchen Fri and Fries",
        price: 7.99,
        imgPath: 'assets/deserts/1.jpg',
        category: FoodCategory.deserts,
        availableAddons: [
          Addon(name: 'Coca Cola', price: 5.9),
          Addon(name: 'Kitchen', price: 10)
        ]),
    Food(
        name: "Ice cream with Chocolat",
        description: "Good dessert .....",
        price: 7.99,
        imgPath: 'assets/deserts/2.jpg',
        category: FoodCategory.deserts,
        availableAddons: [
          Addon(name: 'Coca Cola', price: 5.9),
          Addon(name: 'Kitchen', price: 10)
        ]),
    Food(
        name: "Open sandwich with salmon cream avocado",
        description: "Sweet dessert for healthy....",
        price: 7.99,
        imgPath: 'assets/deserts/3.jpg',
        category: FoodCategory.deserts,
        availableAddons: [
          Addon(name: 'Coca Cola', price: 5.9),
          Addon(name: 'Kitchen', price: 10)
        ]),
    Food(
        name: "Pistachio croissant",
        description: "Italian Croissant for Dessert",
        price: 7.99,
        imgPath: 'assets/deserts/4.jpg',
        category: FoodCategory.deserts,
        availableAddons: [
          Addon(name: 'Latte', price: 6.0),
          Addon(name: 'Cappucino', price: 10)
        ]),
    Food(
        name: "Baklava macro",
        description: "Sweet dessert with Honey from Mexico",
        price: 27.99,
        imgPath: 'assets/deserts/5.jpg',
        category: FoodCategory.deserts,
        availableAddons: [
          Addon(name: 'Americano', price: 5.9),
          Addon(name: 'Green Tea', price: 3.5)
        ]),
  ];

  // Delivery address
  String _deliveryAddress = 'Imama Shamilya 72';

  /*
    G E T T E R S
 */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*
    O P E R A T I O N S
 */

  // User cart
  List<CartItem> _cart = [];

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // Check if food is same
      bool isSameFood = item.food == food;

      //Check if list of addons is the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddon, selectedAddons);
      return isSameFood && isSameAddons;
    });
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddon: selectedAddons));
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int index = _cart.indexOf(cartItem);
    if (index != -1) {
      if (_cart[index].quantity > 1) {
        _cart[index].quantity--;
      } else {
        _cart.remove(index);
      }
    }
    notifyListeners();
  }

  // get total price
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddon) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItems = 0;
    for (CartItem cartItem in _cart) {
      totalItems += cartItem.quantity;
    }
    return totalItems;
  }

  //update delivery location
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*
    H E L P E R S
 */
  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    // format the date to include up to seconds only
    String formattedDate =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln("-----------------------");
    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddon.isNotEmpty) {
        receipt.writeln("Add-ons:");
        receipt.writeln("${_formatAddons(cartItem.selectedAddon)}");
      }
      receipt.writeln();
    }
    receipt.writeln("----------------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln();
    receipt.writeln('Delivery address: $deliveryAddress');
    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  //format list of addons into string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join("\n");
  }
}
