import 'package:flutter/material.dart';
import 'package:paystack_manager/models/payment_option.dart';

class PaymentOptions {
  /// List of payment options allowed
  ///
  /// ```Card option``` general
  ///
  /// ```Bank option``` Nigerian only
  ///
  /// ```Mono option``` Ghana only
  static List<PaymentOption> getList({required String currency}) {
    final cardOption = PaymentOption(
      name: "Card",
      iconData: Icons.credit_card,
      slug: "card",
      isCard: true,
    );

    final bankOption = PaymentOption(
      name: "Bank",
      iconData: Icons.balance,
      slug: "bank",
      isBank: true,
    );

    final mobileMoneyOption = PaymentOption(
      name: "Mobile Money",
      iconData: Icons.smartphone,
      slug: "momo",
      isMomo: true,
    );

    List<PaymentOption> paymentOptions = [];

    //add the card
    paymentOptions.add(cardOption);

    //only add mobile money if the currency is ghanian (GHS)
    if (currency.toUpperCase() == "NGN") {
      paymentOptions.add(bankOption);
    }

    //only add mobile money if the currency is ghanian (GHS)
    if (currency.toUpperCase() == "GHS") {
      paymentOptions.add(mobileMoneyOption);
    }

    return paymentOptions;
  }

  static List<PaymentOption> getMobileMoneyList() {
    return [
      PaymentOption(
        name: "MTN",
        iconData: Icons.smartphone,
        slug: "mtn",
        isMomo: true,
      ),
      PaymentOption(
        name: "Vodafone",
        iconData: Icons.smartphone,
        slug: "vod",
        isMomo: true,
      ),
      PaymentOption(
        name: "Airtel/Tigo",
        iconData: Icons.smartphone,
        slug: "tgo",
        isMomo: true,
      ),
    ];
  }

  static List<PaymentOption> getBankList() {
    return [
      PaymentOption(
        name: "First Bank of Nigeria",
        iconData: Icons.balance,
        slug: "011",
        isBank: true,
      ),
      PaymentOption(
        name: "Guaranty Trust Bank",
        iconData: Icons.balance,
        slug: "058",
        isBank: true,
      ),
      PaymentOption(
        name: "United Bank For Africa",
        iconData: Icons.balance,
        slug: "033",
        isBank: true,
      ),
      PaymentOption(
        name: "Zenith Bank",
        iconData: Icons.balance,
        slug: "057",
        isBank: true,
      ),
    ];
  }
}
