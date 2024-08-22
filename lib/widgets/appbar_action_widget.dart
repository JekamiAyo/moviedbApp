import 'package:flutter/material.dart';

class AppbarActionWidget extends StatelessWidget {
  const AppbarActionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0,  bottom: 10, top: 5),
      child: Container(
        width: 56,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.withOpacity(0.7),
            border:
                Border.all(color: Colors.white.withOpacity(0.6), width: 0.5)),
        child: const Center(
          child: Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
