import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/food_model.dart';

class FoodTitle extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const FoodTitle({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "\$ ${food.price}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      food.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ],
                )),
                const SizedBox(width: 5),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    food.imgPath,
                    height: 120,
                    width: 120,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            indent: 25,
            endIndent: 25,
            color: Theme.of(context).colorScheme.tertiary,
          )
        ],
      ),
    );
  }
}
