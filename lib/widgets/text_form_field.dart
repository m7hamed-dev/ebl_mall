import 'package:ebll_mall/style/style.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class InputWidget extends StatefulWidget {
  //
  final TextInputType? textInputType;
  final String? emptyMsg;
  final String? hint;
  final String? lableTxt;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  dynamic obscureText;
  final bool? autofocus;
  final bool? isShowBuildCounter;
  final ValueChanged? onChange;
  final Function? changeValueObScureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final AutovalidateMode? autovalidateMode;
  final EdgeInsets? margin;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? height;
  final double? fontSize;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? textStyle;
  final Color? color;
  final void Function()? onTap;
  final String? prefixText;
  //
  InputWidget({
    this.emptyMsg,
    this.hint,
    this.obscureText,
    this.lableTxt,
    this.controller,
    this.maxLines,
    this.maxLength,
    this.onChange,
    this.autovalidateMode,
    this.validator,
    this.margin,
    this.textInputType,
    this.changeValueObScureText,
    this.suffixIcon,
    this.prefixIcon,
    this.height,
    this.contentPadding,
    this.textStyle,
    this.onFieldSubmitted,
    this.color,
    this.fontSize,
    this.onTap,
    this.autofocus,
    this.isShowBuildCounter,
    this.prefixText,
  });

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  //
  double _iconPassowordSize = 21.0;
  //
  @override
  Widget build(BuildContext context) {
    //
    return TextFormField(
      controller: widget.controller,
      autofocus: widget.autofocus ?? false,
      maxLength: widget.maxLength ?? 60,
      maxLines: widget.maxLines ?? 1,
      keyboardType: widget.textInputType,
      textAlign: TextAlign.right,
      obscureText: widget.obscureText ?? false,
      // textDirection: TextDirection.ltr,
      buildCounter: (BuildContext context,
          {int? currentLength, int? maxLength, bool? isFocused}) {
        // return isShowBuildCounter == true
        //     ? myTinyString(currentLength.toString())
        //     : null;
      },
      // buildCounter: (BuildContext context,
      //         {int currentLength, int maxLength, bool isFocused}) =>
      //     null,
      autovalidateMode:
          widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      onChanged: widget.onChange,
      style: widget.textStyle,
      onTap: widget.onTap ?? null,

      onFieldSubmitted: (value) {
        // FocusScope.of(context).requestFocus(FocusNode());
      },
      //
      decoration: InputDecoration(
        isDense: true,
        prefixText: widget.prefixText ?? '',

        // prefixStyle: TextStyle(
        //   fontSize: 10.0,
        //   fontWeight: FontWeight.bold,
        // ),
        // hint
        hintText: widget.hint,
        hintStyle: Style.hintStyle(),
        // error
        errorStyle: TextStyle(fontSize: 10),
        // outlineBorder
        focusedErrorBorder: _outLineInputBorder(isError: true),
        contentPadding: widget.contentPadding,
        // filled: false,
        fillColor: HexColor('##fef1f4'),
        //
        focusedBorder: _outLineInputBorder(isError: false),
        suffixIcon:
            widget.obscureText != null ? _iconPassword() : widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        //
        enabledBorder: _outLineInputBorder(isError: false),
      ),
    );
  }

  OutlineInputBorder _outLineInputBorder({required bool isError}) {
    //
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(3.0),
      borderSide: BorderSide(
        color: isError ? Colors.red : Style.customGrey,
        width: 0.5,
      ),
    );
  }

  IconButton _iconPassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          if (widget.obscureText != null) {
            widget.obscureText = !widget.obscureText;
          }
        });
      },
      icon: Icon(
        _iconDataPassword,
        color: _iconProperties(),
        size: _iconPassowordSize,
      ),
    );
  }

  IconData _iconDataPassword = Icons.remove_red_eye_rounded;

  Color _iconProperties() {
    if (widget.obscureText != null) {
      if (widget.obscureText) {
        _iconPassowordSize = 25.0;
        _iconDataPassword = Icons.lock;
        return Colors.black;
      }
      _iconPassowordSize = 21.0;
      _iconDataPassword = Icons.remove_red_eye_rounded;
      return Colors.grey;
    }
    return Colors.white;
  }
  //
}
