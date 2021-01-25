import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class ListTransaction extends StatelessWidget {
  final List<Transaction> transactions;

  ListTransaction(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
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
                    transactions[index].mount.toStringAsFixed(2) + 'Р.',
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
                          .format(transactions[index].date),
                      //e.date.toString(),
                      style: TextStyle(color: Colors.black45),
                    ),
                    Text(
                      transactions[index].title,
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
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
