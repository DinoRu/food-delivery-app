import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_app/components/my_buttion.dart';
import 'package:food_app/pages/delivery_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  String cardHolderName = '';

  void confirmToPay() {
    if (formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Confirm payment'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text("Card number: $cardNumber"),
                      Text("Expiry Date: $expiryDate"),
                      Text('Card holder name: $cardHolderName'),
                      Text('CVV: $cvvCode'),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const DeliveryProgressPage())));
                      },
                      child: const Text('Yes'))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Checkout'),
      ),
      body: Column(
        children: [
          //Credit card
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (CreditCardBrand brand) {},
          ),
          //Credit card form
          CreditCardForm(
            formKey: formKey, // Required
            cardNumber: cardNumber, // Required
            expiryDate: expiryDate, // Required
            cardHolderName: cardHolderName, // Required
            cvvCode: cvvCode, // Required
            onCreditCardModelChange: (CreditCardModel data) {
              setState(() {
                cardNumber = data.cardNumber;
                cardHolderName = data.cardHolderName;
                expiryDate = data.expiryDate;
                cvvCode = data.cvvCode;
              });
            }, // Required
          ),
          const Spacer(),
          MyButton(text: 'Pay now', onTap: confirmToPay),
          const SizedBox(height: 25)
        ],
      ),
    );
  }
}
