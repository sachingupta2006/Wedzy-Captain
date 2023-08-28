import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonGetXController extends GetxController {
  //name
  final _nameController = TextEditingController();
  get nameController => _nameController;
//phone
  final _phoneController = TextEditingController();
  get phoneController => _phoneController;
  //email
  final _emailController = TextEditingController();
  get emailController => _emailController;
  //address
  final _addressController = TextEditingController();
  get addressController => _addressController;

  changedNameValue() {
    _nameController.text = _nameController.text;
    _phoneController.text = _phoneController.text;
    _emailController.text = _emailController.text;
    _addressController.text = _addressController.text;
    update();
  }
}


// TextEditingController nameController = TextEditingController();
// TextEditingController lastNameController = TextEditingController();
// TextEditingController phoneController = TextEditingController();
// TextEditingController emailController = TextEditingController();
// TextEditingController addressController = TextEditingController();

// String? nameValue;
// String? lastNameValue;
// String? phoneValue;
// String? emailValue;
// String? addressValue;