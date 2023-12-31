import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Legal extends StatelessWidget {
  const Legal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Legal",
              style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18)),
          Row(
            children: [
              InkWell(
                  child: Text("Privacy Notice",
                      style: TextStyle(color: Colors.black)),
                  onTap: () {}),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("|", style: TextStyle(color: Colors.black)),
              ),
              InkWell(
                child:
                    Text("Terms & Use", style: TextStyle(color: Colors.black)),
                onTap: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
