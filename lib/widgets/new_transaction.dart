import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function newTxHandler;

  NewTransaction(this.newTxHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            TextButton(
              onPressed: () => newTxHandler(titleController.text, double.parse(amountController.text)),
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(foregroundColor: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}
