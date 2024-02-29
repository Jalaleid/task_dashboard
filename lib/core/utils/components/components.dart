// ignore_for_file: camel_case_types, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:task_dashboard/core/utils/fonts/fontStyles.dart';

String? userID;

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      required this.controller,
      required this.keyboardType,
      required this.lable,
      required this.prefixIconData,
      this.suffixIconData,
      this.onPressed,
      this.onFieldSubmitted,
      this.validator,
      this.isPassword = false});

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String lable;
  final IconData prefixIconData;
  final IconData? suffixIconData;
  final void Function()? onPressed;
  final bool isPassword;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        cursorHeight: 20,
        obscureText: isPassword,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        decoration: InputDecoration(
          label: Text(lable),
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.all(10),
          prefixIcon: Icon(prefixIconData),
          suffixIcon: IconButton(
            icon: Icon(suffixIconData),
            onPressed: onPressed,
          ),
        ));
  }
}

class defualtButton extends StatelessWidget {
  const defualtButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.color = Colors.deepPurple,
  });

  final String title;
  final void Function() onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: color),
          child: Text(
            title,
            style: Styles.textstyle16.copyWith(color: Colors.white),
          ),
        ));
  }
}

class InputFieldCount extends StatelessWidget {
  const InputFieldCount({
    super.key,
    required this.controller,
    required this.title,
  });

  final TextEditingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: const OutlineInputBorder(), label: Text(title)),
      ),
    );
  }
}

NavigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => Widget), (route) => false);

NavigateTo(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Widget),
    );
