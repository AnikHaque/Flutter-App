import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double count = 0;
  int MinusClicks = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  'Count:',
                  style: TextStyle(fontSize: 32),
                ),
                Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        count++;

                        setState(() {});
                        if (count >= 5) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text('Button pressed $count Times'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Okay'))
                                  ],
                                );
                              });
                        }
                      },
                      child: Icon(CupertinoIcons.plus),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (count > 0) {
                          count--;
                          MinusClicks++;
                          setState(() {});
                          if (count <= 0) {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(
                                        'Button pressed $MinusClicks Times'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Okay'))
                                    ],
                                  );
                                });
                          }
                        }
                      },
                      child: Icon(CupertinoIcons.minus),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
