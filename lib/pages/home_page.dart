import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // LOGO
          Padding(
            padding: const EdgeInsets.only(
                left: 80, right: 80, bottom: 40, top: 160),
            child: Image.asset('lib/assets/avocado.png'),
          ),

          // WE DELIVER GROCERY TO YOUR DOORSTEP
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'We deliver groceries at your doorstep',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(
            height: 24,
          ),

          // FRESH ITEMS EVERYDAY
          Text(
            'Fresh items everyday',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),

          Spacer(),

          // GET STARTED BUTTON
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MainPage())),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),

          Spacer(),
        ],
      ),
    );
  }
}
