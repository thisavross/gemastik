import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:safespace/ChatScreen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Morning, Viriya.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'How are you feeling?',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(5, 12, 156, 1),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromRGBO(20, 43, 102, 1),
        color: Color.fromRGBO(53, 114, 239, 1),
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          print(index);
        },
        items: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const homepage()));
            },
            icon: const Icon(Icons.home),
            color: Colors.orange,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Chatscreen()),
              );
            },
            icon: Icon(Icons.chat),
            color: Colors.orange,
          )
        ],
      ),
    );
  }
}
