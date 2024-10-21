import 'package:flutter/material.dart';
import 'package:proto/Welcome.dart'; // Ensure this import is correct

class Frame extends StatefulWidget {
  const Frame({super.key});

  @override
  FrameScreenState createState() => FrameScreenState();
}

class FrameScreenState extends State<Frame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Sign In'), // Optional: Add a title for the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add some padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content
          children: [
            Text(
              "Don't have an account?",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20), // Add spacing
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                 border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10), // Add spacing
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                 border: OutlineInputBorder(),
              ),
              obscureText: true, // Make the password field obscure
            ),
            SizedBox(height: 10), // Add spacing
            Text("Forget your password?"),
            SizedBox(height: 20), // Add spacing
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PageScreen()), // Ensure Page is the correct destination
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.blue, // Change color as needed
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Go to Welcome Page',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
