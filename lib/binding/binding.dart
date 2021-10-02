import 'package:get/get.dart';
import 'package:untitled_cct/controller/controller.dart';
import 'package:untitled_cct/repository/repository.dart';


class Binding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<MainController>(() {
      return MainController(
        repository: MainRepository()
      );
    });
  }
}

