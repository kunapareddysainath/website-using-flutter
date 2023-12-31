import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils.dart';

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  List<Widget> buildInformationRow() {
    List<String> informationData = Utils.INFORMATIONFEATURES;

    List<Widget> informationDesign = [];

    for (String data in informationData) {
      informationDesign
          .add(Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        InkWell(
          child: Text(data),
          onTap: () {},
        ),
      ]));
    }

    return informationDesign;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Information",
              style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18)),
          ...buildInformationRow(),
        ],
      ),
    );
  }
}