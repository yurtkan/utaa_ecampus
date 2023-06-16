import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenButtons extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const HomeScreenButtons({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(17),
            backgroundColor: Colors.white, // <-- Button color
            foregroundColor: Colors.blue, // <-- Splash color
          ),
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}
