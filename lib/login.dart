import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/or_divider.dart';
import 'components/sign_in_social.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color(0xFF2E335E),
                  Color(0xFF1C1B33),
                ])),
            child: Stack(
              children: [
                Positioned(
                  bottom: size.height * 0.5,
                  left: size.width * 0.7,
                  child: Image.asset(
                    'assets/1.png',
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: size.height * 0.8,
                  right: size.width * 0.7,
                  child: Image.asset(
                    'assets/2.png',
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: size.height * 0.1,
                  left: -size.width * 0.2,
                  child: Image.asset(
                    'assets/3.png',
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: size.height * 0.3,
                  left: size.width * 0.2,
                  child: Image.asset(
                    'assets/4.png',
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: size.height * 0.6,
                  right: -60,
                  child: Image.asset(
                    'assets/5.png',
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white.withOpacity(0.1),
                                  border: Border.all(
                                    color: Colors.white24,
                                    width: 2,
                                  ),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: _buildForm(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 16),
                          _buildForgotPassword(context),
                          const SizedBox(height: 16),
                          buildNoAccount(context),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )));
  }

  Form _buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 16),
            _buildEmailField(),
            const SizedBox(height: 16),
            _buildPasswordField(),
            const SizedBox(height: 16),
            _buildSignInButton(context),
            const OrDivider(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SignInSocial.buildSocial(
                      context,
                      const FaIcon(
                        FontAwesomeIcons.apple,
                        color: Colors.black,
                      )),
                  const SizedBox(width: 16),
                  SignInSocial.buildSocial(
                      context,
                      const FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white.withOpacity(0.6),
        ),
        child: TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: "Email",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white.withOpacity(0.6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ]),
        child: TextField(
          controller: passwordController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Password",
              suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: const Icon(Icons.visibility))),
          obscureText: !isVisible,
        ),
      ),
    );
  }

  GestureDetector _buildForgotPassword(BuildContext context) {
    return GestureDetector(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(
              decoration: TextDecoration.underline, color: Colors.white54),
        ),
        onTap: () {});
  }

  RichText buildNoAccount(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: const TextStyle(color: Colors.white54),
            text: "No Account? ",
            children: [
          TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () {},
              text: 'Sign Up',
              style: const TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.white54,
              )),
        ]));
  }

  ElevatedButton _buildSignInButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          onPrimary: Colors.black,
          primary: Colors.black,
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          minimumSize: const Size(double.infinity, 50)),
      onPressed: () {},
      child: Text("Sign In",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          )),
    );
  }
}
