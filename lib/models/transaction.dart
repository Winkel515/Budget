import 'package:flutter/foundation.dart';

class Transaction {
  final String id = DateTime.now().toIso8601String();
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    @required this.title,
    @required this.amount,
    @required this.date,
  });
}
