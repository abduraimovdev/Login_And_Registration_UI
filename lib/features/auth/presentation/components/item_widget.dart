import 'package:flutter/material.dart';

class IconWidget extends StatefulWidget {
  final String images;
  final String text_1;
  final String text_2;
  final String text_3;
  final String text_4;

  const IconWidget({
    required this.images,
    required this.text_1,
    required this.text_2,
    required this.text_3,
    required this.text_4,
    Key? key,
  }) : super(key: key);

  @override
  State<IconWidget> createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage(widget.images),
          width: 90,
          height: 100,
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text_1,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.text_2,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.perm_identity,
                  color: Colors.grey,
                ),
                const SizedBox(width: 5),
                Text(
                  widget.text_3,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                ),
                const SizedBox(width: 19),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                const SizedBox(width: 5),
                Text(
                  widget.text_4,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}