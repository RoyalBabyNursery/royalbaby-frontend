import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal/theme/colors.dart';
import 'package:royal/widget/container.dart';

import '../../theme/fonts.dart';

class Regulation extends StatefulWidget {
  const Regulation({super.key});

  @override
  State<Regulation> createState() => _RegulationState();
}

class _RegulationState extends State<Regulation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewColors.alwaysWhite,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
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
                    'اللائحه',
                    style: AppFonts.body2(color: NewColors.supHeading),
                  ),
                ],
              ),
              SizedBox(
                height: 36,
              ),
              Text(
                'لائحة الحضانة – رويال بيبي',
                style: AppFonts.headingH4(color: NewColors.heading),
              ),
              SizedBox(height: 12,),
              RegulationHelp(
                  title: 'مواعيد الدوام',
                  note: 'الأحد إلى الخميس – من الساعة 7:30 صباحًا إلى 1:30 ظهرًا'),
              RegulationHelp(
                  title: 'موقع الحضانة',
                  note: 'الكويت – منطقة [اسم المنطقة] – شارع [اسم الشارع]'),
              RegulationHelp(
                  title: 'الزي المناسب',
                  note: 'ملابس مريحة وآمنة – يُفضل تجنب الإكسسوارات أو الأحذية المفتوحة'),
              RegulationHelp(
                  title: 'الوجبات',
                  note: 'يرجى إرسال وجبة صحية يوميًا – لا يُسمح بالمأكولات الجاهزة أو الحلويات بكثرة'),
              RegulationHelp(
                  title: 'الغِياب والمرض',
                  note: 'في حال الغياب أو وجود أعراض مرضية، نرجو الإبلاغ مبكرًا – لا يُسمح بالحضور أثناء الإصابة بأي عدوى'),
              RegulationHelp(
                  title: 'اصطحاب الألعاب',
                  note: 'لا يُفضل إحضار ألعاب من المنزل – نحن نوفر بيئة آمنة ومناسبة للعب'),
              RegulationHelp(
                  title: 'الاستلام والتسليم',
                  note: 'الطفل لا يُسلّم إلا لولي الأمر أو شخص مخوّل مسبقًا، مع إبراز الهوية'),
              SizedBox(height: 12,),
              Divider(
                height: 1,
                color: LineColors.line,
              ),
              SizedBox(height: 12,),
              Text('للتواصل والاستفسارات',style: AppFonts.supHeading3(color: NewColors.supHeading),),
              SizedBox(height: 8,),
              Text('info@royalbaby.edu.kw',style: AppFonts.caption2(color: NewColors.blue),),
              SizedBox(height: 8,),
              Text('222 653 454',style: AppFonts.caption2(color: NewColors.blue),),
              SizedBox(height: 12,),
            ],
          ),
        ),
      ),
    );
  }
}
