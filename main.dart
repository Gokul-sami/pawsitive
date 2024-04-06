import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(), // Change to light theme
      home: Scaffold(
        body: ListView(
          children: [
            Page1(),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center( // Center vertically
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image
          Container(
            width: 200, // Adjust width as needed
            height: 200, // Adjust height as needed
            decoration: BoxDecoration(
              color: Colors.white, // White background color
              shape: BoxShape.circle, // Shape of the container (circle in this case)
            ),
            child: ClipOval(
               child: Image.network(
              'data:image/jpeg;base64,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', // Image URL
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
            ),
          ),
          SizedBox(height: 20), // Add some space between the image and text
          // Application name text
          Text(
            'Pawsitive',
            style: TextStyle(
              fontSize: 24, // Adjust the font size as needed
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40), // Add space between the text and button
          // Let's Go button
          Container(
            padding: EdgeInsets.all(16),
            child: TextButton(
              onPressed: () {
                // Navigate to login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                'Let\'s Go',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
// Login Page Widget
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Text('This is the login page.'),
      ),
    );
  }
}
*/