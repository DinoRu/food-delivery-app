class Food {
  final String name;
  final String description;
  final double price;
  final imgPath;
  final FoodCategory category;
  List<Addon> availableAddons;

  Food({
      required this.name,
      required this.description,
      required this.price,
      required this.imgPath,
      required this.category,
      required this.availableAddons,
  });
}

enum FoodCategory {
  burgers,
  salads,
  sides,
  deserts,
  drinks,
}

// Food addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price
  });
}