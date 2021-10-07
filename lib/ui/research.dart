import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled_cct/controller/controller.dart';

class Research extends GetView<ResearchController> {
  const Research({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return SafeArea(
          child: Obx((){
            if(controller.researchIndex.value ==0)return _pageOne();
            else if(controller.researchIndex.value ==1) return _pageThree();
            //else if(controller.researchIndex.value ==2) return _pageThree();
            else return Container();
          })
      );

  }

  Widget _pageOne() =>
      Scaffold(

          resizeToAvoidBottomInset : false,
          body:
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(Get.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("식사 여부", style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),),
                    Text("식사를 하셨나요?", style: TextStyle(
                      fontSize: 18, color: Color(0xff606974),)),
                    Divider()
                  ],
                ),
              ),
              Obx(() =>
                  Column(
                    children: [
                      SizedBox(height: Get.height * 0.15),
                      RadioListTile(title: Text("예"),
                          value: true,
                          groupValue: controller.meal.value,
                          onChanged: (_) {
                            controller.meal(true);
                          }),
                      RadioListTile(title: Text("아니오"),
                          value: false,
                          groupValue: controller.meal.value,
                          onChanged: (_) {
                            controller.meal(false);
                          })

                    ],
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(width: Get.width * .5,
                        child: _startButton(onPressed: () async {
                          //Get.toNamed("/research");
                        }, child: Text("이전",textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xff868686),fontWeight: FontWeight.bold)),
                            color: Color(0xfff7f7f7)
                        ),
                      ),
                      SizedBox(width: Get.width * .5,
                          child: _startButton(onPressed: () async {
                            //Get.toNamed("/research");
                            controller.researchIndex(1);
                          }, child: Text("다음",textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                              color: Color(0xff373EFF)
                          ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
      );
  Widget _pageTwo() =>
      Scaffold(
          resizeToAvoidBottomInset : false,
          body:
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(Get.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ㅎㅇ", style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),),
                    Text("description", style: TextStyle(
                      fontSize: 18, color: Color(0xff606974),)),
                    Divider()
                  ],
                ),
              ),

                  Obx(()=>Column(
                    children: [
                      SizedBox(height: Get.height * 0.15),
                      CheckboxListTile(title: Text("option 1"),
                          value: controller.researchCheck0.value,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (_) {
                            print(_);
                            controller.researchCheck0(_);
                          }),
                      CheckboxListTile(title: Text("option 2"),
                          value: controller.researchCheck1.value,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (_) {
                            print(_);
                            controller.researchCheck1(_);
                          }),
                      CheckboxListTile(title: Text("option 3"),
                          value: controller.researchCheck2.value,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (_) {
                            print(_);
                            controller.researchCheck2(_);
                          }),
                      CheckboxListTile(title: Text("option 4"),
                          value: controller.researchCheck3.value,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (_) {
                            print(_);
                            controller.researchCheck3(_);
                          }),

                    ],
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(width: Get.width * .5,
                        child: _startButton(onPressed: () async {
                          controller.researchIndex(0);
                        }, child: Text("이전",textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xff868686),fontWeight: FontWeight.bold)),
                            color: Color(0xfff7f7f7)
                        ),
                      ),
                      SizedBox(width: Get.width * .5,
                        child: _startButton(onPressed: () async {
                          controller.researchIndex(2);
                        }, child: Text("다음",textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                            color: Color(0xff373EFF)
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
      );
  Widget _pageThree() =>
      Scaffold(
          resizeToAvoidBottomInset : false,
          body:
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(Get.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("증상", style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),),
                    Text("증상이 있다면 적어주세요", style: TextStyle(
                      fontSize: 18, color: Color(0xff606974),)),
                    Divider()
                  ],
                ),
              ),

                  Column(
                    children: [
                      SizedBox(height: Get.height * 0.15),
                      _userSymtoms()
                    ],
                  ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(width: Get.width * .5,
                        child: _startButton(onPressed: () async {
                          controller.researchIndex(1);
                        }, child: Text("이전",textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xff868686),fontWeight: FontWeight.bold)),
                            color: Color(0xfff7f7f7)
                        ),
                      ),
                      SizedBox(width: Get.width * .5,
                        child: _startButton(onPressed: () async {
                          Get.offNamed("/fixcam");
                        }, child: Text("다음",textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                            color: Color(0xff373EFF)
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
      );

  Widget _startButton({onPressed, child,color}) {
    return Material(
      elevation: 5.0,
      color: color,
      child: MaterialButton(
        splashColor: Colors.white,
        minWidth: Get.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
  Widget _userSymtoms() {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.05, left: 20.0, right: 20.0),
      child: TextFormField(
          keyboardType: TextInputType.text,
          onChanged: (text) {
            print(text.length);
            if (text.length != 0) {
              controller.textFormIsSelected(true);
            } else {
              controller.textFormIsSelected(false);
            }
            print(controller.textFormIsSelected);
          },
          enabled: true,
          controller: controller.userSymtomController,
          decoration: InputDecoration(
            hintText: "증상을 적어주세요.",
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color(0xffced1d2),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color(0xffced1d2),
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color(0xffced1d2),
                width: 2.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color(0xffced1d2),
                width: 2.0,
              ),
            ),
          ),
          ),
    );
  }

}