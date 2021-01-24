

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final Function addTransaction;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTransaction);


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
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Цена'),
              controller: amountController,
            ),
            FlatButton(
              onPressed: () {
                addTransaction(titleController.text, double.parse(amountController.text));
                print(amountController);
              },
              child: Text('Добавить'),
              textColor: Colors.lightBlueAccent,
            )
          ],
        ),
      ),
    );
  }
}
