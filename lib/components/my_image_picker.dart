import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fboe_app_writer/provider/image_provider.dart';
import 'package:provider/provider.dart';

class MyImagePicker extends StatelessWidget {
  MyImagePicker({Key? key}) : super(key: key);

  ImageHandlingProvider? _imageHandlingProvider;

  @override
  Widget build(BuildContext context) {
    _imageHandlingProvider =
        Provider.of<ImageHandlingProvider>(context, listen: true);
    final List<Widget> _boxContents = [
      IconButton(
        onPressed: () {
          //이미지 프로바이더에서 메서드 선택
          _imageHandlingProvider!.pickImage();
        },
        icon: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            CupertinoIcons.camera,
            color: Colors.yellow,
          ),
        ),
      ),
      Container(),
      Container(),
      _imageHandlingProvider!.pickedImgs.length <= 4
          ? Container()
          : FittedBox(
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            shape: BoxShape.circle,
          ),
          child: Text(
            '+${(_imageHandlingProvider!.pickedImgs.length - 4).toString()}',
            //style 추후 기재
          ),
        ),
      )
    ];

    return SizedBox(
      height: 100,
      child: GridView.count(
        //shrinkWrap: true,
        padding: const EdgeInsets.all(2),
        scrollDirection: Axis.horizontal,
        crossAxisCount: 1,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: List.generate(
            4,
                (index) =>
                DottedBorder(
                    color: Colors.grey,
                    dashPattern: [5, 3],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    child: Container(
                        decoration: index <=
                            _imageHandlingProvider!.pickedImgs.length - 1 ?
                        BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: FileImage(File(_imageHandlingProvider!.pickedImgs[index].path)),
                            fit: BoxFit.cover
                          )
                        ) : null,
                        child: Center(
                            child: _boxContents[index]),
                    ))).toList(),
      ),
    );
  }
}
