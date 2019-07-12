import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Transaction> transation = [
    Transaction(
      id: '1',
      title: 'New Shoes',
      amount: 80.00,
      data: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'New Shoes',
      amount: 80.00,
      data: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Budget'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: Text('Chart'),
              ),
              elevation: 5,
            ),
            Card(
              child: Text('List of Expenses'),
            )
          ],
        ),
      ),
    );
  }
}
