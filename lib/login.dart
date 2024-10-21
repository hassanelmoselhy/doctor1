import 'package:flutter/material.dart';
import 'package:proto/textfield.dart'; // Ensure this import is correct

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
          height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/nh570elg.png'), // ضع مسار الصورة هنا
            fit: BoxFit.cover, // لضبط حجم الصورة لتغطية الشاشة بالكامل
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 300), // إضافة مساحة في الأعلى
                Text(
                  'Gerda',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
                SizedBox(height: 60),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Frame()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'signup',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Frame()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        'signin',
                        style: TextStyle(fontSize: 20, color: Color(0xFF2663e3)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
