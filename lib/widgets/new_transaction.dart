import 'package:flutter/material.dart';
import 'package:flutter_expense_app/widgets/user_transactions.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
              onPressed: () {
                print(titleController.text);
              },
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(foregroundColor: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}
