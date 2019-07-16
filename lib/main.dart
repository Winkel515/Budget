import 'package:flutter/material.dart';

import './widgets/TransactionForm.dart';
import './models/transaction.dart';
import './widgets/TransactionList.dart';
import './widgets/Chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            button: TextStyle(
              color: Colors.white,
            )),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      title: 'Budget',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
//    Transaction(
//      title: 'New Shoes',
//      amount: 80.00,
//      date: DateTime.now().subtract(Duration(days: 4)),
//    ),
//    Transaction(
//      title: 'New Computer',
//      amount: 500.00,
//      date: DateTime.now().subtract(Duration(days: 2)),
//    ),
  ];

  List<Transaction> get _recentTransaction {
    return _transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction({String title, double amount, DateTime date}) {
    Transaction newTransaction = Transaction(
      title: title,
      amount: amount,
      date: date,
    );

    setState(() {
      for (int i = 0; i < _transactions.length; i++) {
        if (newTransaction.date.compareTo(_transactions[i].date) == -1) {
          _transactions.insert(i, newTransaction);
          return;
        }
      }
      _transactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _showFormModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: TransactionForm(_addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Budget',
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _showFormModal(context);
              })
        ],
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Chart(_recentTransaction),
              TransactionList(_transactions, _deleteTransaction),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showFormModal(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
