import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wedzy_captain/Routes/route_name.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Common/themedata.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';
import 'package:wedzy_captain/Utils/Widgets/common_next_button.dart';
import 'package:wedzy_captain/View/Home/Side%20Menu/profile_screen.dart';

RxString profilePicPath1 = "".obs;

class Chatgroupname extends StatefulWidget {
  const Chatgroupname({super.key});

  @override
  State<Chatgroupname> createState() => _ChatgroupnameState();
}

class _ChatgroupnameState extends State<Chatgroupname> {
  @override
  Widget build(BuildContext context) {
    Future<void> pickImageFromGallery() async {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        final CroppedFile? croppedImg = await ImageCropper().cropImage(
            sourcePath: pickedImage.path,
            aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
            compressFormat: ImageCompressFormat.jpg,
            maxHeight: 512,
            maxWidth: 512,
            compressQuality: 100,
            cropStyle: CropStyle.circle,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
            ],
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: "Crop Image",
                toolbarColor: Get.theme.appBarTheme.backgroundColor,
                backgroundColor: Colors.black,
                activeControlsWidgetColor: Colors.red,
                cropFrameColor: Colors.white,
                lockAspectRatio: false,
              ),
              IOSUiSettings(
                title: 'Crop Image',
              ),
            ]);
        if (croppedImg != null) {
          profilePicPath1.value = croppedImg.path;
        }
      }
    }

    Future<void> pickImageFromCamera() async {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.camera);

      if (pickedImage != null) {
        final CroppedFile? croppedImg = await ImageCropper().cropImage(
            sourcePath: pickedImage.path,
            aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
            compressFormat: ImageCompressFormat.jpg,
            maxHeight: 512,
            maxWidth: 512,
            compressQuality: 100,
            cropStyle: CropStyle.circle,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
            ],
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: "Crop Image",
                toolbarColor: Get.theme.appBarTheme.backgroundColor,
                backgroundColor: Colors.black,
                activeControlsWidgetColor: Colors.red,
                cropFrameColor: Colors.white,
                lockAspectRatio: false,
              ),
              IOSUiSettings(
                title: 'Crop Image',
              ),
            ]);
        if (croppedImg != null) {
          profilePicPath1.value = croppedImg.path;
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarDynamic(
        titleTxt: "New Group",
        preferredSize: Size.fromHeight(50),
        // useCustomWidget: true,
        // customWidget: Align(
        //   alignment: Alignment.centerLeft,
        //   child: Padding(
        //     padding: EdgeInsets.only(left: 48.w),
        //     child: Text(
        //       'Add Subject',
        //       style: TextStyle(
        //         color: Color(0xFF707070),
        //         fontSize: 15.sp,
        //         fontFamily: 'AvenirNextCyr',
        //         fontWeight: FontWeight.w400,
        //       ),
        //     ),
        //   ),
        // ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxHeight(23.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: SvgPicture.asset(
                                          "assets/svg/x-circle.svg")),
                                ],
                              ),
                              sizedBoxHeight(30.h),
                              GestureDetector(
                                  onTap: () {
                                    Get.back();
                                    pickImageFromGallery();
                                  },
                                  child: Column(
                                    children: [
                                      SvgPicture.asset('assets/svg/file.svg'),
                                      sizedBoxHeight(5.h),
                                      textPrimary14w500('Upload From Gallery'),
                                    ],
                                  )),
                              sizedBoxHeight(20.h),
                              text373434_15w400('Or'),
                              sizedBoxHeight(34.h),
                              commonNextButton(
                                'Click An Image',
                                margin: 30.w,
                                onTap: () {
                                  Get.back();
                                  pickImageFromCamera();
                                },
                              ),
                              sizedBoxHeight(30.h)
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Obx(
                    () => CircleAvatar(
                        backgroundColor: Color(0xFFFFE7F2),
                        radius: 35,
                        child: profilePicPath1.value != ''
                            ? ClipOval(
                                child: Image(
                                  image: FileImage(File(profilePicPath1.value)),
                                  fit: BoxFit.fill,
                                ),
                              )
                            : Image.asset(
                                "assets/images/camera.png",
                                fit: BoxFit.fill,
                              )),
                  ),
                  // Container(
                  //   width: 56,
                  //   height: 56,
                  //   decoration: ShapeDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage(

                  //         "assets/images/camera.png"),
                  //     ),
                  //     color: Color(0xFFFFE7F2),
                  //     shape: OvalBorder(),
                  //   ),
                  // ),
                ),
                sizedBoxWidth(9.w),
                SizedBox(
                  width: 217,
                  child: TextFormField(
                    readOnly: false,
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.multiline,
                    cursorColor: AppColors.buttoncolour,
                    style: TextStyle(
                      fontFamily: 'Product Sans',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // controller: controller,
                    decoration: InputDecoration(
                      hintText: "Add Group name...",
                      hintStyle: TextStyle(
                        color: Color(0xFF707070),
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                      //Theme.of(context).textTheme.headline3,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: AppColors.buttoncolour),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: AppColors.buttoncolour),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            sizedBoxHeight(10.h),
            TextFormField(
              readOnly: false,
              textCapitalization: TextCapitalization.none,
              keyboardType: TextInputType.multiline,
              cursorColor: AppColors.buttoncolour,
              style: TextStyle(
                fontFamily: 'Product Sans',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // controller: controller,
              decoration: InputDecoration(
                hintText: "Add Description",
                hintStyle: TextStyle(
                  color: Color(0xFF707070),
                  fontSize: 14.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
                //Theme.of(context).textTheme.headline3,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                focusedBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: AppColors.buttoncolour),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: AppColors.buttoncolour),
                ),
              ),
            ),
            sizedBoxHeight(30.h),
            Text(
              'Participants: 2',
              style: TextStyle(
                color: Color(0xFF707070),
                fontSize: 14.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            ),
            sizedBoxHeight(13.h),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/Ellipse 1186 (2).png"),
                          fit: BoxFit.fill,
                        ),
                        shape: OvalBorder(
                            // side: BorderSide(color: Color(0xFF373434)),
                            ),
                      ),
                    ),
                    Text(
                      "Anushka",
                      style: TextStyle(
                        color: Color(0xFF373737),
                        fontSize: 15.sp,
                        fontFamily: 'AvenirNextCyr',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                sizedBoxWidth(32.w),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Ellipse 1190.png"),
                          fit: BoxFit.fill,
                        ),
                        shape: OvalBorder(
                            // side: BorderSide(color: Color(0xFF373434)),
                            ),
                      ),
                    ),
                    Text(
                      "Virat",
                      style: TextStyle(
                        color: Color(0xFF373737),
                        fontSize: 15.sp,
                        fontFamily: 'AvenirNextCyr',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                sizedBoxWidth(32.w),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Ellipse 1191.png"),
                          fit: BoxFit.fill,
                        ),
                        shape: OvalBorder(
                            // side: BorderSide(color: Color(0xFF373434)),
                            ),
                      ),
                    ),
                    Text(
                      "Namrata",
                      style: TextStyle(
                        color: Color(0xFF373737),
                        fontSize: 15.sp,
                        fontFamily: 'AvenirNextCyr',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            sizedBoxHeight(343.h),
            commonNextButton("Create", onTap: () {
              Get.back();
              Get.back();
              Get.back();
            })
          ],
        ),
      )),
    );
  }
}
