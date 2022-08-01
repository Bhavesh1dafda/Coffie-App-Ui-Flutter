import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeImagePath;
  final String coffiName;
  final String coffePrice;
  const CoffeeTile(
      {required this.coffeImagePath,
      required this.coffiName,
      required this.coffePrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        padding: EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              //image image
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(coffeImagePath),
            ),
            //coffe name
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffiName,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'With Almond Milk',
                    style: TextStyle(color: Colors.grey[780]),
                  ),
                ],
              ),
            ),
            //price

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$' + coffePrice),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(6)),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
