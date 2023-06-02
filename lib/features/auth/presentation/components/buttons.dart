import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? iconUrl;
  final String text;
  const MyButton({
    super.key,
    this.onPressed,
    this.iconUrl,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: const Size(double.infinity, 60),
        backgroundColor: const Color(0xFFEDEEF0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (iconUrl != null)
            Image.asset(
              iconUrl!,
              width: 30,
              height: 30,
            )
          else
            const SizedBox(
              width: 30,
            ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          const Icon(
            Icons.abc,
            size: 50,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }
}

class MyButtonTwo extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const MyButtonTwo({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: const Size(double.infinity, 60),
        backgroundColor: const Color(0xFF265AE8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
