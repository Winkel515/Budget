import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function addTransaction;

  TransactionForm(this.addTransaction);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    final title = _titleController.text;
    final amount = _amountController.text.isEmpty
        ? -1
        : double.parse(_amountController.text);

    if (title.isEmpty || amount < 0) {
      return;
    }

    widget.addTransaction(
      title: title,
      amount: amount,
      date: _selectedDate,
    );

    Navigator.of(context).pop(); // Closes the modal on function run
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      }

      setState(() {
        _selectedDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _selectedDate == null
                        ? 'No Date Chosen'
                        : 'Picked date: ${DateFormat.yMd().format(_selectedDate)}',
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                'Add Transaction',
                style:
                    TextStyle(color: Theme.of(context).textTheme.button.color),
              ),
              onPressed: () => _submitData(),
            ),
          ],
        ),
      ),
    );
  }
}
