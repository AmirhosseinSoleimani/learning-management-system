import 'package:flutter/material.dart';
import '../widgets/header_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0)
      ),
      child: Column(
        children: [
          HeaderWidget()
        ],
      ),
    );
  }
}
