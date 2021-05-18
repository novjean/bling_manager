import 'package:bling_manager/models/transaction.dart';
import 'package:bling_manager/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: Image.asset(
                  'assets/images/waiting.png',
                  height: constraints.maxHeight * 0.6,
                ))
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Padding(
                padding: EdgeInsets.all(6),
                child: TransactionItem(transaction: transactions[index], deleteTx: deleteTx),
              );
            },
            itemCount: transactions.length,
          );
  }
}