import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';
import 'package:untitled_cct/controller/controller.dart';
import 'package:untitled_cct/ui/utils.dart';

class FixCam extends GetView<MainController> {
  const FixCam({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset : false,
        body: SizedBox(
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(children: [
                      SizedBox(height: Get.height * 0.15),
                      Column(
                        children: [
                          Text("핸드폰을 고정해주세요.",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)),
                          SizedBox(height:Get.height*0.02,),
                          SizedBox(
                              width:136,height:136,
                              child: Image.asset("images/smile.png"))
                        ],
                      ),

                      SizedBox(height: Get.height * 0.05),
                      Column(
                        children: [
                          Container(width: Get.width*.8, height: Get.height*.4,color: Colors.transparent,
                              child:Align(
                                alignment:Alignment.topLeft,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("올바른 촬영 TIP.",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)),
                                      ],
                                    ),
                                    SizedBox(height:Get.height*.02),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: SizedBox(
                                                width:24,height:24,
                                                child: Icon(Icons.check)),
                                          ),

                                        SizedBox(
                                            width:Get.width*.7,
                                            child: Text("영역 안에 얼굴을 맞추고 정면을 바라봐주세요.",style:TextStyle(fontSize:18))),
                                      ],
                                    ),Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: SizedBox(
                                              width:24,height:24,
                                              child: Icon(Icons.check)),
                                        ),
                                        SizedBox(
                                            width:Get.width*.7,
                                            child: Text("너무 밝거나 어둡지 않은 공간에서 촬영을 진행해주세요.",style:TextStyle(fontSize:18))),
                                      ],
                                    ),Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: SizedBox(
                                              width:24,height:24,
                                              child: Icon(Icons.check)),
                                        ),
                                        SizedBox(
                                            width:Get.width*.7,
                                            child: Text("마스크, 선글라스와 같이 얼굴을 가리는 방해물은 제거 후 촬영해주세요.",style:TextStyle(fontSize:18))),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                          ),
                          _startButton()
                        ],
                      )

                    ],),
                  ),
                  Column(
                    children: [
                      SizedBox(height: Get.height * 0.05),
                      Align(
                          alignment: Alignment.center,
                          child: StepProgressView(
                              curStep: 2,
                              width: Get.width * 0.7,
                              color: Color(0xff373EFF),
                              titles: controller.stepper)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _startButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: Get.width*.3,
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffF7F7F7),
            child: MaterialButton(
              splashColor: Colors.white,
              minWidth: Get.width,
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              onPressed: () async {

              },
              child: Text(
                "취소",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff868686), fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(
          width:Get.width*.5,
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff373EFF),
            child: MaterialButton(
              splashColor: Colors.white,
              minWidth: Get.width,
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              onPressed: () {
                Get.toNamed("/record");
              },
              child: Text(
                "고정 완료",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


