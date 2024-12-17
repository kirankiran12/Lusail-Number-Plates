import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vehicle_project/Home/request.dart';
import 'package:get/get.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _spaceController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _platenoController = TextEditingController();
  final TextEditingController _ddController = TextEditingController();
  final TextEditingController _mmController = TextEditingController();
  final TextEditingController _yyyyController = TextEditingController();
  final TextEditingController _platenumber2Controller = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _titlenoController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  void dispose() {
    _spaceController.dispose();
    _titlenoController.dispose();
    _platenoController.dispose();
    _ddController.dispose();
    _phoneController.dispose();
    _mmController.dispose();
    _yyyyController.dispose();
    _platenumber2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCABA99),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Back'.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 10,
                color: Colors.black,
              ),
              Row(
                children: [
                  const SizedBox(width: 16),
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/car2.jpg'),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cars'.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Number Plates'.tr,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _selectedImage == null
                      ? Center(
                          child: ElevatedButton(
                            onPressed: _pickImage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF978C74),
                              foregroundColor: Colors.white,
                            ),
                            child: Text(
                              "Choose Image".tr,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            _selectedImage!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 20),
              _buildFormField(
                  'Title'.tr, _titleController, 'Please enter a title'.tr),
              _buildFormField('Plate Number'.tr, _platenoController,
                  'Please enter a plate number'.tr),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    'Issue Date'.tr,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  _buildDateField(_ddController, 'dd'.tr),
                  const SizedBox(width: 20),
                  _buildDateField(_mmController, 'MM'.tr),
                  const SizedBox(width: 20),
                  _buildDateField(_yyyyController, 'YYYY'.tr),
                ],
              ),
              _buildFormField('Plate Number2'.tr, _platenumber2Controller,
                  'Please enter a second plate number'.tr),
              _buildFormField('Location'.tr, _locationController,
                  'Please enter a location'.tr),
              _buildFormField(
                  'Price'.tr, _priceController, 'Please enter a price'.tr),
              _buildFormField('Description'.tr, _descriptionController,
                  'Please enter a description'.tr,
                  maxLines: 5, minLines: 3),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF300F1C),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Request(),
                      ),
                    );
                  }
                },
                child: Text('Post Now'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(
      String label, TextEditingController controller, String errorMsg,
      {int maxLines = 1, int minLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 20),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return errorMsg;
              }
              return null;
            },
            maxLines: maxLines,
            minLines: minLines,
          ),
        ],
      ),
    );
  }

  Widget _buildDateField(TextEditingController controller, String hint) {
    return SizedBox(
      width: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: hint.tr,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $hint'.tr.tr;
            }
            return null;
          },
        ),
      ),
    );
  }
}
