import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanAndPricing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildLeftColumn(),
            ),
            Expanded(
              child: _buildRightColumn(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader("Welcome to Sk Writes"),
        _buildSectionText(
          "Your Path to Business Excellence!",
          "🚀 Unlock Success with Our Production-Ready Templates!",
          "Ready to take your business to new heights? Look no further! Sk Writes presents a handpicked selection of production-ready templates designed to elevate your business. Whether you're a startup, small business, or an established enterprise, our templates are tailored to fuel your growth.",
        ),
        _buildSectionHeader("Why Choose Sk Writes Templates?"),
        _buildBulletPoints([
          "Versatility",
          "Ease of Use",
          "Impress your clients and customers with visually stunning templates that reflect the professionalism of your brand.",
          "Mobile Responsive",
          "In the age of mobile dominance, our templates are optimized for a seamless experience across devices.",
        ]),
      ],
    );
  }

  Widget _buildRightColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
            "Special Launch Offer: Rs 1499 for the First Month!"),
        _buildSectionText(
          "To celebrate our launch, we're offering an exclusive deal for early adopters. Get started for just Rs 1499 in the first month and enjoy the full suite of benefits our templates bring to your business.",
        ),
        _buildSectionHeader(
            "Ongoing Value: Rs 4999/Month from the Second Month"),
        _buildSectionText(
          "After the initial month, continue to experience the power of our templates for just Rs 4999 per month. It's an investment in the success and efficiency of your business.",
        ),
        _buildSectionHeader("Cancellation & Refund Policy"),
        InkWell(
          child: Text.rich(
            TextSpan(
              text:
                  "We value your satisfaction and understand that circumstances may change. Before making a purchase, review our ",
              style: GoogleFonts.lato(fontSize: 16),
              children: [
                TextSpan(
                  text: "cancellation and refund policy",
                  style: GoogleFonts.lato(
                    color: Colors.blue,
                    fontStyle: FontStyle.italic
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Add your action for cancellation and refund policy here
                    },
                ),
                TextSpan(
                  text:
                      ". We believe in transparency, and we want you to feel confident in every decision you make with Sk Writes.",
                ),
              ],
            ),
          ),
        ),
        _buildSectionHeader("Ready to Transform Your Business?"),
        InkWell(
          child: Text.rich(
            TextSpan(
              text: "Upgrade your business with our Sk Writes ",
              style: GoogleFonts.lato(),
              children: [
                TextSpan(
                  text: "buy now",
                  style: GoogleFonts.lato(
                      color: Colors.blue, fontStyle: FontStyle.italic),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: GoogleFonts.fredoka(
          color: Colors.blue,
          fontSize: 24,
        ),
      ),
    );
  }

  Widget _buildSectionText(String text,
      [String? subtitle, String? description]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (subtitle != null)
            Text(
              subtitle,
              style: GoogleFonts.lato(
                fontSize: 18,
              ),
            ),
          const SizedBox(height: 16),
          Text(
            text,
            style: GoogleFonts.lato(fontSize: 16),
          ),
          if (description != null) const SizedBox(height: 16),
          if (description != null)
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
        ],
      ),
    );
  }

  Widget _buildBulletPoints(List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: points.map((point) => _buildBulletPoint(point, "")).toList(),
    );
  }

  Widget _buildBulletPoint(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.star, color: Colors.orange),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.lato(fontSize: 16)),
                Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
