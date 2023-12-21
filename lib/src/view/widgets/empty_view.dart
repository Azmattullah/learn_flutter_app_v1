import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter_app/src/res/assets.dart';
import 'package:lottie/lottie.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(AnimationAssets.empty_icon),
        Text(
          'Things look empty here. Tap + to start',
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600), 
        )
      ],
    );
  }
}
