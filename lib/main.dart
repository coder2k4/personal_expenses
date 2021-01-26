import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';

import 'models/transaction.dart';
import 'widgets/list_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Расчет расходов',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            )),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
          )
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'Новые тапочки',
    //   mount: 66.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Какие-то плюхи',
    //   mount: 1220.13,
    //   date: DateTime.now(),
    // ),
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

  void _startNewAddTransactions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Расчет расходов'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => _startNewAddTransactions(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Container(
                child: Text('Это карточка'),
                width: double.infinity,
              ),
              color: Colors.lightBlueAccent,
            ),
            ListTransaction(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startNewAddTransactions(context),
      ),
    );
  }
}
