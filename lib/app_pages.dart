import 'package:get/get.dart';
import 'package:untitled_cct/ui/cam.dart';
import 'package:untitled_cct/ui/fixcam.dart';
import 'package:untitled_cct/ui/login.dart';
import 'package:untitled_cct/ui/plan.dart';
import 'package:untitled_cct/ui/recording.dart';
import 'package:untitled_cct/ui/research.dart';

import 'binding/binding.dart';


abstract class Routes{

  static const INITIAL = '/';
  static const PLAN = '/plan';
  static const RESEARCH = '/research';
  static const FIXCAM = '/fixcam';
  static const RECORD = '/record';
  static const CAM = '/cam';
}
class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => LoginStep(),bindings: [MainBinding()]),
    GetPage(name: Routes.PLAN, page: () => Plan(),bindings: [PlanBinding()]),
    GetPage(name: Routes.RESEARCH, page: () => Research(),bindings: [ResearchBinding()]),
    GetPage(name: Routes.FIXCAM, page: () => FixCam(),bindings: [CamBinding()]),
    GetPage(name: Routes.RECORD, page: () => Record(),bindings: [CamBinding()]),
    GetPage(name: Routes.CAM, page: () => Cam(),bindings: [CamBinding()]),
  ];
}