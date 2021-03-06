import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:untitled_cct/repository/repository.dart';
var dateSelec = [{
  "date":"10/1(월) 아침",
  "isDone":true
},{
  "date":"10/1(월) 점심",
  "isDone":true
},{
  "date":"10/1(월) 저녁",
  "isDone":false
},{
  "date":"10/2(화) 아침",
  "isDone":false
},{
  "date":"10/2(화) 점심",
  "isDone":false
}];
class PlanController extends GetxController{
  //for main pages
  var stepper = ["일정 선택","핸드폰 고정","복약 녹화"];
  var currentStep = 0;
  var nowCheckedIndex = 0.obs;
  var dateSelection = dateSelec;
  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
class ResearchController extends GetxController{
  //
  final meal =true.obs;
  var researchIndex = 0.obs;
  var textFormIsSelected = false.obs;
  var userSymtomController = TextEditingController(text: "");
  var researchCheck0 = false.obs;
  var researchCheck1 = false.obs;
  var researchCheck2 = false.obs;
  var researchCheck3 = false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
class CamController extends GetxController{
  //
  final repository;
  var stepper = ["일정 선택","핸드폰 고정","복약 녹화"];
  final meal =true.obs;
  var researchIndex = 0.obs;
  var userSymtomController = TextEditingController(text: "");
  var researchCheck0 = false.obs;
  var researchCheck1 = false.obs;
  var researchCheck2 = false.obs;
  var researchCheck3 = false.obs;
  CamController({required this.repository}) : assert(repository != null);
  //Cam
  CameraController? cameraController;
  XFile? videofile;
  File? fileForSend;
  var camInitialized = false.obs;
  var onSubmitting = false.obs;
  var isRecognized = false.obs;
  var userFaceInformation = "".obs;

  var start = 60.obs;
  Timer? timer;

  var diagTime = 3.obs;
  var diagSuccessTime = 3.obs;

  sendTheVideo() async {
    var resForUploading = await repository.sendVideo(fileForSend);
    return resForUploading;
  }
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer=Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start(start.value-1);
        }
      },
    );
  }

  void DiagTimer(context,{dialog}) {
    const oneSec = const Duration(seconds: 1);
    timer=Timer.periodic(
      oneSec,
          (Timer timer) async {
        if (diagTime.value == 0) {
          await sendTheVideo();
          showPopupDiag(context,dialog:dialog);
          timer.cancel();
        } else {
          diagTime(diagTime.value-1);
        }
      },
    );
  }

  void DiagSuccessTimer(context,{dialog}) {
    const oneSec = const Duration(seconds: 1);
    timer=Timer.periodic(
      oneSec,
          (Timer timer) async {
        if (diagSuccessTime.value == 0) {
          await sendTheVideo();
          showPopupDiag(context,dialog:dialog);
          showPopupDiag(context,dialog:dialog);
          timer.cancel();
        } else {
          diagSuccessTime(diagSuccessTime.value-1);
        }
      },
    );
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    if (cameras.length >= 0) {
      cameraController = CameraController(cameras.last, ResolutionPreset.max);

      cameraController!.initialize().then((_) {
        if (!cameraController!.value.isInitialized) {
          return;
        }
        camInitialized(true);
      });
    }
  }
  void showPopupDiag(context,{dialog}){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }
  Future<void> stopCameraRecording()async{
    videofile= await cameraController!.stopVideoRecording();
    print(videofile!.path);
    //await GallerySaver.saveVideo(videofile.path);
    fileForSend = File(videofile!.path);

    print("용량 : ${await fileForSend!.length()}");
  }
  @override
  Future<void> onInit() async {
    super.onInit();
    await _initCamera();
  }
}
class MainController extends GetxController {
  final MainRepository repository;

  MainController({required this.repository}) : assert(repository != null);

  var pageIndex = 0.obs;
  //for signin&up
  var accountTextController = TextEditingController(text: "");
  var passwordTextController = TextEditingController(text: "");
  var passwordVisible = false.obs;
  final formKey_cct_login = GlobalKey<FormState>();
  var loginProcess = false;
  var error = "";
  var textFormIsSelected = false.obs;


  @override
  Future<void> onInit() async {
    super.onInit();
    interval(textFormIsSelected, (callback) => print(textFormIsSelected.value),
        time: Duration(seconds: 1));
  }

}
