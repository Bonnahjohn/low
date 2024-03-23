import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CircleAvatarWithUpload extends StatefulWidget {
  @override
  _CircleAvatarWithUploadState createState() => _CircleAvatarWithUploadState();
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
