import 'package:flutter/material.dart';
import './widgets/user_transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Расчет расходов'),
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              child: Text('Это карточка'),
              width: double.infinity,
            ),
            color: Colors.lightBlueAccent,
          ),

          UserTransactions(),
        ],
      ),
    );
  }
}
