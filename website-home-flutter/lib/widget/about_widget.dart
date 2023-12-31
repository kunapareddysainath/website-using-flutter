import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  final EdgeInsets _padding = EdgeInsets.all(16);
  final TextStyle _headerStyle = GoogleFonts.fredoka(fontSize: 24, color: Colors.blue);
  final TextStyle _normalStyle = GoogleFonts.lato(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: _padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Welcome to Sk Writes – Empowering Small Businesses, Connecting Communities!',
            textAlign: TextAlign.center,
            style: _headerStyle,
          ),
          SizedBox(height: 16),
          Text(
            'Sk Writes was born in the vibrant city of Hyderabad, India, with a mission to bridge the digital divide for small businesses. Recognizing the challenges faced by entrepreneurs who may struggle with financial or technical barriers to establish an online presence, we set out to create a platform that levels the playing field.',
            textAlign: TextAlign.justify,
            style: _normalStyle,
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildMissionColumn(),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildTransactionsColumn(),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildBusinessManagementColumn(),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildWhySkWritesColumn(),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Embark on your digital journey with Sk Writes and witness the transformation of your business in the online realm. We are committed to supporting small businesses, fostering innovation, and building a thriving digital ecosystem.',
            textAlign: TextAlign.justify,
            style: GoogleFonts.fredoka(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildMissionColumn() {
    return Column(
      children: [
        Text(
          'Our Mission:',
          style: _headerStyle,
        ),
        SizedBox(height: 8),
        Text(
          'At Sk Writes, our mission is clear – to empower small businesses by providing them with the tools they need to thrive in the digital age. We understand that not every entrepreneur has the resources to host their business online, and that\'s where Sk Writes steps in. We offer a unique platform that allows users to effortlessly set up their digital stores, enabling them to reach a broader audience and compete in the ever-evolving digital marketplace.',
          textAlign: TextAlign.justify,
          style: _normalStyle,
        ),
      ],
    );
  }

  Widget _buildTransactionsColumn() {
    return Column(
      children: [
        Text(
          'Seamless Digital Transactions:',
          style: _headerStyle,
        ),
        SizedBox(height: 8),
        Text(
          'Sk Writes isn\'t just about creating an online presence; it\'s about revolutionizing the way businesses transact. We have developed a robust digital payment solution within Sk Writes, ensuring quick and secure transactions for both users and vendors. Say goodbye to the hassles of traditional payment methods and embrace the efficiency of Sk Writes for all your financial transactions.',
          textAlign: TextAlign.justify,
          style: _normalStyle,
        ),
      ],
    );
  }

  Widget _buildBusinessManagementColumn() {
    return Column(
      children: [
        Text(
          'End-to-End Business Management Solutions:',
          style: _headerStyle,
        ),
        SizedBox(height: 8),
        Text(
          'We go beyond just storefronts and payments – Sk Writes is committed to providing comprehensive business management solutions tailored for Small and Medium Enterprises (SMEs). Our highly customizable tools are designed to meet the unique needs and internal requirements of each business. With Sk Writes, we aim to empower thousands of SMEs to efficiently run their operations online while establishing a strong and professional online presence through their own websites and apps.',
          textAlign: TextAlign.justify,
          style: _normalStyle,
        ),
      ],
    );
  }

  Widget _buildWhySkWritesColumn() {
    return Column(
      children: [
        Text(
          'Why Sk Writes:',
          style: _headerStyle,
        ),
        SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '- Affordable and Accessible: Sk Writes is the solution for businesses that may find the cost of establishing an online presence prohibitive. We believe that every business deserves the opportunity to thrive in the digital world.',
              textAlign: TextAlign.justify,
              style: _normalStyle,
            ),
            SizedBox(height: 8),
            Text(
              '- Digital Payment Revolution: Enjoy the benefits of quick, secure, and hassle-free digital payments through Sk Writes. Say goodbye to the limitations of traditional payment methods.',
              textAlign: TextAlign.justify,
              style: _normalStyle,
            ),
            SizedBox(height: 8),
            Text(
              '- Customizable Business Solutions: We understand that no two businesses are the same. Our highly customizable business management solutions ensure that Sk Writes adapts to your unique needs.',
              textAlign: TextAlign.justify,
              style: _normalStyle,
            ),
            SizedBox(height: 8),
            Text(
              '- Community Building: Sk Writes is more than just a platform; it\'s a community. Join us in connecting businesses and communities, fostering growth and collaboration.',
              textAlign: TextAlign.justify,
              style: _normalStyle,
            ),
          ],
        ),
      ],
    );
  }
}
