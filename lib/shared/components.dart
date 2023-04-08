import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget TextFormFieldWidget({
  required TextEditingController controller,
  required TextInputType type,
  required BuildContext context,
  String? hint,
  String? Function(String?)? validate,
  Function(String?)? onChanged,
  bool obscureText = false,
  List<TextInputFormatter>? inputFormatters,
  Function()? onEditingComplete,
  TextAlign textAlign = TextAlign.start,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool enable = true,
}) =>
    TextFormField(
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      keyboardType: type,
      enabled: enable,
      inputFormatters: inputFormatters,
      controller: controller,
      minLines: 1,
      obscureText: obscureText,
      textAlign: textAlign,
      cursorColor: Colors.black,
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
        filled: true,
        hintText: hint,
        hintStyle: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5)),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: Theme.of(context).textTheme.bodyText1!.color!,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: Theme.of(context).textTheme.bodyText1!.color!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: Theme.of(context).textTheme.bodyText1!.color!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: Theme.of(context).textTheme.bodyText1!.color!,
          ),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: validate,
    );