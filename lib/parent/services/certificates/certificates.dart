import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royalbabyapp/parent/services/certificates/certificate_details.dart';
import 'package:royalbabyapp/theme/colors.dart';

import '../../../theme/fonts.dart';

class Certificates extends StatefulWidget {
  const Certificates({super.key});

  @override
  State<Certificates> createState() => _CertificatesState();
}

class _CertificatesState extends State<Certificates> {
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
                SizedBox(width: 10),
                Text(
                  'الشهادات',
                  style: AppFonts.body2(color: NewColors.supHeading),
                ),
                SizedBox(height: 20),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 6,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CertificateDetails(),
                        ),
                      );
                    },
                    child: Container(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/certificate.png',
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ' إنجاز الطفل في مرحلة الحضانة',
                                            style: AppFonts.headingH6(
                                              color: NewColors.heading,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            'مارس 2025',
                                            style: AppFonts.body4(
                                              color: NewColors.body,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text(
                                'ممتاز',
                                style: AppFonts.body4(color: NewColors.body),
                              ),
                              SizedBox(width: 5),
                              Image.asset('assets/images/star.png'),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Image.asset('assets/images/award.png'),
                              SizedBox(width: 10),
                              Text(
                                'النوع :',
                                style: AppFonts.body4(color: NewColors.body),
                              ),
                              Text(
                                'مشاركه',
                                style: AppFonts.body3(
                                  color: NewColors.supHeading,
                                ),
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
