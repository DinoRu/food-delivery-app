// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_app/components/my_buttion.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;
  Map<Addon, bool> selectedAddons = {};
  FoodDetailPage({super.key, required this.food}) {
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  void addToCart(Food food, List<Addon> selectedAddons) {
    List<Addon> currentSelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentSelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentSelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  // food image
                  Image.asset(widget.food.imgPath),

                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // food name
                        Text(
                          widget.food.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // food price
                        Text(
                          "\$${widget.food.price}",
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        const SizedBox(height: 10),
                        // food description
                        Text(
                          widget.food.description,
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        // addons title
                        Text(
                          'Add-ons',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                        // food addons
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.food.availableAddons.length,
                              itemBuilder: (context, i) {
                                Addon addon = widget.food.availableAddons[i];
                                return CheckboxListTile(
                                    title: Text(addon.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inversePrimary)),
                                    subtitle: Text("\$${addon.price}"),
                                    value: widget.selectedAddons[addon],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        widget.selectedAddons[addon] = value!;
                                      });
                                    });
                              }),
                        ),
                        const SizedBox(height: 44),
                        MyButton(
                            text: 'Add to cart',
                            onTap: () {
                              addToCart(
                                  widget.food, widget.food.availableAddons);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const MyCartPage())));
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

        //Back button
        SafeArea(
          child: Opacity(
              opacity: 0.6,
              child: Container(
                margin: EdgeInsets.only(left: 25),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                ),
              )),
        )
      ],
    );
  }
}
