import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled_cct/controller/controller.dart';

class Complete extends StatelessWidget {
  const Complete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            width: Get.width * 0.6,
            height: Get.height * 0.6,
            color: Colors.transparent,
            child: Column(
              children: [
                SizedBox(width: 172, child: Image.asset("images/complete.png")),
                SizedBox(
                  height: Get.height * .04,
                ),
                SizedBox(
                    width: 35, child: Image.asset("images/loading_point.png")),
                SizedBox(
                  height: Get.height * .01,
                ),
                Text(
                  "복약 녹화 완료",
                  style: TextStyle(
                      color: Color(0xff373EFF),
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                Text("복약 녹화가 완료되었습니다.",
                    style: TextStyle(color: Color(0xff000000), fontSize: 16)),
                Text("수고 많으셨습니다.",
                    style: TextStyle(color: Color(0xff000000), fontSize: 16)),
                SizedBox(
                  height: Get.height * .1,
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff373EFF),
                  child: MaterialButton(
                    splashColor: Colors.white,
                    minWidth: Get.width*.9,
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    onPressed: () async {
                      Get.offNamed("/plan");
                    },
                    child: Text(
                      "확인",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

}
