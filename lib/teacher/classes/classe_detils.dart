import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal/teacher/classes/add_event.dart';
import 'package:royal/teacher/classes/studint_detils.dart';
import 'package:royal/theme/colors.dart';

import '../../theme/fonts.dart';
import '../photo_video/add_photos.dart';

class ClasseDetils extends StatefulWidget {
  const ClasseDetils({super.key});

  @override
  State<ClasseDetils> createState() => _ClasseDetilsState();
}

class _ClasseDetilsState extends State<ClasseDetils> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.065),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    height: MediaQuery.sizeOf(context).width * 0.091,
                    width: MediaQuery.sizeOf(context).width * 0.091,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: LineColors.border, width: 1),
                    ),
                    child: Image.asset(
                      'assets/images/Dropdown Icon.png',
                      height: MediaQuery.sizeOf(context).width * 0.045,
                      width: MediaQuery.sizeOf(context).width * 0.045,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'فصل الاكتشاف (G3)',
                  style: AppFonts.body2(color: NewColors.supHeading),
                ),
                Spacer(),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddEvent()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        height: MediaQuery.sizeOf(context).width * 0.091,
                        width: MediaQuery.sizeOf(context).width * 0.091,
                        decoration: BoxDecoration(
                          color: NewColors.primary50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          'assets/images/Add.png',
                          height: MediaQuery.sizeOf(context).width * 0.045,
                          width: MediaQuery.sizeOf(context).width * 0.045,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(24)),
                          ),
                          builder: (context) => const FilterSheet(),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        height: MediaQuery.sizeOf(context).width * 0.091,
                        width: MediaQuery.sizeOf(context).width * 0.091,
                        decoration: BoxDecoration(
                          color: NewColors.alwaysWhite,
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: LineColors.border, width: 1),
                        ),
                        child: Image.asset(
                          'assets/images/filter.png',
                          height: MediaQuery.sizeOf(context).width * 0.045,
                          width: MediaQuery.sizeOf(context).width * 0.045,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 36,
            ),
            TextField(
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
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: LineColors.inputBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: LineColors.border),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudintDetils()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: NewColors.lightBG,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: LineColors.border),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                          'assets/images/IMAGE (2).png'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('آدم محمود علي',
                                              style: AppFonts.caption1(
                                                  color: NewColors.heading)),
                                          SizedBox(height: 4),
                                          Text('3 سنوات',
                                              style: AppFonts.body4(
                                                  color: NewColors.body)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Image.asset('assets/images/Vector.png'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterSheet extends StatefulWidget {
  final Color? backgroundColor;

  const FilterSheet({super.key, this.backgroundColor});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  String attendance = 'حاضر';
  String gender = 'ذكور';
  String age = '3-4 سنوات';
  String behavior = 'ممتاز';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? NewColors.alwaysWhite,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      'assets/images/Close Button Container.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text('تصفية',
                      style: AppFonts.supHeading2(color: NewColors.heading)),
                ],
              ),
              const SizedBox(height: 20),
              buildSectionTitle('الحضور / الغياب'),
              buildRadioGroup(['حاضر', 'غائب', 'متأخر'], attendance,
                  (val) => setState(() => attendance = val)),
              SizedBox(height: 12),
              Divider(
                height: 1,
                color: LineColors.line,
              ),
              SizedBox(height: 12),
              buildSectionTitle('الجنس'),
              buildRadioGroup(['ذكور', 'إناث'], gender,
                  (val) => setState(() => gender = val)),
              SizedBox(height: 12),
              Divider(
                height: 1,
                color: LineColors.line,
              ),
              SizedBox(height: 12),
              buildSectionTitle('العمر'),
              buildRadioGroup(['2-3 سنوات', '3-4 سنوات', '4-5 سنوات'], age,
                  (val) => setState(() => age = val)),
              SizedBox(height: 12),
              Divider(
                height: 1,
                color: LineColors.line,
              ),
              SizedBox(height: 12),
              buildSectionTitle('السلوك'),
              buildRadioGroup(['ممتاز', 'جيد', 'يحتاج متابعة'], behavior,
                  (val) => setState(() => behavior = val)),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: NewColors.primary500,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // Apply filter logic here
                  },
                  child: Text('حفظ',
                      style: AppFonts.buttonLg(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 8),
        child: Text(title,
            style: AppFonts.supHeading3(color: NewColors.supHeading)),
      ),
    );
  }

  Widget buildRadioGroup(
      List<String> options, String groupValue, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Wrap(
        spacing: 16,
        runSpacing: 6,
        children: options.map((option) {
          final isSelected = groupValue == option;
          return GestureDetector(
            onTap: () => onChanged(option),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsetsDirectional.only(end: 6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          isSelected ? NewColors.primary500 : LineColors.border,
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: NewColors.primary500,
                            ),
                          ),
                        )
                      : null,
                ),
                Text(option, style: AppFonts.body2(color: NewColors.body)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
