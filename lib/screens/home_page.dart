import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_collage_app/screens/ImageCollage.dart';
import 'package:image_collage_app/screens/ImageFrames.dart';
import 'package:image_collage_app/screens/ImageShape.dart';
import 'package:image_collage_app/screens/ImageTiling.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.1),
        leading: Icon(Icons.menu_rounded, color: Colors.black, size: 40,),

        elevation: 0,
      ),

      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 140,
                width: double.infinity,
                child: Stack(
                  children: [

                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: const Text(
                              "Create Moments that Lasts Lifetime",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Trajan Pro',
                                color: Colors.black,
                                fontSize: 20, // Adjust the font size as needed
                              ),
                              textAlign: TextAlign.center,
                            ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(child: Container(
                            child: Stack(children: [
                            ClipRRect(borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),),
                          child: Image.asset('assets/image1.jpg',
                            width: double.infinity,height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),],),
                        ),),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50,),
              StaggeredGrid.count(crossAxisCount: 3,
                mainAxisSpacing: 5,crossAxisSpacing: 5,
              children: [
                StaggeredGridTile.count(
                   crossAxisCellCount: 1,
                   mainAxisCellCount: 2,
                   child: InkWell( onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => ImageCollage()));
                   },
                     child: Container(
                       height: 120,
                       width: 70,
                       decoration: BoxDecoration(
                         color: Colors.blue,
                         borderRadius: BorderRadius.circular(30),
                         gradient: LinearGradient(
                           begin: Alignment.topLeft,
                           end: Alignment.bottomRight,
                           colors: [Colors.lightGreen, Colors.deepPurpleAccent, Colors.lime],
                         ),),
                       child: const Center(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(
                               Icons.pie_chart_outline,
                               size: 50,
                               color: Colors.white, // Icon color
                             ),
                             SizedBox(height: 10,),
                             Text(
                               "Collage",
                               style: TextStyle(
                                   color: Colors.white,
                                   fontWeight: FontWeight.w700// Text color
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                 ),

                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: InkWell( onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ImageFrame()));
                  },child: Container(
                    height: 120,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.blue, Colors.black54, Colors.lime],
                      ),),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.filter_frames_outlined,
                            size: 50,
                            color: Colors.white, // Icon color
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Frame",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700// Text color
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ),
                ),

                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: InkWell( onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ImageShape()));
                  },child: Container(
                    height: 120,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.blue, Colors.purple, Colors.lime],
                      ),),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.format_shapes,
                            size: 50,
                            color: Colors.white, // Icon color
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Shape",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700// Text color
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ),
                ),

                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child:InkWell( onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ImageTiling()));
                  },child: Container(
                    height: 120,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.lightGreen, Colors.cyan, Colors.lime],
                      ),),
                    child: Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.splitscreen,
                          size: 50,
                          color: Colors.white, // Icon color
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Image Tiling",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700// Text color
                          ),
                        ),
                      ],
                    ),),
                  ),
                  ),
                ),

              ],),
              SizedBox(height: 20,),

              Text("Recents"),
              Expanded(child: Wrap(
               children: [
                 ],
              )
              ),
          ],
          ),
        ),
      ),
    );
  }
}
