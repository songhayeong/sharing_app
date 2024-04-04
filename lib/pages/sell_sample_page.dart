import 'dart:io';
import 'package:fboe_app_writer/components/my_image_picker.dart';
import 'package:fboe_app_writer/provider/image_provider.dart';
import 'package:fboe_app_writer/provider/sale_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

const List<String> list = <String>["아날로그", "디지털"];

class SellSamplePage extends StatefulWidget {
  SellSamplePage({Key? key}) : super(key: key);

  @override
  State<SellSamplePage> createState() => _SellSamplePageState();
}

class _SellSamplePageState extends State<SellSamplePage> {
  SaleProvider? _saleProvider;
  ImageHandlingProvider? _imageHandlingProvider;

  // final quill.QuillController _controller = quill.QuillController.basic();

  @override
  Widget build(BuildContext context) {
    _saleProvider = Provider.of<SaleProvider>(context, listen: false);
    _imageHandlingProvider =
        Provider.of<ImageHandlingProvider>(context, listen: false);
    final picker = ImagePicker();

    Future<String?> pickImageAndUpload() async {
      final picker = ImagePicker();
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      if (pickedFile == null) return null;

      final url = 'http://example.com/api/upload-image';

      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.files.add(await http.MultipartFile.fromPath('image', pickedFile.path));

      final response = await request.send();

      if (response.statusCode == 200) {
        final imageUrl = await response.stream.bytesToString();
        return imageUrl;
      } else {
        throw Exception('Failed to upload image');
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          "  나만의 개성을 세상에 알려보세요!",
          style: TextStyle(color: Colors.black),
        ),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   color: Colors.black,
        //   icon: const Icon(Icons.arrow_back),
        // ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("임시저장"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: MyImagePicker(),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: Provider.of<SaleProvider>(context, listen: false)
                    .workNameController,
                decoration: InputDecoration(
                  hintText: '작품명',
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.6),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: Provider.of<SaleProvider>(context, listen: false)
                    .hashtagController,
                decoration: InputDecoration(
                  hintText: '# 해시태그',
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.6),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: Provider.of<SaleProvider>(context, listen: false)
                    .workPriceController,
                decoration: InputDecoration(
                  hintText: '가격',
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.6),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: Provider.of<SaleProvider>(context, listen: false)
                    .workDescriptionController,
                decoration: InputDecoration(
                  hintText: '작품설명',
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6)),
                ),
              ),
              DropdownfilterButton(),
              ElevatedButton(
                onPressed: () {
                  // 이미지만 일단 전송되는 폼을 준비하면 될ㅑ
                  _imageHandlingProvider!.uploadImage();
                },
                child: Text("전송"),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 0),
                    //   child: quill.QuillToolbar.basic(
                    //     controller: _controller,
                    //     fontSizeValues: const {
                    //       'Small': '7',
                    //       'Medium': '20.5',
                    //       'Large': '40'
                    //     },
                    //     showAlignmentButtons: false,
                    //     //onImagePickCallback: ,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.lightBlueAccent,
                              offset: Offset(5.0, 5.0),
                              blurRadius: 10.0,
                              spreadRadius: 2.0),
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0)
                        ]),
                        // child: quill.QuillEditor.basic(
                        //   controller: _controller,
                        //   readOnly: false,
                        // ),
                      ),
                    )
                  ],
                ),
              ),
              // quill part입니다 적용할지 말지는 추후 판단
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownfilterButton extends StatefulWidget {
  const DropdownfilterButton({Key? key}) : super(key: key);

  @override
  State<DropdownfilterButton> createState() => _DropdownfilterButtonState();
}

class _DropdownfilterButtonState extends State<DropdownfilterButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 10,
      underline: Container(
        height: 2,
        color: Color(0xffffc909),
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
