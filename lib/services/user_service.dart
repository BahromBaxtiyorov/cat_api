import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import '../api/api.dart';
import '../config/dio-config.dart';
import '../models/photo_model.dart';
import 'log_service.dart';

class CatService {
  static final CatService _inheritance = CatService._init();
  static CatService get inheritance => _inheritance;
  CatService._init();

  static Future<bool> uploadImage(String path) async {
    Log.wtf(path);
    try {
      FormData formData = FormData.fromMap(
          {'file': await MultipartFile.fromFile(path,
              contentType: MediaType("image", "jpeg"))}); // or png
      Response res = await  DioConfig.inheritance.createRequest().post(
          Urls.uploadImage,
          data: formData,
          options: Options(headers: {
            "Content-Type": "multipart/form-data",
            "x-api-key": Urls.myApiKey
          })
      );
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());
      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        Log.e("${res.statusMessage} ${res.statusCode}");
        return false;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.i(e.response!.statusCode.toString()+e.message!..toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
  }

  static Future<List<PhotoModel>?> getPhoto() async {
    try {
      Response res = await DioConfig.inheritance.createRequest().get(
          Urls.getImages,
          options: Options(headers: {
            "Content-Type": "multipart/form-data",
            "x-api-key": Urls.Key
          })
      );
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200) {
        List<PhotoModel> userList = [];
        for (var e in (res.data as List)) {
          userList.add(PhotoModel.fromJson(e));
        }
        return userList;
      } else {
        Log.e("${res.statusMessage} ${res.statusCode}");
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
    }
    return null;
  }


  static Future<bool> deleteImage() async {
    try {
      Response res = await DioConfig.inheritance.createRequest().delete(
        Urls.deleteImages,  /* + id.toString(), */
          options: Options(headers: {
            "Content-Type": "multipart/form-data",
            "x-api-key": Urls.Key
          })
      );
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;

      } else {
        Log.e("${res.statusMessage} ${res.statusCode}");
        return false;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
  }
}







  // static Future<bool> uploadImage(String path) async {
  //   try {
  //     FormData formData = FromData =
  //         FormData.fromMap(map)
  //     Response res = await DioConfig.inheritance.createRequest().post(
  //         Urls.addPost,
  //         data:  {
  //           "postId": newPost.postId,
  //           "name": newPost.name,
  //           "email": newPost.email,
  //           "body": newPost.body
  //         }
  //     );
  //     Log.i(res.data.toString());
  //     Log.i(res.statusCode.toString());
  //
  //     if (res.statusCode == 200 || res.statusCode == 201) {
  //       return true;
  //
  //     } else {
  //       Log.e("${res.statusMessage} ${res.statusCode}");
  //       return false;
  //     }
  //   } on DioError catch (e) {
  //     if (e.response != null) {
  //       Log.e(e.response!.toString());
  //       return false;
  //     } else {
  //       rethrow;
  //     }
  //   } catch (e) {
  //     Log.e(e.toString());
  //     return false;
  //   }
  // }




  // static Future<List<UserModel>?> getUser() async {
  //   try {
  //     Response res = await DioConfig.inheritance.createRequest().get(
  //         Urls.getUsers);
  //     Log.i(res.data.toString());
  //     Log.i(res.statusCode.toString());
  //
  //     if (res.statusCode == 200) {
  //       List<UserModel> userList = [];
  //       for (var e in (res.data as List)) {
  //         userList.add(UserModel.fromJson(e));
  //       }
  //       return userList;
  //     } else {
  //       Log.e("${res.statusMessage} ${res.statusCode}");
  //     }
  //   } on DioError catch (e) {
  //     if (e.response != null) {
  //       Log.e(e.response!.toString());
  //     } else {
  //       rethrow;
  //     }
  //   } catch (e) {
  //     Log.e(e.toString());
  //   }
  //   return null;
  // }





