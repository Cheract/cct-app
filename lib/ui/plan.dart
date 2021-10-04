import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';
import 'package:untitled_cct/controller/controller.dart';
import 'package:untitled_cct/repository/repository.dart';
import 'package:untitled_cct/ui/utils.dart';

class Plan extends GetView<PlanController> {
  const Plan({Key? key}) : super(key: key);

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
                          Text("복약일정을 선택해주세요."),
                          Text("선택 완료 버튼을 통해 복약 녹화 화면으로 이동합니다."),
                        ],
                      ),

                      SizedBox(height: Get.height * 0.05),
                        Column(
                          children: [
                            Container(width: Get.width*.7, height: Get.height*.5,color: Colors.transparent,
                            child:Scrollbar(
                              child: _dateList(),
                            )
                            ),
                            Obx(()=>_startButton())
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
                              curStep: 1,
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
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10),
        color: controller.dateSelection[controller.nowCheckedIndex.value]["isDone"]==false?Color(0xff373EFF):Colors.grey,
        child: MaterialButton(
          splashColor: Colors.white,
          minWidth: Get.width,
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          onPressed: () async {
            if(controller.dateSelection[controller.nowCheckedIndex.value]["isDone"]==false){
              controller.currentStep=2;
              Get.toNamed("/research");
            }else{

            }


          },
          child: Text(
            "선택 완료",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
  Widget _dateList(){
    return ListView.builder(
      itemBuilder: (context, index) {
        var locCon = controller.dateSelection[index];
        return GestureDetector(
          onTap: (){
            print(controller.nowCheckedIndex.value);
            controller.nowCheckedIndex(index);
          },
          child: locCon["isDone"] == true?Container(
            height: 72,

            child: Card(
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side:BorderSide(
                  color: Color(0xff373EFF),
                  width: 2.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: Get.width*.4,
                      child: Text("${locCon["date"]} 완료!",style:TextStyle(fontSize:18,color:Color(0xff373EFF)))),
                  SizedBox(
                      width: Get.width*.2,
                      child: SizedBox(width:24,height:24,child: Image.asset("images/completecheck.png")))
                ],
              ),
            ),
          ):Container(
            height: 72,

            child: Obx(()=>Card(
              color: index==controller.nowCheckedIndex.value?Color(0xffEBECFF):null,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side:BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: Get.width*.4,
                      child: Text("${locCon["date"]}",style:TextStyle(fontSize:18,color:Colors.black))),
                  SizedBox(
                      width: Get.width*.2,
                      child: SizedBox(width:24,height:24))
                ],
              ),
            ),)
          ),
        );
      },
      itemCount: controller.dateSelection.length,
    );
  }
}


