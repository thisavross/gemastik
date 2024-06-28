import 'package:flutter/material.dart';
import 'package:safespace/auth/login_screen.dart';
import 'package:safespace/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
    apiKey: "AIzaSyBul74s9pY1vJuUzrzLMBr1UVPPZeXUc0M",
    appId: "1:254368335664:android:167a39b15d915bf5c0aaf5",
    messagingSenderId: "2543683356648",
    projectId: "safespace-953d9"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safespace',
      home: SafespaceScreen(),
    );
  }
}

class SafespaceScreen extends StatefulWidget {
  @override
  _SafespaceScreenState createState() => _SafespaceScreenState();
}

class _SafespaceScreenState extends State<SafespaceScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);
    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward().then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(5, 12, 156, 1),
                  Color.fromRGBO(53, 114, 239, 1),
                  Color.fromRGBO(133, 118, 255, 1),
                  Colors.purple,
                  Colors.orange,
                ],
              ),
            ),
          ),
          // Safespace text
          Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Text(
                'safespace',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: Text(
                  'Powered by Virya Team',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
