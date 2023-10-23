import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_collage_app/screens/collage.dart';
import 'package:image_picker/image_picker.dart';

class SelectImage extends StatefulWidget {
  const SelectImage({Key? key}) : super(key: key);

  @override
  State<SelectImage> createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  List<File?> file = List.filled(4, null);

  Future _getImageFromGallery(int index) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        file[index] = File(pickedFile.path);
      }
    });
  }

  Future _getImageFromCamera(int index) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        file[index] = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Images")),

      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Wrap(
                  spacing: 10, // Horizontal spacing
                  runSpacing: 10,
                  children: List.generate(4, (index) {
                    return InkWell(
                      onTap: () {
                        _showImageSelectionDialog(context, index);
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            style: BorderStyle.solid,
                            width: 2.0,
                            color: Colors.grey,
                          ),
                        ),
                        child: file[index] == null
                            ? Icon(Icons.image, size: 50, color: Colors.grey)
                            : Image.file(
                          file[index]!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Collage(selectedImages: file)));

              }, child: Text('Next'))
            ],
          ),
        ),
    );
  }

  void _showImageSelectionDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select an Image'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Pick from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _getImageFromGallery(index); // Pass the index
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Take a Photo'),
                onTap: () {
                  Navigator.pop(context);
                  _getImageFromCamera(index); // Pass the index
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
