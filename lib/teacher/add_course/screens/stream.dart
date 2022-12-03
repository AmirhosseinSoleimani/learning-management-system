import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final StreamController<int> streamController = StreamController<int>();
  int? _randomValue;
  final Random randomNumber = Random(2);
  final textStyle = const TextStyle(fontSize: 20.0,color: Colors.blueGrey);
  final buttonStyle = const TextStyle(fontSize: 25.0,color: Colors.black);

  @override
  void initState() {
    streamController.stream.listen((updatedData) {
      setState(() {
        _randomValue = updatedData;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _randomValue.toString() ?? '',
            style: textStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: TextButton(
                  onPressed: (){
                    getRandomValue().listen((event) {
                      debugPrint('$event');
                      streamController.sink.add(event);
                    });
                  },
                  child: Text(
                    'Add Data',
                    style: buttonStyle,
                  ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Stream<int> getRandomValue() async*{
    int i = 10;
    while(i >= 0){
      await Future.delayed(const Duration(seconds: 2));
      yield randomNumber.nextInt(100);
      i--;
    }
  }
}
