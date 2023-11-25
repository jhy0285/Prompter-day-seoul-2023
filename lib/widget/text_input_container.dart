import 'package:flutter/material.dart';

class TextInputContainer extends StatefulWidget {
  final String title;
  final String labelText;
  final TextEditingController controller;

  const TextInputContainer({
    Key? key,
    required this.title,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  @override
  State<TextInputContainer> createState() => _TextInputContainerState();
}

class _TextInputContainerState extends State<TextInputContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color(0xff131313)),
        ),
        const SizedBox(height: 15),
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
              labelText: widget.labelText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              )),
        )
      ],
    );
  }
}
