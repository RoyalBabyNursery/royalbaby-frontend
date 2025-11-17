import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royalbabyapp/parent/services/photoalbum/photo_screen.dart';
import 'package:royalbabyapp/theme/colors.dart';

import '../../../theme/fonts.dart';

class PhotoAlbum extends StatefulWidget {
  const PhotoAlbum({super.key});

  @override
  State<PhotoAlbum> createState() => _PhotoAlbumState();
}

class _PhotoAlbumState extends State<PhotoAlbum> {
  int selectedTab = 0;

  final List<String> tabs = [
    'التربية الإسلامية',
    'القرآن الكريم',
    'الألعاب',
    'علوم الكمبيوتر',
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
                SizedBox(width: 10),
                Text(
                  'البوم الصور',
                  style: AppFonts.body2(color: NewColors.supHeading),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
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
                          horizontal: 12,
                          vertical: 10,
                        ),
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
            ),
            Expanded(
              child: Builder(
                builder: (_) {
                  switch (selectedTab) {
                    case 0:
                      return ListView.separated(
                        itemCount: 4,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PhotoScreen(),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/photos.png',
                                              ),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'تعلم آداب الدعاء والوضوء',
                                                    style: AppFonts.headingH6(
                                                      color:
                                                          NewColors.supHeading,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    '11 مايو 2025',
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
                                        '8 صور',
                                        style: AppFonts.body3(
                                          color: NewColors.green,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Image.asset(
                                        'assets/images/Dropdown Icon2.png',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    case 1:
                      return Text('');
                    case 2:
                      return Text('');
                    case 3:
                      return Text('');
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
