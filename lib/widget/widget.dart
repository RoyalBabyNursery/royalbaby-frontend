import 'package:flutter/material.dart';
import 'package:royalbabyapp/theme/colors.dart';
import 'package:royalbabyapp/theme/fonts.dart';

class ToiletOptionSelector extends StatefulWidget {
  final String initialValue;
  final ValueChanged<String>? onChanged;

  const ToiletOptionSelector({
    super.key,
    this.initialValue = 'براز',
    this.onChanged,
  });

  @override
  State<ToiletOptionSelector> createState() => _ToiletOptionSelectorState();
}

class _ToiletOptionSelectorState extends State<ToiletOptionSelector> {
  late String selectedValue;

  final List<String> options = ['براز', 'بول', 'كلاهما'];

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 10,
      children: options.map((option) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<String>(
              value: option,
              groupValue: selectedValue,
              activeColor: NewColors.primary400,
              fillColor: MaterialStateProperty.all(LineColors.radioStroke),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedValue = value;
                  });
                  widget.onChanged?.call(value);
                }
              },
            ),
            Text(option, style: AppFonts.body2(color: NewColors.body)),
          ],
        );
      }).toList(),
    );
  }
}

class BehaviorOptionSelector extends StatefulWidget {
  final String initialValue;
  final ValueChanged<String>? onChanged;

  const BehaviorOptionSelector({
    super.key,
    this.initialValue = 'ظهر السلوك',
    this.onChanged,
  });

  @override
  State<BehaviorOptionSelector> createState() => _BehaviorOptionSelectorState();
}

class _BehaviorOptionSelectorState extends State<BehaviorOptionSelector> {
  late String selectedValue;

  final List<String> options = ['ظهر السلوك', 'طور الظهور', 'لم يظهر'];

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 10,
      children: options.map((option) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<String>(
              value: option,
              groupValue: selectedValue,
              activeColor: NewColors.primary400,
              fillColor: MaterialStateProperty.all(LineColors.radioStroke),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedValue = value;
                  });
                  widget.onChanged?.call(value);
                }
              },
            ),
            Text(option, style: AppFonts.body2(color: NewColors.body)),
          ],
        );
      }).toList(),
    );
  }
}
