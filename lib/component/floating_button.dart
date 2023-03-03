import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../src/theme.dart';

class FloatingButton extends StatelessWidget {
  final functionGallery;
  final functionCamer;
  FloatingButton({required this.functionGallery, required this.functionCamer});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: (){
      showDialog(
          context: context,
          builder: (builder){
        return AlertDialog(
          title: Text('Make a choice'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text('Gallery'),
                  onTap: functionGallery
                ),
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Camer'),
                  onTap: functionCamer,
                )
              ],
            ),
          ),
        );
          },
      );
    },
      child: Icon(Icons.image_outlined),
      backgroundColor: KmainColor,
    );
  }
}
