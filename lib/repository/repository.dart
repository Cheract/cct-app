import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


final baseUrl="https://10.0.2.2:3000";

class MainRepository {

  MainRepository();

  Future<dynamic> signinWithUserInfo(String userAccount,String userPassword) async {
    try{
      var response = await Dio().post(baseUrl+"/signin",
          data: {'userAccount':'${userAccount}',
            'userPassword':'${userPassword}',});
      print(response);
      return response.data;
    }catch(e){
      print(e);
    }
  }
}