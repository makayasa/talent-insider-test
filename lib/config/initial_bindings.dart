import 'package:get/get.dart';
import 'package:skeleton/app/controllers/network_controller.dart';

class InitialBindings implements Bindings {
@override
void dependencies() {
  Get.put(NetworkController());
  }
}