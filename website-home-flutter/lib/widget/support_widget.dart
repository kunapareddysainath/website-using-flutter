import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Support",
                  style: GoogleFonts.fredoka(fontSize: 24, color: Colors.blue),
                ),
              ],
            ),
            _buildText(
                "Welcome to our support page! We're here to assist you by providing information and resources to enhance your experience with our product. Whether you have questions, need troubleshooting assistance, or want to explore the full potential of our product, you're in the right place."),
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                  child: knowledgeBase(),
                ),
                Flexible(
                  child: communityForum(),
                ),
                Flexible(
                  child: securityAndPrivacy(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Thank you for choosing our product. We look forward to supporting you on your journey and ensuring you have a seamless and rewarding experience.",
                  style: GoogleFonts.lato(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget knowledgeBase() {
    return Column(
      children: [
        _buildHeader("Knowledge Base"),
        _buildText(
          "We are creating our product's knowledge base which will be a collection of articles, tutorials, and FAQs that will help you solve common problems and get the most out of our product. Once ready, you can browse through our articles or search to find what you're looking for.",
        ),
      ],
    );
  }

  Widget communityForum() {
    return Column(
      children: [
        _buildHeader("Community Forum"),
        _buildText(
          "Join our Sk Writes community forum which is going to be launched soon to connect with other users, ask questions, share tips, and provide feedback. This will be a great place to find answers, learn new things, and get help from other users.",
        ),
      ],
    );
  }

  Widget securityAndPrivacy() {
    return Column(
      children: [
        _buildHeader("Security & Privacy"),
        _buildText(
          "We take security and privacy seriously, and we want you to know that your data is in good hands. You can find a link to our security and privacy policy on this page, so you can feel confident that your information is protected.",
        ),
      ],
    );
  }

  Widget _buildText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _buildHeader(String text) {
    return Text(
      text,
      style: GoogleFonts.fredoka(fontSize: 20, color: Colors.blue),
    );
  }
}
