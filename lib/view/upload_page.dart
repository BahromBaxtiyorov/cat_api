import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import '../services/user_service.dart';
import '../utils/utils.dart';


class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {

  final ImagePicker _picker = ImagePicker();

  File _image = File('');
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload image'),),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: _image.path == ''
                  ? const Center(child: Text("No image selected"))
                  : Image.file(_image,fit: BoxFit.cover,),
            ),
            ElevatedButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    height: 150,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.camera_alt),
                          title: const Text("Take a photo"),
                          onTap: () async {
                            await _pickImage(ImageSource.camera);
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.image),
                          title: Text("Pick from gallery"),
                          onTap: () async {
                            await _pickImage(ImageSource.gallery);
                            print('=====================================================================');
                            print(_image.path);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                child: Text('Get Image')),
            ElevatedButton(
                onPressed: () async {
                  if(_image.path != ''){
                    var result = await CatService.uploadImage(_image.path);
                    if (result) {
                      Utils.snackBarSuccess(
                          'Upload successfully', context);
                    } else {
                      Utils.snackBarError('Something is wrong', context);
                    }
                  }
                },
                child: Text('Upload')),
            ElevatedButton(onPressed: ()async {
              bool result = await
              CatService.deleteImage();
              if(result){
                Utils.snackBarSuccess('Deleted successfully', context);
              } else {
                Utils.snackBarError('Something is wrong', context);
              }
            } ,
                child: Text("Delete"))
          ],
        ),
      ),
    );;
  }
}