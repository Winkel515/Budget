import 'package:flutter/material.dart';

import './TransactionForm.dart';
import './TransactionList.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '0',
      title: 'New Shoes',
      amount: 80.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: '1',
      title: 'New Computer',
      amount: 500.00,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String title, double amount) {
    Transaction newTransaction = Transaction(
      id: _userTransactions.length.toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TransactionForm(_addTransaction),
          TransactionList(_userTransactions),
        ],
      ),
    );
  }
}
