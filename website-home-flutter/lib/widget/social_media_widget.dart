import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils.dart';

class SocialMediaSection extends StatelessWidget {
  const SocialMediaSection({Key? key}) : super(key: key);

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  List<Widget> buildSocialMediaRow() {
    List<Map<String, dynamic>> socialMediaData = Utils.SOCAILMEDIAHANDLES;

    List<Widget> socialHandleDesign = [];

    for (var data in socialMediaData) {
      String imageUrl = data['imageUrl'];
      String name = data['name'];
      String url = data['url'];

      socialHandleDesign.add(
        InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                imageUrl,
                width: 24,
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(name, style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
          onTap: () {
            _launchUrl(url);
          },
        ),
      );
    }

    return socialHandleDesign;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Our Social Media",
              style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18)),
          ...buildSocialMediaRow()
        ],
      ),
    );
  }
}
