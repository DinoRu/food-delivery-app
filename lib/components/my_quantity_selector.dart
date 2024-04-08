import 'package:flutter/material.dart';
import 'package:food_app/models/food_model.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  const QuantitySelector(
      {super.key,
      required this.food,
      required this.quantity,
      required this.onDecrement,
      required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).colorScheme.background),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onDecrement,
            child: Icon(
              Icons.remove,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 3),
          //display quantity
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
                child: Text(
              quantity.toString(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
          ),
          const SizedBox(width: 3),
          GestureDetector(
            onTap: onIncrement,
            child: Icon(
              Icons.add,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
