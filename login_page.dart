// login_page.dart
import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'home_page.dart'; // Import your home page file

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDQCZIMfHN9aVKdHF-t0ySlO6R2xU2BiHvSQ&s',
                fit: BoxFit.cover,
              ),
            ),
            // Login content
            Column(
              children: [
                SizedBox(height: 100), // Adjust as needed
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                LoginForm(onLoginSuccess: () {
                  // Navigate to home page on login success
                  Navigator.pushReplacement( // Replace the current page with the home page
                    context,
                    MaterialPageRoute(builder: (context) => Usrhome()),
                  );
                }),
                Spacer(),
                ElevatedButton( // Added Sign Up Button
                  onPressed: () {
                    // Navigate to sign up page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: Text('Sign Up'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final VoidCallback onLoginSuccess;

  const LoginForm({Key? key, required this.onLoginSuccess}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _selectedRole; // New variable to store the selected role

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownButtonFormField<String>( // Added dropdown selection widget
            value: _selectedRole,
            hint: Text('Select Role'), // Placeholder text
            items: ['User', 'Shelter', 'Vet'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedRole = newValue;
              });
            },
          ),
          SizedBox(height: 20),
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
          ElevatedButton(
            onPressed: () {
              // Implement your login logic here
              final username = _usernameController.text;
              final password = _passwordController.text;
              final role = _selectedRole; // Get the selected role
              print('Username: $username');
              print('Password: $password');
              print('Role: $role');
              // Check login credentials
              if (username.isNotEmpty && password.isNotEmpty && role != null) {
                // Call the onLoginSuccess callback
                widget.onLoginSuccess();
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
