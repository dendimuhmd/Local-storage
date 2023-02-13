import 'package:get/get.dart';

import '../controllers/note_add_update_controller.dart';

class NoteAddUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteAddUpdateController>(
      () => NoteAddUpdateController(),
    );
  }
}
