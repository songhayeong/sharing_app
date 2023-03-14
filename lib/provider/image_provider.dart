import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class ImageProvider extends ChangeNotifier{
  final picker = ImagePicker();
  List<XFile> pickedImgs = [];

  void pickImage() async {
    final List<XFile> pickedFile = await picker.pickMultiImage();
    pickedImgs = pickedFile;
    notifyListeners();
  }

  uploadImage() async {
    Dio dio = Dio();
    //final url = Uri.parse('http://192.168.123.2:6500/upload-aws/');
    var urilist = 'http://192.168.123.2:6500/upload-aws/';
    final List<MultipartFile> _files =
        pickedImgs.map((img) => MultipartFile.fromFileSync(img.path)).toList();
    FormData _formData = FormData.fromMap({"key": _files});
    final res = await dio.post(
        urilist, data: _formData).then((res) {
      return res.data;
    });
    notifyListeners();
  }
}
