import 'package:cat_api/view/photo_upload_page.dart';
import 'package:cat_api/view/upload_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/user_service.dart';
import 'items/photo_item.dart';

class PhotoPage extends StatefulWidget {
  const  PhotoPage({Key? key}) : super(key: key);

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(title: Text("Photo page")),
          body: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 8),
            child: FutureBuilder(
              future: CatService.getPhoto(),
              builder: (context,snapshot){
                if(snapshot.hasData) {
                  return GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,),
                    itemBuilder: (context,index){
                      return InkWell(
                          onTap: (){
                            Navigator.push(context,
                            MaterialPageRoute(builder:(context){
                              return UploadPage();
                            }));
                          },
                          child: photoItem(snapshot.data![index]));
                      },
                  );
                }
                return const Center(
                  child: Text("No data"),
                );
                },
            ),
          )
      );
  }
}
