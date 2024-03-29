import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final onChange;
  final padding;
  final errorText;
  final placeHolder;

  InputField({this.onChange, this.padding, this.errorText, this.placeHolder});

  final _InputField fieldState = _InputField();

  @override
  _InputField createState() => fieldState;

  setValidate(validate) => fieldState._setValidate(validate);
}

class _InputField extends State<InputField> {
  bool _validate = true;

  void _setValidate(bool validate) {
    setState(() {
      this._validate = validate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: widget.padding,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100000),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.1, 0.9],
                  colors: [Color(0xEDD6B9), Color(0xD4B492)]),
            ),
            child: TextField(
                onChanged: widget.onChange,
                decoration: InputDecoration(
                  hintText: widget.placeHolder,
                  errorText: _validate ? null : widget.errorText,
                  border: InputBorder.none,
                  filled: true,
                ))));
  }
}
