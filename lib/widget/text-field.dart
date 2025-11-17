import 'package:flutter/material.dart';
import 'package:royalbabyapp/theme/colors.dart';
import 'package:royalbabyapp/theme/fonts.dart';

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
        border: Border.all(color: NewColors.inputBorder, width: 1),
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
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 0,
                ),
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

  const InfoText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text('•   ' + label, style: AppFonts.body3(color: NewColors.body));
  }
}

class TimeInputField extends StatelessWidget {
  final String hintText;
  final VoidCallback? onTap;
  final TextEditingController? controller;

  const TimeInputField({
    super.key,
    this.hintText = 'ادخل الوقت',
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: onTap,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        hintText: hintText,
        hintTextDirection: TextDirection.rtl,
        hintStyle: AppFonts.body2(color: NewColors.placeHolder),
        filled: true,
        fillColor: NewColors.inputBG,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(Icons.access_time, color: NewColors.placeHolder),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: LineColors.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: LineColors.inputBorder, width: 1.5),
        ),
      ),
    );
  }
}

class QuantityTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const QuantityTextField({
    super.key,
    this.hintText = 'ادخل الكمية',
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textDirection: TextDirection.rtl,
      style: AppFonts.body2(color: NewColors.heading),
      decoration: InputDecoration(
        hintText: hintText,
        hintTextDirection: TextDirection.rtl,
        hintStyle: AppFonts.body2(color: NewColors.placeHolder),
        filled: true,
        fillColor: NewColors.inputBG,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: LineColors.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: LineColors.inputBorder, width: 1.5),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        hintText: 'ابحث باسم الطالب...',
        hintStyle: AppFonts.body2(color: NewColors.placeHolder),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset('assets/images/search-normal.png'),
        ),
        filled: true,
        fillColor: NewColors.inputBG,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: LineColors.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: LineColors.border),
        ),
      ),
    );
  }
}

class NoteTextField extends StatelessWidget {
  const NoteTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 3,
      decoration: InputDecoration(
        hintText: 'ادخل ملاحظاتك هنا...',
        hintStyle: AppFonts.body2(color: NewColors.placeHolder),
        filled: true,
        fillColor: NewColors.inputBG,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: LineColors.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: LineColors.inputBorder, width: 1.5),
        ),
      ),
    );
  }
}
