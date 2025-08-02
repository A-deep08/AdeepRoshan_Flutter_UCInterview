import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String plot;
  const Description({super.key,
  required this.plot});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromRGBO(26, 28, 22, 1),
        ),
        width: 294,
        height: 144,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        child: SingleChildScrollView(
          child: Text(
            plot,
            style: TextStyle(color: Color.fromRGBO(226, 227, 216, 1)),
            
          ),
        ),
      ),
    );
  }
}
