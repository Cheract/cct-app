import 'package:get/get.dart';
import 'package:untitled_cct/controller/controller.dart';
import 'package:untitled_cct/repository/repository.dart';


class MainBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() {
      return MainController(
        repository: MainRepository(),
      );
    },fenix:true

    );
  }
}

class PlanBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() {
      return PlanController();
    },fenix:true

    );
  }
}
class CamBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() {
      return CamController();
    },fenix:true

    );
  }
}

class ResearchBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() {
      return ResearchController();
    },fenix:true

    );
  }
}
