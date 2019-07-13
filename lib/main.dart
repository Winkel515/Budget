import 'package:flutter/material.dart';
import './widgets/UserTransaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Budget'),
        ),
        body: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                UserTransaction(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
