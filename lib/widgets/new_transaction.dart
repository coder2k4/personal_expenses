import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  /// Обрабатываем наши инпуты при сумбите каждого из них
  void _submitHandler() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) return;

    widget.addTransaction(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) return;
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Заголовок'),
              controller: _titleController,
              onSubmitted: (_) =>
                  _submitHandler(), // не используем передаваемый параметр
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Цена'),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) =>
                  _submitHandler(), // не используем передаваемый параметр
            ),
            Container(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate != null
                        ? 'Выбрана дата: ' + DateFormat('dd-MM-yyyy').format(_selectedDate)
                        : 'Дата еще не выбрана'),
                  ),
                  FlatButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Выберите дату',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            FlatButton(
              onPressed: _submitHandler,
              child: Text('Добавить'),
              textColor: Theme.of(context).textTheme.button.color,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
