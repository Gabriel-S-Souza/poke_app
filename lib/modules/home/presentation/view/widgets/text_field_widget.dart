// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    Key? key,
    this.onChanged,
    this.hint,
    this.prefix,
    this.suffix,
    this.obscure = false,
    this.readOnly = false,
    this.textInputType,
    this.enabled,
    this.controller,
    this.onFocusChange,
    this.onSubmitted,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscure;
  final TextInputType? textInputType;
  void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function(bool)? onFocusChange;
  final bool? enabled;
  final bool readOnly;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 5,
              spreadRadius: 2,
              color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
              inset: true,
            ),
          ],
        ),
        padding: prefix != null ? null : const EdgeInsets.only(left: 16),
        child: Focus(
          onFocusChange: onFocusChange,
          child: TextFormField(
            controller: controller,
            obscureText: obscure,
            keyboardType: textInputType,
            onChanged: onChanged,
            enabled: enabled,
            readOnly: readOnly,
            autofocus: false,
            style: const TextStyle(
              fontSize: 12,
            ),
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                onSubmitted?.call(value);
              }
            },
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 12,
              ),
              contentPadding: const EdgeInsets.only(bottom: 13),
              border: InputBorder.none,
              prefixIcon: prefix,
              suffixIcon: suffix,
            ),
            textAlignVertical: TextAlignVertical.center,
          ),
        ),
      );
}
