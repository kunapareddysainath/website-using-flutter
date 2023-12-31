import 'package:flutter/material.dart';
import 'package:homepage_flutter/widget/social_media_widget.dart';
import 'frequently_asked_widget.dart';
import 'information_widget.dart';
import 'legal_widget.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  Widget policyBar(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: Text("Privacy notice"),
          onTap: () {},
        ),
        _verticalSeparator(),
        InkWell(
          child: Text("Terms & Conditions"),
          onTap: () {},
        ),
        _verticalSeparator(),
        Text(
          'Copyright © All rights reserved with Sk Writes Private Limited',
          style: DefaultTextStyle.of(context).style,
        )
      ],
    );
  }

  Widget _verticalSeparator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("|", style: TextStyle(color: Colors.black)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(color: Colors.redAccent),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FAQSection(),
                Information(),
                Legal(),
                SocialMediaSection()
              ],
            ),
            policyBar(context)
          ],
        ),
      ),
    );
  }
}
