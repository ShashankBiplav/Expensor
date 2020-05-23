import 'package:flutter/material.dart';

class ChartsBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentageOfTotal;
  ChartsBar({this.label, this.spendingAmount, this.spendingPercentageOfTotal});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder :(ctx, constraints){
      return  Column(
      children: <Widget>[
        Container(
            height: constraints.maxHeight * 0.1,
            child: FittedBox(
                child: Text('₹${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(
          height: constraints.maxHeight * 0.05,
        ),
        Container(
          height: constraints.maxHeight * 0.7,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(255, 214, 0, 1), width: 1.2),
                    color: Color.fromRGBO(255, 249, 196, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercentageOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(233, 30, 99, 1), width: 2.0),
                    color: Color.fromRGBO(241, 134, 192, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.05,
        ),
        Container(height: constraints.maxHeight * 0.1,child: Text(label)),
      ],
    );
    });
  }
}
