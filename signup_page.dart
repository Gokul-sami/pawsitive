// signup_page.dart
import 'package:flutter/material.dart';
import 'login_page.dart'; // Import login page to navigate back after signup

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDQCZIMfHN9aVKdHF-t0ySlO6R2xU2BiHvSQ&s',
              fit: BoxFit.cover,
            ),
          ),
          // Signup content
          Column(
            children: [
              SizedBox(height: 100), // Adjust as needed
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              SignupForm(onSignupSuccess: () {
                // Navigate back to the login page after successful signup
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to login page
                  Navigator.pop(context);
                },
                child: Text('Back to Login'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  final VoidCallback onSignupSuccess;

  const SignupForm({Key? key, required this.onSignupSuccess}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              prefixIcon: Icon(Icons.person),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _confirmPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              prefixIcon: Icon(Icons.lock),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Implement your sign-up logic here
              final username = _usernameController.text;
              final password = _passwordController.text;
              final confirmPassword = _confirmPasswordController.text;
              print('Username: $username');
              print('Password: $password');
              print('Confirm Password: $confirmPassword');

              // Check if passwords match
              if (password != confirmPassword) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Error'),
                      content: Text('Passwords do not match.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
                return; // Exit the function
              }

              // Perform signup success action
              widget.onSignupSuccess();
            },
            child: Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
