import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          buildDivider(context),
        ],
      ),
    );
  }

  Expanded buildDivider(context) {
    return const Expanded(
      child: Divider(
        color: Colors.white,
        height: 1.5,
      ),
    );
  }
}
