import 'package:flutter/material.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const Usrhome(),
    );
  }
}

class Usrhome extends StatelessWidget {
  const Usrhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      // Handle the action for the first icon button
                    },
                    icon: Icon(Icons.home),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      // Handle the action for the second icon button
                    },
                    icon: Icon(Icons.search),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      // Handle the action for the third icon button
                    },
                    icon: Icon(Icons.notifications),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      // Handle the action for the fourth icon button
                    },
                    icon: Icon(Icons.account_circle),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                // Map widget
                Positioned.fill(
                  child: Placeholder(), // Replace Placeholder with your map widget
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
