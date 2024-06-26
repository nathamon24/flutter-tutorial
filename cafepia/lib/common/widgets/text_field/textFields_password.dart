import 'package:flutter/material.dart';

class TTextFieldsPassword extends StatefulWidget {
  const TTextFieldsPassword({
    Key? key,
    required this.controller,
    this.label,
    this.placeholder,
  }) : super(key: key);

  final TextEditingController controller;
  final String? label;
  final String? placeholder;

  @override
  _TTextFieldsPasswordState createState() => _TTextFieldsPasswordState();
}

class _TTextFieldsPasswordState extends State<TTextFieldsPassword> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) // Display label if provided
          Text(
            widget.label!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
            labelText: widget.placeholder,
          ),
        ),
      ],
    );
  }
}
