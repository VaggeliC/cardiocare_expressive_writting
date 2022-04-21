// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:recase/recase.dart';
import '../utilities/validator.dart';

class MyInputField extends StatefulWidget {
  const MyInputField(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget})
      : super(key: key);

  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  @override
  State<MyInputField> createState() => _MyInputFieldState();
}

class _MyInputFieldState extends State<MyInputField> {
  @override
  Widget build(BuildContext context) {
    String _fieldType = validateField.keys.contains(widget.title.camelCase)
        ? widget.title.camelCase
        : 'else';

    return Container(
      margin: EdgeInsets.only(
        top: 25.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.start,
                  validator: _fieldType == 'title' ||
                          _fieldType == 'date' ||
                          _fieldType == 'time'
                      ? (value) => validateField[_fieldType](value)
                      : null,
                  controller: widget.controller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  readOnly: widget.widget == null ? false : true,
                  autofocus: true,
                  cursorColor: const Color(0xFFA9915D),
                  decoration: InputDecoration(
                    suffixIcon: widget.widget,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    hintText: widget.hint,
                    labelText: widget.title,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  style: const TextStyle(
                    color: Color(0xFF1A4859),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
