import 'package:flutter/material.dart';

class CustomDropdownFormField extends StatefulWidget {
  final InputDecoration decoration;
  final bool isExpanded;
  final Widget hint;
  final List<DropdownMenuItem<String>> items;
  //final List<String> items;
  final String? value;
  final ValueChanged<String?>? onChanged;
  final double buttonHeight;
  final EdgeInsetsGeometry buttonPadding;
  final BoxDecoration dropdownDecoration;

  const CustomDropdownFormField({
    Key? key,
    required this.decoration,
    required this.isExpanded,
    required this.hint,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.buttonHeight,
    required this.buttonPadding,
    required this.dropdownDecoration,
  }) : super(key: key);

  @override
  _CustomDropdownFormFieldState createState() =>
      _CustomDropdownFormFieldState();
}

class _CustomDropdownFormFieldState extends State<CustomDropdownFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.buttonHeight,
      padding: widget.buttonPadding,
      decoration: widget.dropdownDecoration.copyWith(
        borderRadius: widget.decoration.border is OutlineInputBorder
            ? (widget.decoration.border as OutlineInputBorder).borderRadius
            : null,
      ),
      child: DropdownButtonFormField<String>(
        decoration: widget.decoration.copyWith(
          contentPadding: EdgeInsets.zero,
        ),
        isExpanded: widget.isExpanded,
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        dropdownColor: Colors.white,
        items: widget.items,
        onChanged: widget.onChanged,
        value: widget.value,
      ),
    );
  }
}
/*
class _CustomDropdownFormFieldState extends State<CustomDropdownFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.buttonHeight,
      padding: widget.buttonPadding,
      decoration: widget.dropdownDecoration.copyWith(
        borderRadius: widget.decoration.border is OutlineInputBorder
            ? (widget.decoration.border as OutlineInputBorder).borderRadius
            : null,
      ),
      child: DropdownButtonFormField<String>(
        decoration: widget.decoration.copyWith(
          contentPadding: EdgeInsets.zero,
        ),
        isExpanded: widget.isExpanded,
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        dropdownColor: Colors.white,
        items: widget.items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          );
        }).toList(),
        onChanged: widget.onChanged,
        value: widget.value,
      ),
    );
  }
}
*/
/*
class _CustomDropdownFormFieldState extends State<CustomDropdownFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.buttonHeight,
      padding: widget.buttonPadding,
      decoration: widget.dropdownDecoration.copyWith(
        borderRadius: widget.decoration.border is OutlineInputBorder
            ? (widget.decoration.border as OutlineInputBorder).borderRadius
            : null,
      ),
      child: DropdownButtonFormField<String>(
        decoration: widget.decoration.copyWith(
          contentPadding: EdgeInsets.zero,
        ),
        isExpanded: widget.isExpanded,
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        dropdownColor: Colors.white,
        items: widget.items
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: widget.onChanged,
        value: widget.value,
      ),
    );
  }
}
 */

