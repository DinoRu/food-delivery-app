import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {

    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary
    );
    var mySecondTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Delivery free
          Column(
            children: [
              Text('\$0.99', style: myPrimaryTextStyle,),
              Text('Delivery free', style: mySecondTextStyle),
            ],
          ),

          // delivery time
          Column(
            children: [
              Text('15-30 min', style: myPrimaryTextStyle,),
              Text('Delivery time', style: mySecondTextStyle,),
            ],
          )
        ],
      ),
    );
  }
}
