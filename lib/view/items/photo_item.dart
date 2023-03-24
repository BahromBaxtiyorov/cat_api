
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../models/photo_model.dart';

Widget photoItem(PhotoModel photo) {
  return Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0,3)
        )
      ]
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          photo.url,
          height: 130,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 8,),
        Row(
          children: [
            Text(
             "height:${photo.height.toString()}",
              maxLines: 1,
                overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(width: 5,),
            Text(
              "height:${photo.width.toString()}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15),
            ),
          ],
        )
      ],
    ),
  );
}