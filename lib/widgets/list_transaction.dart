import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class ListTransaction extends StatelessWidget {


  final List<Transaction> transactions;

  ListTransaction(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions
          .map((e) =>
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    e.mount.toString() + 'Р.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.orange,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('dd-MM-yyyy kk:mm:ss')
                          .format(e.date),
                      //e.date.toString(),
                      style: TextStyle(color: Colors.black45),
                    ),
                    Text(
                      e.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ))
          .toList(),
    );
  }
}
