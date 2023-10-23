// import 'dart:async';
// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:screenshot/screenshot.dart';
// import 'package:text_editor/text_editor.dart';
//
// class Collage extends StatefulWidget {
//   final List<File?> selectedImages;
//
//   Collage({Key? key, required this.selectedImages}) : super(key: key);
//
//
//   @override
//   State<Collage> createState() => _CollageState();
// }
//
// class _CollageState extends State<Collage> {
//
//   bool isEditingText = false;
//   Color? screenColor = Colors.white;
//   final ScreenshotController screenshotController = ScreenshotController();
//     Uint8List? imageFile ;
//
//     Future<void> saveImage(Uint8List bytes) async{
//       try{
//         final directory = await getDownloadsDirectory();
//
//         final fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
//
//         final file = File('${directory!.path}/${fileName}');
//
//         await file.writeAsBytes(bytes);
//       }
//       catch(e){
//         print(e);
//       }
//
//     }
//
//   void capture(){
//     screenshotController.capture().then((image) {
//      imageFile = image!;
//      saveImage(imageFile!);
//
//     });
//
//   }
//   TextStyle _textStyle = TextStyle(
//     fontSize: 50,
//     color: Colors.white,
//     fontFamily: 'OpenSans',
//   );
//   String _text = 'Sample Text';
//   TextAlign _textAlign = TextAlign.start;
//   Offset _textOffset = Offset(50, 50);
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(title: Text("Result"),
//       actions: [
//         Row(
//           children: [
//             InkWell(
//               onTap: (){
//                 capture();
//          },
//               child: Icon(
//                 Icons.save, color: Colors.white,),
//             ),
//                         Text("Save", style: TextStyle(
//               fontWeight: FontWeight.w700,
//               fontSize: 18,
//             ),),
//             SizedBox(width: 10,)
//           ],
//         ),
//       ],),
//       backgroundColor: screenColor,
//
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: Screenshot(
//           controller: screenshotController,
//           child: Stack(
//              children:[
//                StaggeredGrid.count(crossAxisCount: 6,mainAxisSpacing: 3,crossAxisSpacing: 3,
//             children: [
//                StaggeredGridTile.count(
//                   crossAxisCellCount: 3,
//                   mainAxisCellCount: 3,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       border: Border.all(
//                         style: BorderStyle.solid,
//                         width: 2.0,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     child: widget.selectedImages[0] == null
//                         ? Icon(Icons.image, size: 50, color: Colors.grey)
//                         : Image.file(
//                       widget.selectedImages[0]!,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               StaggeredGridTile.count(
//                 crossAxisCellCount: 3,
//                 mainAxisCellCount: 4,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(
//                       style: BorderStyle.solid,
//                       width: 2.0,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   child: widget.selectedImages[1] == null
//                       ? Icon(Icons.image, size: 50, color: Colors.grey)
//                       : Image.file(
//                     widget.selectedImages[1]!,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//
//               StaggeredGridTile.count(
//                 crossAxisCellCount: 3,
//                 mainAxisCellCount: 4,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(
//                       style: BorderStyle.solid,
//                       width: 2.0,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   child: widget.selectedImages[2] == null
//                       ? Icon(Icons.image, size: 50, color: Colors.grey)
//                       : Image.file(
//                     widget.selectedImages[2]!,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               StaggeredGridTile.count(
//                 crossAxisCellCount: 3,
//                 mainAxisCellCount: 3,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(
//                       style: BorderStyle.solid,
//                       width: 2.0,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   child: widget.selectedImages[3] == null
//                       ? Icon(Icons.image, size: 50, color: Colors.grey)
//                       : Image.file(
//                     widget.selectedImages[3]!,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               )
//
//             ],
//             ),
//                GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      screenColor = Colors.grey[200];
//                      isEditingText = !isEditingText;
//                    });
//                  },
//
//                  child: Container(
//                    // Conditionally show TextEditor or Text based on isEditingText
//                    child: isEditingText
//                        ? Padding(
//                          padding: const EdgeInsets.symmetric(vertical: 30),
//                          child: TextEditor(
//                      fonts: ['Trajan Pro', 'OpenSans', 'Schyler'],
//                      onEditCompleted: (style, align, text) {
//                          setState(() {
//                            _textStyle = style;
//                            _textAlign = align;
//                            _text = text;
//                            isEditingText = false;
//                            screenColor = Colors.white;// Disable editing mode
//                          });
//                      },
//                    ),
//                        )
//                        : Text(
//                      _text,
//                      style: _textStyle,
//                      textAlign: _textAlign,
//                    ),
//                  ),
//                ),
//              ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import 'package:text_editor/text_editor.dart';

class Collage extends StatefulWidget {
  final List<File?> selectedImages;

  Collage({Key? key, required this.selectedImages}) : super(key: key);


  @override
  State<Collage> createState() => _CollageState();
}

class _CollageState extends State<Collage> {

  bool isEditingText = false;
  Color? screenColor = Colors.white;
  final ScreenshotController screenshotController = ScreenshotController();
  Future<void> _captureAndSaveScreenshot() async {
    try {
      Uint8List? image = await screenshotController.capture();
      await ImageGallerySaver.saveImage(image!);
      print("Screenshot saved to gallery");
    } catch (e) {
      print("Error: $e");
    }
  }




  TextStyle _textStyle = TextStyle(
    fontSize: 50,
    color: Colors.white,
    fontFamily: 'OpenSans',
  );
  String _text = 'Sample Text';
  TextAlign _textAlign = TextAlign.start;
  Offset _textOffset = Offset(50, 50);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Result"),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: (){
                  _captureAndSaveScreenshot();
                },
                child: Icon(
                  Icons.save, color: Colors.white,),
              ),
              Text("Save", style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),),
              SizedBox(width: 10,)
            ],
          ),
        ],),
      backgroundColor: screenColor,

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Screenshot(
          controller: screenshotController,
          child: Stack(
            children:[
              StaggeredGrid.count(crossAxisCount: 6,mainAxisSpacing: 3,crossAxisSpacing: 3,
                children: [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 3,
                    mainAxisCellCount: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          style: BorderStyle.solid,
                          width: 2.0,
                          color: Colors.grey,
                        ),
                      ),
                      child: widget.selectedImages[0] == null
                          ? Icon(Icons.image, size: 50, color: Colors.grey)
                          : Image.file(
                        widget.selectedImages[0]!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 3,
                    mainAxisCellCount: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          style: BorderStyle.solid,
                          width: 2.0,
                          color: Colors.grey,
                        ),
                      ),
                      child: widget.selectedImages[1] == null
                          ? Icon(Icons.image, size: 50, color: Colors.grey)
                          : Image.file(
                        widget.selectedImages[1]!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  StaggeredGridTile.count(
                    crossAxisCellCount: 3,
                    mainAxisCellCount: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          style: BorderStyle.solid,
                          width: 2.0,
                          color: Colors.grey,
                        ),
                      ),
                      child: widget.selectedImages[2] == null
                          ? Icon(Icons.image, size: 50, color: Colors.grey)
                          : Image.file(
                        widget.selectedImages[2]!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 3,
                    mainAxisCellCount: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          style: BorderStyle.solid,
                          width: 2.0,
                          color: Colors.grey,
                        ),
                      ),
                      child: widget.selectedImages[3] == null
                          ? Icon(Icons.image, size: 50, color: Colors.grey)
                          : Image.file(
                        widget.selectedImages[3]!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )

                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    screenColor = Colors.grey[200];
                    isEditingText = !isEditingText;
                  });
                },

                child: Container(
                  // Conditionally show TextEditor or Text based on isEditingText
                  child: isEditingText
                      ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: TextEditor(
                      fonts: ['Trajan Pro', 'OpenSans', 'Schyler'],
                      onEditCompleted: (style, align, text) {
                        setState(() {
                          _textStyle = style;
                          _textAlign = align;
                          _text = text;
                          isEditingText = false;
                          screenColor = Colors.white;// Disable editing mode
                        });
                      },
                    ),
                  )
                      : Text(
                    _text,
                    style: _textStyle,
                    textAlign: _textAlign,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
