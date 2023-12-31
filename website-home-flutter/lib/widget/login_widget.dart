import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: 340,
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildAppLogo(),
                buildLoginForm(),
                buildLoginButton(),
                buildSignUpAndOtpLogin(),
                buildPolicyAndTerms(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAppLogo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sk',
            style: GoogleFonts.fredoka(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: const Color(0xFFFF0000),
            ),
          ),
          Text(
            'Writes',
            style: GoogleFonts.fredoka(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: const Color(0xFF1A73E8),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoginForm() {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.all(8)),
        TextField(
          controller: _usernameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            labelText: "User Name/Email",
            hintText: 'Enter your Email/Username',
          ),
        ),
        Padding(padding: const EdgeInsets.all(8)),
        TextField(
          controller: _passwordController,
          onEditingComplete: () {},
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            labelText: "Password",
            hintText: 'Enter your Password',
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: isPasswordVisible ? Colors.blue : Colors.black,
              ),
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
          ),
          obscureText: !isPasswordVisible,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  //Add login google logic here
                },
                child: Text("Sign Up",
                    style: GoogleFonts.lato(color: Colors.blue)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  //Add Forget logic here
                },
                child: Text("Forgot Password",
                    style: GoogleFonts.lato(color: Colors.blue)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSignUpAndOtpLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildCardWithText("Sign In",
            "https://appinit-files.s3.ap-south-1.amazonaws.com/image/seJZ6hwXrz_1703831432785.png"),
        buildCardWithText("Login with Otp", Icons.send_to_mobile, Colors.blue),
      ],
    );
  }

  Widget buildCardWithText(String text,
      [dynamic iconOrImageUrl, Color? iconColor]) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(iconOrImageUrl is String ? 8.0 : 12.0),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              if (iconOrImageUrl is String)
                Image.network(
                  iconOrImageUrl,
                  width: 32,
                  height: 32,
                )
              else if (iconOrImageUrl is IconData)
                Icon(
                  iconOrImageUrl,
                  color: iconColor,
                  size: 24,
                ),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoginButton() {
    return InkWell(
      onTap: () {
        //Add login logic here
      },
      child: Card(
        elevation: 2,
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Login',
                style: GoogleFonts.fredoka(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPolicyAndTerms() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            onTap: () {},
            child: Text("Policy", style: GoogleFonts.lato(color: Colors.blue)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            onTap: () {},
            child: Text("Terms", style: GoogleFonts.lato(color: Colors.blue)),
          ),
        ),
      ],
    );
  }
}
