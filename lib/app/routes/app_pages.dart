import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/note_add_update/bindings/note_add_update_binding.dart';
import '../modules/note_add_update/views/note_add_update_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NOTE_ADD_UPDATE,
      page: () =>  NoteAddUpdateView(),
      binding: NoteAddUpdateBinding(),
    ),
  ];
}
