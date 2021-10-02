import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled_cct/repository/repository.dart';

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


  //for main pages
  var stepper = ["일정 선택","핸드폰 고정","복약 녹화"];
  var currentStep = 0;
  var nowCheckedIndex = 0.obs;
  var dateSelection = [{
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

  //
  final meal =true.obs;
  var researchIndex = 0.obs;
  var userSymtomController = TextEditingController(text: "");
  var researchCheck0 = false.obs;
  var researchCheck1 = false.obs;
  var researchCheck2 = false.obs;
  var researchCheck3 = false.obs;
  //Cam
  CameraController? cameraController;
  var camInitialized = false.obs;
  var onSubmitting = false.obs;
  var isRecognized = false.obs;
  var userFaceInformation = "".obs;

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    if (cameras.length >= 0) {
      cameraController = CameraController(cameras.first, ResolutionPreset.max);

      cameraController!.initialize().then((_) {
        if (!cameraController!.value.isInitialized) {
          return;
        }
        camInitialized(true);
      });
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await _initCamera();
    interval(textFormIsSelected, (callback) => print(textFormIsSelected.value),
        time: Duration(seconds: 1));
  }

}
