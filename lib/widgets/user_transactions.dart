import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'list_transaction.dart';
import 'new_transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Новые тапочки',
      mount: 66.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Какие-то плюхи',
      mount: 1220.13,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
        id: UniqueKey().toString(),
        title: title,
        mount: amount,
        date: new DateTime.now());

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        ListTransaction(_userTransactions),
      ],
    );
  }
}
