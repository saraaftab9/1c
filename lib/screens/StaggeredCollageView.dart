import 'package:flutter/material.dart';
import 'dart:io';
 import 'package:image_picker/image_picker.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
class StaggeredCollageView extends StatelessWidget {
  final List<XFile> selectedImages;

  StaggeredCollageView({required this.selectedImages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staggered Collage"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2, // Adjust the number of columns as needed
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemCount: selectedImages.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: double.infinity, // Expand the item to fill the space
              height: 200, // Adjust the height as needed
              child: Image.file(
                File(selectedImages[index].path),
                fit: BoxFit.cover,
              ),
            );
          },
          staggeredTileBuilder: (int index) {
            if (selectedImages.length == 1) {
              return StaggeredTile.count(1, 2); // Adjust the size as needed
            } else if (selectedImages.length == 2) {
              return StaggeredTile.count(index % 2 == 0 ? 1 : 1, 1);
            } else if (selectedImages.length == 3) {
              return StaggeredTile.count(index == 0 ? 2 : 1, 2);

            }  else if (selectedImages.length == 4) {
              return StaggeredTile.count(index == 0 ? 2 : 2, 1);
            }
            else {
              return StaggeredTile.count(1, 1);
            }
          },
        ),
      ),
    );
  }
}
