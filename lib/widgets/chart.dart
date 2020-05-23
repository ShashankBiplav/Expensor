import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import '../widgets/charts_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart({this.recentTransactions});
  List<Map<String, Object>> get groupedTransactionvalues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalTransactionsInADay = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalTransactionsInADay += recentTransactions[i].amount;
        }
      }
      // print(DateFormat.E().format(weekDay));
      // print(totalTransactionsInADay);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalTransactionsInADay
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionvalues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(7),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionvalues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
                        child: ChartsBar(
                label: data['day'],
                spendingAmount: data['amount'],
                spendingPercentageOfTotal: totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
