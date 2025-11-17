import 'package:flutter/material.dart';
import 'package:royalbabyapp/theme/colors.dart';
import 'package:royalbabyapp/theme/fonts.dart';

import 'edit_photo.dart';

class Photos extends StatefulWidget {
  const Photos({super.key});

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
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
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'احتفال الاجازة',
                  style: AppFonts.body2(color: NewColors.supHeading),
                ),
                const Spacer(),
                GestureDetector(
                  onTapDown: (TapDownDetails details) {
                    final RenderBox overlay =
                        Overlay.of(context).context.findRenderObject()
                            as RenderBox;
                    showMenu<String>(
                      context: context,
                      position: RelativeRect.fromRect(
                        details.globalPosition & const Size(100, 100),
                        Offset.zero & overlay.size,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: NewColors.alwaysWhite,
                      items: <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'edit',
                          child: PopupMenuItem<String>(
                            value: 'edit',
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context); // لإغلاق المينيو
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const EditPhoto(),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/Edit Icon.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'تعديل',
                                    style: AppFonts.body3(
                                      color: NewColors.supHeading,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const PopupMenuDivider(),
                        PopupMenuItem<String>(
                          value: 'delete',
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/trash.png',
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'حذف',
                                style: AppFonts.body3(color: NewColors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).then((value) {
                      if (value == 'delete') {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: NewColors.alwaysWhite,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              title: Text(
                                'حذف الألبوم',
                                style: AppFonts.headingH5(
                                  color: NewColors.heading,
                                ),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'هذا الاجراء سيحذف البوم احتفال الاجازة',
                                    style: AppFonts.supHeading3(
                                      color: NewColors.supHeading,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'هل انت متأكد من الحذف ؟',
                                    style: AppFonts.body3(
                                      color: NewColors.caption,
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    'الغاء',
                                    style: AppFonts.headingH6(
                                      color: NewColors.primary500,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    // Add delete logic here
                                  },
                                  child: Text(
                                    'حذف',
                                    style: AppFonts.headingH6(
                                      color: NewColors.red,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    });
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
                      'assets/images/more1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => ClipRRect(
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              children: [
                                SizedBox(height: 50),
                                Stack(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                          0.6,
                                      decoration: BoxDecoration(
                                        color: NewColors.alwaysWhite,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                        ),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                            'assets/images/Image1.png',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 12,
                                      right: 12,
                                      child: GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(
                                              0.4,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          padding: const EdgeInsets.all(6),
                                          child: Image.asset(
                                            'assets/images/Close Button.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                    ),
                                    color: NewColors.alwaysWhite,
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Center(
                                          child: Text(
                                            'تحميل',
                                            style: AppFonts.buttonLg(
                                              color: NewColors.primary500,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          // Handle download
                                          Navigator.pop(context);
                                        },
                                      ),
                                      const Divider(
                                        height: 1,
                                        color: LineColors.line,
                                      ),
                                      ListTile(
                                        title: Center(
                                          child: Text(
                                            'حذف',
                                            style: AppFonts.buttonLg(
                                              color: NewColors.red,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          // Handle delete
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/Image1.png',
                        fit: BoxFit.cover,
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
