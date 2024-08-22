
import 'package:flutter/material.dart';

class AppbarLeadingWidget extends StatelessWidget {
  const AppbarLeadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0,  bottom: 10, top: 3),
      child: Container(
        width: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white),
          image: const DecorationImage(
              image: AssetImage(
                'assets/images/IMG_7120.JPG',
              ),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}