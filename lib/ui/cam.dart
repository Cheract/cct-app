import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled_cct/binding/binding.dart';
import 'package:untitled_cct/controller/controller.dart';

import 'loading.dart';



class Cam extends GetView<CamController> {
  const Cam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        child: Stack(
          children: [
            Obx(() => _cameraPreview()),

            //Align(alignment: Alignment.bottomCenter, child: _button()),
            Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fitHeight,
                alignment: FractionalOffset.topCenter,
                image: AssetImage("images/exclude.png"),
              )),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 0.25 * Get.height,
                    child: Column(
                      children: [
                        Obx((){
                          if(controller.start.value==0){
                            controller.stopCameraRecording();
                            Get.to(Loading(),binding: MainBinding());
                          }
                          return Text(
                              "${(controller.start.value/60).toInt()}:"
                                  "${(controller.start.value-(controller.start.value/60).toInt()*controller.start.value).toString().padLeft(2,'0')}"
                              ,style:TextStyle(fontSize:48,color:Colors.white,fontWeight: FontWeight.bold));}),
    Text("자동 촬영 중 입니다.",style:TextStyle(fontSize:20,color:Colors.white))
    ,_submitButton(),
                      ],
                    ))),
          ],
        ),
      ),
    ); //camera setting
  }

  Widget _submitButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff373EFF),
        child: MaterialButton(
          splashColor: Colors.white,
          minWidth: Get.width,
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          onPressed: () async {
            controller.timer!.cancel();
            await controller.stopCameraRecording();
            Get.to(Loading(),binding: MainBinding());
          },
          child: Text(
            "촬영 종료",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _cameraPreview() {
    if (controller.camInitialized.value) {
      return Transform.scale(
          scale: (Get.height / Get.width),
          child: CameraPreview(controller.cameraController!));
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
