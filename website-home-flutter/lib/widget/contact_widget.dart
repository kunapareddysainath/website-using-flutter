import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Contact Us",
          style: GoogleFonts.fredoka(
            fontSize: 24,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: _buildContactInfoColumn(
                "Address:",
                "Sk Writes Private Limited\nSituated in the vibrant Borabanda area of Hyderabad,\nPincode: 500018",
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: _buildContactInfoColumn(
                "Connect with Us:",
                "E-mail: info@SkWrites.com\nPhone: +91-7981252711",
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        _buildContactText(
          "At Sk Writes Apps Private Limited, we welcome your inquiries and feedback. "
          "Don't hesitate to reach out—we're here to assist you.",
        ),
      ],
    );
  }

  Column _buildContactInfoColumn(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.fredoka(
            fontSize: 18,
          ),
        ),
        Text(
          content,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Text _buildContactText(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
    );
  }
}
