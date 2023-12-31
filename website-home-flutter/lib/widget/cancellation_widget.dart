import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Cancellation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCancellationPolicy(context),
            _buildMerchantRefundPolicy(context)
          ],
        ),
      ),
    );
  }

  Widget _buildCancellationPolicy(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.48,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader("Cancellation and Refund Policy"),
          _buildParagraph(
            "Our Sk Writes offers a 14-day free trial for app templates. Cancel within this period with no charges. No refunds post-trial. Contact customer support for assistance.",
          ),
          _buildParagraph(
            "Note: This policy applies only to app templates, not other company products or services. Thank you for your understanding.",
          ),
        ],
      ),
    );
  }

  Widget _buildMerchantRefundPolicy(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader("Merchant Refund Policy"),
          _buildParagraph(
            "Before making a purchase, carefully review the merchant's refund, return, and exchange policies. Check their website or contact customer support for details.",
          ),
          _buildParagraph(
            "Contact the merchant directly for any questions or concerns about their policies. Each merchant's policies may vary, so understanding them is crucial to avoid misunderstandings.",
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String text) {
    return Text(
      text,
      style: GoogleFonts.fredoka(fontSize: 20, color: Colors.blue),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(text, style: GoogleFonts.lato(fontSize: 16));
  }
}
