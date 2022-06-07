import 'package:flutter/material.dart';

class PokeErrorWidget extends StatelessWidget {
  const PokeErrorWidget({
    Key? key,
    required this.message,
    this.onTap,
  }) : super(key: key);

  final String message;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(28),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            const Icon(
              Icons.warning_amber_rounded,
              size: 60,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}
