import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class ListTransaction extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  ListTransaction(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.55,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'Еще нет расходов!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '${transactions[index].amount.toStringAsFixed(2)}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat('dd-MM-yyyy kk:mm:ss')
                          .format(transactions[index].date),
                      style: TextStyle(color: Colors.black45, fontSize: 10),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).errorColor,
                      ),
                      onPressed: ()=>deleteTransaction(transactions[index].id),
                    ),
                  ),
                );

                // return Card(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Container(
                //         margin: EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 15,
                //         ),
                //         padding: EdgeInsets.all(10),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).primaryColor,
                //             width: 2,
                //           ),
                //         ),
                //         alignment: Alignment.center,
                //         child: Text(
                //           transactions[index].mount.toStringAsFixed(2) +
                //               ' руб.',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             color: Theme.of(context).primaryColor,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             DateFormat('dd-MM-yyyy kk:mm:ss')
                //                 .format(transactions[index].date),
                //             //e.date.toString(),
                //             style: TextStyle(color: Colors.black45),
                //           ),
                //           Text(
                //             transactions[index].title,
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 16,
                //               color: Colors.indigo,
                //             ),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
