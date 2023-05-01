import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class ImageHandlingProvider extends ChangeNotifier{
  final picker = ImagePicker();
  List<XFile> pickedImgs = [];

  Future<void> pickImage() async {
    final List<XFile> pickedFile = await picker.pickMultiImage();
    pickedImgs = pickedFile;
    notifyListeners();
  }

  Future<void> uploadImage() async {
    Dio dio = Dio();
    //final url = Uri.parse('http://192.168.123.2:6500/upload-aws/');
    var urilist = 'http://192.168.123.2:6500/upload_aws/';
    final List<MultipartFile> _files =
    pickedImgs.map((img) => MultipartFile.fromFileSync(img.path)).toList();
    FormData _formData = FormData.fromMap({"name_img": "test","in_files":_files});
    final res = await dio.post(
        urilist, data: _formData).then((res) {
      return res.data;
    });
    notifyListeners();
  }
}