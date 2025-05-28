import 'package:flutter/material.dart';
import 'package:royal/theme/colors.dart';
import 'package:royal/theme/fonts.dart';

class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  int selectedTab = 0;

  final List<String> tabs = [
    'المستحقة',
    'المكتملة',
    'مدفوعات أخرى',
  ];

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
                  'المدفوعات',
                  style: AppFonts.body2(color: NewColors.supHeading),
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// التابات الثلاثة
            Row(
              children: List.generate(tabs.length, (index) {
                final isSelected = selectedTab == index;
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? NewColors.primary400
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? LineColors.border
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Text(
                        tabs[index],
                        style: AppFonts.body3(
                          color: isSelected
                              ? NewColors.alwaysWhite
                              : Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            Expanded(
              child: Builder(
                builder: (_) {
                  switch (selectedTab) {
                    case 0:
                      return Expanded(
                        child: ListView.separated(
                          itemCount: 2,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: NewColors.lightBG.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: LineColors.border),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                  'assets/images/Invoice Icon.png'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      'رسوم الفصل الدراسي الثاني',
                                                      style: AppFonts.body4(
                                                          color:
                                                              NewColors.body)),
                                                  SizedBox(height: 4),
                                                  Text('100 د.ك',
                                                      style: AppFonts.headingH6(
                                                          color: NewColors
                                                              .heading)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: NewColors.redBG,
                                          border: Border.all(
                                            color: LineColors.redStroke,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12.0,
                                              right: 12,
                                              top: 4,
                                              bottom: 4),
                                          child: Text('لم يُدفع',
                                              style: AppFonts.body4(
                                                  color: NewColors.red)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('تاريخ الاستحقاق 15 مايو 2025',
                                      style: AppFonts.body4(
                                          color: NewColors.body)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Divider(
                                    color: LineColors.line,
                                    thickness: 1,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.051,
                                    width: MediaQuery.sizeOf(context).width,
                                    decoration: BoxDecoration(
                                      color: NewColors.primary500,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'ادفع الآن',
                                      style: AppFonts.buttonMd(
                                          color: NewColors.alwaysWhite),
                                    )),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    case 1:
                      return Expanded(
                        child: ListView.separated(
                          itemCount: 2,
                          separatorBuilder: (_, __) =>
                          const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: NewColors.lightBG.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: LineColors.border),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                  'assets/images/Invoice Icon.png'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      'رسوم التسجيل السنوي',
                                                      style: AppFonts.body4(
                                                          color:
                                                          NewColors.body)),
                                                  SizedBox(height: 4),
                                                  Text('200 د.ك',
                                                      style: AppFonts.headingH6(
                                                          color: NewColors
                                                              .heading)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: NewColors.greenBG,
                                          border: Border.all(
                                            color: LineColors.greenStroke,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(24),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12.0,
                                              right: 12,
                                              top: 4,
                                              bottom: 4),
                                          child: Text('تم الدفع',
                                              style: AppFonts.body4(
                                                  color: NewColors.green)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('تاريخ الدفع: 1 سبتمبر 2024',
                                      style: AppFonts.body4(
                                          color: NewColors.body)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('رقم العملية: #PAY20240901',
                                      style: AppFonts.body4(
                                          color: NewColors.body)),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    case 2:
                      return Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 40,),
                          Text('نوع الدفع',style: AppFonts.body2(color: NewColors.label),),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: MediaQuery.sizeOf(context).height*0.057,
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: NewColors.inputBG,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: LineColors.border),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('رسوم نشاط إضافي',style: AppFonts.body2(color: NewColors.label),),
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text('المبلغ المدفوع',style: AppFonts.body2(color: NewColors.label),),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: MediaQuery.sizeOf(context).height*0.057,
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: NewColors.inputBG,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: LineColors.border),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('30 د.ك',style: AppFonts.body2(color: NewColors.label),),
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text('ملاحظات (اختياري)',style: AppFonts.body2(color: NewColors.label),),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: MediaQuery.sizeOf(context).height*0.106,
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: NewColors.inputBG,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: LineColors.border),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('رسوم شهر مارس فقط',style: AppFonts.body2(color: NewColors.label),),
                              ),
                            ),
                          ),
                          Expanded(child: SizedBox(),),
                          Container(
                            height: MediaQuery.sizeOf(context).height*0.057,
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                              color: NewColors.primary500,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(child: Text('ادفع الآن',style: AppFonts.buttonLg(color: NewColors.alwaysWhite),)),
                          ),
                        ],
                      );
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
