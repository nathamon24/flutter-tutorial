import 'package:flutter/material.dart';

class TTextFields extends StatelessWidget {
  const TTextFields({
    Key? key,
    required this.controller,
    this.label,
    this.icon,
    this.placeholder,
  }) : super(key: key);

  final TextEditingController controller;
  final String? label;
  final IconData? icon;
  final String? placeholder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) // Display label if provided
          Text(
            label!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: icon != null ? Icon(icon) : null, // Optional icon
            labelText: placeholder, // Placeholder text for accessibility
          ),
        ),
      ],
    );
  }
}
