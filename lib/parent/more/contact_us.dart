import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal/theme/colors.dart';

import '../../theme/fonts.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.07,
            ),
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
                      border: Border.all(
                        color: LineColors.border,
                        width: 1,
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/Dropdown Icon.png',
                      height: MediaQuery.sizeOf(context).width * 0.045,
                      width: MediaQuery.sizeOf(context).width * 0.045,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'تواصل معنا',
                  style: AppFonts.body2(color: NewColors.supHeading),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  builder: (context) => const RatingBottomSheet(),
                );
              },
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.087,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: NewColors.grayBox,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Image.asset('assets/images/Reward Points Label4.png'),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'تقييم الحضانة',
                            style:
                                AppFonts.supHeading3(color: NewColors.supHeading),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'شاركنا رأيك في خدمات الحضانة وساهم في تطوير التجربة',
                            style: AppFonts.body4(color: NewColors.body),
                          ),
                        ],
                      ),
                      Spacer(),
                      Image.asset('assets/images/Vector.png')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  builder: (context) => const HelpBottomSheet(),
                );
              },
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.087,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: NewColors.grayBox,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Image.asset('assets/images/Reward Points Label5.png'),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'تقديم شكوى',
                            style:
                                AppFonts.supHeading3(color: NewColors.supHeading),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'واجهت مشكلة؟ أخبرنا لنتمكن من خدمتك بشكل أفضل',
                            style: AppFonts.body4(color: NewColors.body),
                          ),
                        ],
                      ),
                      Spacer(),
                      Image.asset('assets/images/Vector.png')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Divider(
              height: 1,
              color: LineColors.line,
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'معلومات التواصل',
              style: AppFonts.supHeading3(color: NewColors.supHeading),
            ),
            SizedBox(height: 12,),
            Text(
              '• العنوان: السالمية – قطعة 5 – شارع ناصر المبارك – مبنى رقم 12',
              style: AppFonts.caption2(color: NewColors.body),
            ),
            SizedBox(height: 12,),
            Text(
              '• رقم الهاتف: 00965-65555599',
              style: AppFonts.caption2(color: NewColors.body),
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                Text(
                  '• البريد الإلكتروني: ',
                  style: AppFonts.caption2(color: NewColors.body),
                ),
                Text('support@royalbaby.edu.kw',style: AppFonts.caption2(color: NewColors.blue),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class RatingBottomSheet extends StatelessWidget {
  const RatingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: NewColors.alwaysWhite,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset('assets/images/Close Button Container.png'),
                ),
                const SizedBox(width: 12),
                Text('تقييم الحضانة', style: AppFonts.supHeading2(color: NewColors.heading)),
              ],
            ),
            const SizedBox(height: 20),
            Text('كيف تُقيّم جودة الرعاية المقدمة لطفلك؟', style: AppFonts.supHeading3(color: NewColors.supHeading)),
            const SizedBox(height: 10),
            _buildStars(),

            const SizedBox(height: 20),
            Text('كيف تُقيّم تعامل الكادر التعليمي والإداري؟', style: AppFonts.supHeading3(color: NewColors.supHeading)),
            const SizedBox(height: 10),
            _buildStars(),

            const SizedBox(height: 20),
            Text('هل تشعر أن طفلك سعيد وآمن داخل الحضانة؟', style: AppFonts.supHeading3(color: NewColors.supHeading)),
            const SizedBox(height: 10),
            Row(
              children: ['نعم', 'أحياناً', 'لا'].map((e) {
                return Expanded(
                  child: Row(
                    children: [
                      Radio(value: e, groupValue: null, onChanged: (_) {}),
                      Text(e, style: AppFonts.body3(color: NewColors.body)),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text('هل تقترح أي تحسينات؟', style: AppFonts.supHeading3(color: NewColors.supHeading)),
            const SizedBox(height: 8),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'اكتب هنا... (اختياري)',
                hintStyle: AppFonts.body2(color: NewColors.placeHolder),
                filled: true,
                fillColor: NewColors.inputBG,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: LineColors.inputBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: LineColors.inputBorder, width: 1.5),
                ),
              ),
            ),
            SizedBox(height: 24,),
            Container(
              height: MediaQuery.sizeOf(context).height*0.057,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: NewColors.primary500,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(child: Text('إرسال التقييم',style: AppFonts.buttonLg(color: NewColors.alwaysWhite),)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Icon(Icons.star, color: Colors.grey, size: 32),
        );
      }),
    );
  }
}

class HelpBottomSheet extends StatelessWidget {
  const HelpBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: NewColors.alwaysWhite,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset('assets/images/Close Button Container.png'),
                ),
                const SizedBox(width: 12),
                Text('تقديم شكوى', style: AppFonts.supHeading2(color: NewColors.heading)),
              ],
            ),
            const SizedBox(height: 20),
            Text('نوع الشكوى', style: AppFonts.body2(color: NewColors.label)),
            const SizedBox(height: 10),
            Container(
              height: MediaQuery.sizeOf(context).height*0.057,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: NewColors.inputBG,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: LineColors.inputBorder),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text('إدارية',style: AppFonts.body2(color: NewColors.label),),
                    Spacer(),
                    Image.asset('assets/images/Dropdown Icon3.png')
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('تفاصيل الشكوى', style: AppFonts.supHeading3(color: NewColors.supHeading)),
            const SizedBox(height: 8),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'ادخل تفاصيل الشكوى...',
                hintStyle: AppFonts.body2(color: NewColors.placeHolder),
                filled: true,
                fillColor: NewColors.inputBG,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: LineColors.inputBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: LineColors.inputBorder, width: 1.5),
                ),
              ),
            ),
            SizedBox(height: 24,),
            Container(
              height: MediaQuery.sizeOf(context).height*0.057,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: NewColors.primary500,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(child: Text('إرسال الشكوى',style: AppFonts.buttonLg(color: NewColors.alwaysWhite),)),
            ),
          ],
        ),
      ),
    );
  }
}
