import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled_cct/controller/controller.dart';

class Loading extends GetView<CamController> {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.DiagTimer(context,dialog:customedDialog(context));

    return Scaffold(
        backgroundColor: Color(0xff353648),
        body: Center(
          child: Container(
            width: Get.width * 0.6,
            height: Get.height * 0.6,
            color: Colors.transparent,
            child: Column(
              children: [
                SizedBox(width: 172, child: Image.asset("images/loading.png")),
                SizedBox(
                  height: Get.height * .04,
                ),
                SizedBox(
                    width: 35, child: Image.asset("images/loading_point.png")),
                SizedBox(
                  height: Get.height * .01,
                ),
                Text(
                  "잠시만 기다려주세요.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                Text("복약 영상을 저장중입니다.",
                    style: TextStyle(color: Color(0xff868686), fontSize: 16)),
              ],
            ),
          ),
        ));
  }
  Widget customedDialog(context)=>AlertDialog(
      title: Column(
        children: [
          SizedBox(height:Get.height*0.01,),
          SizedBox(
              width:60,height:60,
              child: Image.asset("images/bad_feeling.png")),
          SizedBox(height:Get.height*0.01,),
              Text("얼굴 인증 실패",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,color:Color(0xff373EFF))),

          SizedBox(height:Get.height*.02),
          SizedBox(
              width:Get.width*.7,
              child: Text("등록자의 얼굴과 영상의 얼굴이 다릅니다.",style:TextStyle(fontSize:16))),
          SizedBox(
              width:Get.width*.7,
              child: Text("등록된 얼굴로 다시 시도해주세요.",style:TextStyle(fontSize:16))),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF7F7F7),
              child: MaterialButton(
                splashColor: Colors.white,
                minWidth: Get.width*.25,
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                onPressed: () async {
                  Get.offAndToNamed("/");
                  //Navigator.pop(context);
                },
                child: Text(
                  "종료",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff868686), fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff373EFF),
              child: MaterialButton(
                splashColor: Colors.white,
                minWidth: Get.width*.45,
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                onPressed: () async {
                },
                child: Text(
                  "재시도",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),

          ],
        ),

      ]);
}
