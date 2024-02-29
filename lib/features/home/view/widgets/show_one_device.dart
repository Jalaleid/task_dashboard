import 'package:flutter/material.dart';

import '../../../../core/utils/fonts/fontStyles.dart';

class ShowOneDevice extends StatelessWidget {
  const ShowOneDevice({
    super.key,
    required this.name,
    required this.price,
    required this.time,
    required this.isAvaiable,
    required this.onPressed,
  });
  final String name;
  final double price;
  final String time;
  final bool isAvaiable;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      // width: 150,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade800),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor:
                    isAvaiable ? Colors.green.shade700 : Colors.redAccent,
                radius: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.5),
                child: Text(name),
              ),
            ],
          ),
          Text(
            time,
            style: Styles.textstyle24AndBold,
          ),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  isAvaiable ? Colors.green.shade700 : Colors.redAccent,
            ),
            child: Text(
              isAvaiable ? "Availabe" : "Reserved",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Text('Price Per Hour: $price\$')
        ],
      ),
    );
  }
}
