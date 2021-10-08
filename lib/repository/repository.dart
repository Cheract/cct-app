import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


final baseUrl="http://13.124.252.101:8081";

class MainRepository {

  MainRepository();

  Future<dynamic> signinWithUserInfo(String userAccount,String userPassword) async {
    try{
      var response = await Dio().post(baseUrl+"/signin",
          data: {'userAccount':'${userAccount}',
            'userPassword':'${userPassword}',});
      print(response);
      return response;
    }catch(e){
      print(e);
    }
  }
}

class CamRepository {

  CamRepository();

  Future<dynamic> sendVideo(fileForSend) async {
    var formData = FormData.fromMap({
      "video": await MultipartFile.fromFile(fileForSend.path,filename:"${fileForSend.path}")
    });
    var response = await Dio().post(baseUrl+"/video",
        data: formData);
    print(response);
    return response;
  }
}