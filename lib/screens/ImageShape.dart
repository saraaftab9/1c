import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ImageShape extends StatefulWidget {
  const ImageShape({super.key});

  @override
  State<ImageShape> createState() => _ImageShapeState();
}

class _ImageShapeState extends State<ImageShape> {
  File? file;
  bool isCircular = false;
  CustomClipper<Path>? customClipper;
  ScreenshotController screenshotController = ScreenshotController();
  List<CustomClipper<Path>> customClippers = [

  ];
  int selectedClipperIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shape'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  ElevatedButton(onPressed: (){
                    _getImageFromGallery();

                  }, child: Text("Select Image")),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: (){
                    _captureAndSaveScreenshot();
                  }, child: Text("Save Image")),
                ],
              ),
              Screenshot(
                controller: screenshotController,
                child: isCircular
                    ? ClipOval(
                  child: Container(
                    width: 400,
                    height: 400,
                    color: Colors.grey,
                    child: file == null
                        ? Icon(Icons.image, size: 50, color: Colors.white)
                        : Image.file(
                      file!,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    width: 400,
                    height: 400,
                    color: Colors.grey,
                    child: file == null
                        ? Icon(Icons.image, size: 50, color: Colors.white)
                        : Image.file(
                      file!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [

                  Expanded(
                    child: ElevatedButton(onPressed: (){
                      setState(() {
                        isCircular = false;
                      });

                    }, child: Text("Rectangular Shape")),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: ElevatedButton(onPressed: (){
                      setState(() {
                        isCircular = true;
                      });
 
                    }, child: Text("Circular Shape")),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: ElevatedButton(onPressed: (){
                      setState(() {
                        isCircular = true;
                      });
                    }, child: Text("Circular Shape")),
                  ),
                ],
              ),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius:30,
                          backgroundImage: AssetImage('assets/im.jpg'),
                          child: Icon(Icons.rectangle, size: 40,),
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius:30,
                          backgroundImage: AssetImage('assets/im.jpg'),
                          child: Icon(Icons.rectangle, size: 40,),
                        ),
                        SizedBox(width: 10),

                      ],
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
  Future _getImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
      }
    });
  }

  Future<void> _captureAndSaveScreenshot() async {
    try {
      Uint8List? image = await screenshotController.capture();
      await ImageGallerySaver.saveImage(image!);
      print("Screenshot saved to gallery");
    } catch (e) {
      print("Error: $e");
    }
  }

  }
