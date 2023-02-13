import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:local_storage/app/data/model.dart';
import 'package:local_storage/app/modules/home/controllers/home_controller.dart';

import '../controllers/note_add_update_controller.dart';

class NoteAddUpdateView extends StatefulWidget {
  NoteAddUpdateView({Key? key, this.notes}) : super(key: key);

  final Notes? notes;

  @override
  State<StatefulWidget> createState() => _NoteAddUpdateView();
}

class _NoteAddUpdateView extends State<NoteAddUpdateView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool _isUpdate = false;

  @override
  void initState() {
    super.initState();
    if (widget.notes != null) {
      _titleController.text = widget.notes!.title ;
      _descriptionController.text = widget.notes!.description ;
      _isUpdate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Judul',
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Deskripsi',
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Simpan'),
                onPressed: () async {
                  // TODO : Tambahkan kode untuk menyimpan atau mengedit note
                  if (!_isUpdate) {
                    final note = Notes(
                      // id: Random().nextInt(100),
                      title: _titleController.text,
                      description: _descriptionController.text,
                    );
                    Get.put(HomeController()).addNote(note);
                  } else {
                    final note = Notes(
                      id: widget.notes!.id,
                      title: _titleController.text,
                      description: _descriptionController.text,
                    );
                    Get.put(HomeController()).updateNote(note);
                  }
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }
}
