import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_storage/app/data/db/database_helper.dart';
import 'package:local_storage/app/data/model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final RxList<Notes> _listNotes = <Notes>[].obs;
  RxList<Notes> get listNotes => _listNotes;
  Rx<Notes> notes = Notes(id: 0, title: '', description: '').obs;
  late DatabaseHelper _databaseHelper;

  final isLoading = false.obs;
  var titleController = TextEditingController();
  var descController = TextEditingController();

  void getAllNotes() async {
    _listNotes.value = await _databaseHelper.getNotes();
    update();
  }

  void addNote(Notes notes) async {
    await _databaseHelper.insertNote(notes);
    getAllNotes();
  }

  Future<Notes> getNoteById(int id) async {
    return await _databaseHelper.getNoteById(id);
  }

  void updateNote(Notes notes) async {
    await _databaseHelper.updateNote(notes);
     getAllNotes();
  }

  void remove(int notes) async {
    await _databaseHelper.removeFavList(notes);
     getAllNotes();
  }

  @override
  void onInit()  {
    // TODO: implement onInit
    super.onInit();
    _databaseHelper = DatabaseHelper();
     getAllNotes();
  }
}
