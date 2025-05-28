import 'package:flutter/material.dart';
import 'package:royal/theme/fonts.dart';
import 'package:royal/theme/colors.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isPassword;

  const CustomTextFieldWidget({
    super.key,
    required this.labelText,
    required this.controller,
    this.isPassword = false,
  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.06,
      decoration: BoxDecoration(
        color: NewColors.inputBG,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: NewColors.inputBorder,
          width: 1,
        ),
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: widget.isPassword ? _obscure : false,
              textAlign: TextAlign.right,
              style: AppFonts.body2(color: NewColors.black),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                hintText: widget.labelText,
                hintStyle: AppFonts.body2(color: NewColors.placeHolder),
                border: InputBorder.none,
              ),
            ),
          ),
          if (widget.isPassword)
            IconButton(
              icon: Icon(
                _obscure ? Icons.visibility_off : Icons.visibility,
                color: NewColors.placeHolder,
              ),
              onPressed: () {
                setState(() {
                  _obscure = !_obscure;
                });
              },
            ),
        ],
      ),
    );
  }
}


class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: AppFonts.body3(color: NewColors.caption)),
        const Spacer(),
        Text(value, style: AppFonts.body3(color: valueColor)),
      ],
    );
  }
}


class InfoText extends StatelessWidget {
  final String label;

  const InfoText({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return
        Text('•   '+label, style: AppFonts.body3(color: NewColors.body));

  }
}