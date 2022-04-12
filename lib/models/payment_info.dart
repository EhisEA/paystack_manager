import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paystack_manager/models/payment_card.dart';

class PaymentInfo {
  String secretKey;
  String reference;
  Widget? companyAssetImage;
  int amount;
  String country;
  String currency;
  String email;
  String firstName;
  String lastName;
  dynamic metadata;
  PaymentCard? paymentCard;

  String get formatedAmount {
    double hundredth = this.amount / 100;
    String hundredthInDecimal = NumberFormat("#,###.00").format(hundredth);
    return hundredthInDecimal;
  }

  PaymentInfo({
    required this.secretKey,
    required this.reference,
    required this.companyAssetImage,
    required this.amount,
    required this.country,
    required this.currency,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.metadata,
    this.paymentCard,
  });
  Map<String, dynamic> toMap() => {
        "email": this.email,
        "amount": this.amount,
        "currency": this.currency,
        "reference": this.reference,
        "metadata": this.metadata,
        "card": paymentCard?.toMap(),
      };
}
