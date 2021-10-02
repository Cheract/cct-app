import 'package:get/get.dart';
import 'package:untitled_cct/ui/login.dart';
import 'package:untitled_cct/ui/plan.dart';
import 'package:untitled_cct/ui/research.dart';

import 'binding/binding.dart';


abstract class Routes{

  static const INITIAL = '/';
  static const PLAN = '/plan';
  static const RESEARCH = '/research';
  static const FIXCAM = '/fixcam';
  static const RECORD = '/record';
}
class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => LoginStep(),bindings: [Binding()]),
    GetPage(name: Routes.PLAN, page: () => Plan(),bindings: [Binding()]),
    GetPage(name: Routes.RESEARCH, page: () => Research(),bindings: [Binding()]),
    //GetPage(name: Routes.FIXCAM, page: () => FixCam(),bindings: [Binding()]),
    //GetPage(name: Routes.RECORD, page: () => Record(),bindings: [Binding()]),
  ];
}