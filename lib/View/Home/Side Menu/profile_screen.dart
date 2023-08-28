import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wedzy_captain/Utils/Common/sized_box.dart';
import 'package:wedzy_captain/Utils/Common/texts.dart';
import 'package:wedzy_captain/Utils/Widgets/common_appbar_dynamic.dart';
import 'package:wedzy_captain/Utils/Widgets/common_next_button.dart';
import '../../../Routes/route_name.dart';
import '../../../Utils/Common/getx_controller.dart';
import '../../../Utils/Common/themedata.dart';

RxString profilePicPath = "".obs;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final commonGetXController = Get.put(CommonGetXController());
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
          profilePicPath.value = croppedImg.path;
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
          profilePicPath.value = croppedImg.path;
        }
      }
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBarDynamic(
        titleTxt: 'Profile',
        preferredSize: const Size.fromHeight(50),
        suffixWidget: Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(RouteName.editProfile);
            },
            child: SvgPicture.asset('assets/svg/edit.svg', width: 24.h),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Stack(
              children: [
                Obx(() => CircleAvatar(
                      backgroundColor: AppColors.white,
                      radius: 60.h,
                      child: profilePicPath.value != ''
                          ? ClipOval(
                              child: Image(
                                image: FileImage(File(profilePicPath.value)),
                                fit: BoxFit.fill,
                              ),
                            )
                          : Image.asset('assets/images/dpBig.png',
                              fit: BoxFit.fill),
                    )),
                Positioned(
                    bottom: 4.h,
                    right: 4.h,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  sizedBoxHeight(30.h),
                                  GestureDetector(
                                      onTap: () {
                                        Get.back();
                                        pickImageFromGallery();
                                      },
                                      child: Column(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/file.svg'),
                                          sizedBoxHeight(5.h),
                                          textPrimary14w500(
                                              'Upload From Gallery'),
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
                      child: CircleAvatar(
                        radius: 14.h,
                        backgroundColor: AppColors.buttoncolour,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: AppColors.white,
                          size: 15.h,
                        ),
                      ),
                    ))
              ],
            )),
            SizedBox(height: 12.h),
            Center(
              child: Column(
                children: [
                  GetBuilder<CommonGetXController>(
                    builder: (controller) {
                      return text373434_18w400(
                          commonGetXController.nameController.text != ''
                              ? commonGetXController.nameController.text
                              : 'Akanksha Surve');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            textBlack16w500('Information'),
            sizedBoxHeight(3.h),
            Container(
              width: 90.w,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1.h,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: const Color(0xFFEE3764)),
                ),
              ),
            ),
            sizedBoxHeight(30.h),
            GetBuilder<CommonGetXController>(
              builder: (controller) {
                return Column(
                  children: [
                    infoWidget(
                        'phone',
                        'Phone',
                        commonGetXController.phoneController.text != ''
                            ? commonGetXController.phoneController.text
                            : '9857468541'),
                    infoWidget(
                        'email',
                        'Email',
                        commonGetXController.emailController.text != ''
                            ? commonGetXController.emailController.text
                            : 'akanksha@gmail.com'),
                    infoWidget('dob', 'Date Of Birth', '18-12-2000'),
                    infoWidget('gender', 'Gender', 'Female'),
                    infoWidget(
                        'location',
                        'Address',
                        commonGetXController.addressController.text != ''
                            ? commonGetXController.addressController.text
                            : 'Malad(West)'),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget infoWidget(String svg, String title, String suffixString) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              SvgPicture.asset('assets/svg/$svg.svg',
                  width: svg == 'location' ? 12.w : 16.w, fit: BoxFit.cover),
              sizedBoxWidth(16.w),
              text373434_15w700(title),
            ],
          ),
          text707070_15w400(suffixString)
        ]),
        sizedBoxHeight(20.h),
        Container(
          width: double.infinity,
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 0.25,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0x66F05E90)),
            ),
          ),
        ),
        sizedBoxHeight(20.h),
      ],
    );
  }
}
