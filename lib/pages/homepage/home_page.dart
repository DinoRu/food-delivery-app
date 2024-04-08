import 'package:flutter/material.dart';
import 'package:food_app/components/food_title.dart';
import 'package:food_app/components/my_current_location.dart';
import 'package:food_app/components/my_description_box.dart';
import 'package:food_app/components/my_sliver_app_bar.dart';
import 'package:food_app/components/my_tab_bar.dart';
import 'package:food_app/components/mydrawer.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/pages/food_detail_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Food> filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // return list of foods in given category

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = filterMenuByCategory(category, fullMenu);
      return ListView.builder(
          itemCount: categoryMenu.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            final food = categoryMenu[i];
            return FoodTitle(
                food: food,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => FoodDetailPage(food: food))));
                });
          });
    }).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      drawer: MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, bool innerBoxIsScrolled) => [
                MySliverAppBar(
                    title: MyTabar(tabController: _tabController),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          indent: 25,
                          endIndent: 25,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        // Current location
                        MyCurrentLocation(),
                        // description box
                        MyDescriptionBox()
                      ],
                    ))
              ],
          body: Consumer<Restaurant>(
              builder: (context, restaurant, child) => TabBarView(
                  controller: _tabController,
                  children: getFoodInThisCategory(restaurant.menu)))),
    );
  }
}
