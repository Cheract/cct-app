import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled_cct/controller/controller.dart';

class Research extends StatelessWidget {
  const Research({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String meal ="yes";
    return SafeArea(
      child: Scaffold(
        body:
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(Get.width*0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("식사 여부",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                    Text("식사를 하셨나요?",style: TextStyle(fontSize: 18,color:Color(0xff606974),))
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(height:Get.height*0.15),
                  RadioListTile(value: "true", groupValue: meal, onChanged: (_){
                    print(_);
                  }),
                  RadioListTile(value: "false", groupValue: meal, onChanged: (_){
                    print(_);
                  })

                ],
              )
            ],
          )
      ),
    );
  }
}

