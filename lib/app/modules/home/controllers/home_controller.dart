import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_storage/app/data/db/database_helper.dart';
import 'package:local_storage/app/data/model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final RxList<Notes> _listNotes = <Notes>[].obs;
  RxList<Notes> get listNotes => _listNotes;
  // Rx<Notes> notes = Notes(id: 0, title: '', description: '').obs;
  DatabaseHelper _databaseHelper = DatabaseHelper();

  final isLoading = false.obs;
  var titleController = TextEditingController();
  var descController = TextEditingController();

  Future<void> getAllNotes() async {
    _listNotes.value = await _databaseHelper.getNotes();
    update();
  }

  Future<void> addNote(Notes notes) async {
    await _databaseHelper.insertNote(notes);
    update();
  }

  Future<Notes> getNoteById(int id) async {
    return await _databaseHelper.getNoteById(id);
  }

  void updateNote(Notes notes) async {
    await _databaseHelper.updateNote(notes);
    await getAllNotes();
  }

  void remove(int notes) async {
    await _databaseHelper.removeFavList(notes);
    await getAllNotes();
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    await getAllNotes();
    _databaseHelper = DatabaseHelper();
    super.onInit();
  }
}
