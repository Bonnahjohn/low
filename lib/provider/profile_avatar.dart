// ignore_for_file: sized_box_for_whitespace, avoid_print, library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CircleAvatarWithUpload extends StatefulWidget {
  const CircleAvatarWithUpload({super.key});

  @override
  _CircleAvatarWithUploadState createState() {
    return _CircleAvatarWithUploadState();
  }
}

class _CircleAvatarWithUploadState extends State<CircleAvatarWithUpload> {
  File? _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: getImage,
      child: Container(
        width: 50,
        height: 50,
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.blue,
          backgroundImage: _image != null ? FileImage(_image!) : null,
          child: _image == null
              ? const Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                )
              : null,
        ),
      ),
    );
  }
}
