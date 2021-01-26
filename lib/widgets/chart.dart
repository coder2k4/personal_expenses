import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactionValues {

    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double sum;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          sum += recentTransaction[i].mount;
        }
      }

      return {'day': DateFormat.E().format(weekDay), 'amount': sum};
    });
  }

  @override
  Widget build(BuildContext context) {


    return Card(
      elevation: 6,
      child: Text('hello'),
    );
  }
}
