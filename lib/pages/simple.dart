import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleScreen extends StatelessWidget {
  final String tabName;
  int screenNumber;

  SimpleScreen({
    super.key,
    required this.tabName,
    this.screenNumber = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'tabName: $tabName, screenNumber: $screenNumber',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SimpleScreen(
                        tabName: tabName,
                        screenNumber: screenNumber + 1,
                      )));
            },
            child: Text('Click me'),
          )
        ],
      ),
    );
  }
}
