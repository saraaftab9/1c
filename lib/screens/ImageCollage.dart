import 'package:flutter/material.dart';
import 'package:image_collage_app/screens/StaggeredCollageView.dart';
import 'package:image_collage_app/screens/select_image.dart';
import 'package:image_picker/image_picker.dart';
class ImageCollage extends StatefulWidget {
  const ImageCollage({super.key});

  @override
  State<ImageCollage> createState() => _ImageCollageState();
}

class _ImageCollageState extends State<ImageCollage> {

  ImagePicker picker = ImagePicker();
  List<XFile>? imageList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Collage"),),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectImage()));
              },
                child: Container(
                  height: 150,
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/collage1.jpeg'),),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 2.0,
                    ),
                  ),
                ),
                ),
              Container(
                height: 40,
                width: 120,
                child: Center(child: Text("Collage 1", style: TextStyle(fontWeight: FontWeight.w700),)),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                selectImages();

              }, child: Text("Select Images")),
            ],
          ),
        ),
      ),
    );
  }

  void selectImages() async{

    final List<XFile>? selectList = await picker.pickMultiImage();
    if(selectList!.isNotEmpty){
      imageList!.addAll(selectList);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StaggeredCollageView(selectedImages: imageList!),
        ),
      );
    }

    print("select ${selectList.length.toString()}");

  }
}
