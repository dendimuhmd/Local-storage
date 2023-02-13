import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:local_storage/app/data/model.dart';

import '../../note_add_update/views/note_add_update_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=>Scaffold(
          appBar: AppBar(
            title: Text('Notes'),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NoteAddUpdateView()));
              }),
          body:  controller.listNotes.isEmpty
              ? Center(
                  child: Container(
                  child: Text('No Data'),
                ))
              : ListView.builder(
                  itemCount: controller.listNotes.length,
                  itemBuilder: ((context, index) {
                    final notes = controller.listNotes[index];
                    log(controller.listNotes.length.toString());
                    return Dismissible(
                        onDismissed: (direction) {
                          controller.remove(notes.id!);
                        },
                        key: UniqueKey(),
                        child: Card(
                          child: ListTile(
                            title: Text(notes.title),
                            subtitle: Text("Desc : ${notes.description}"),
                            onTap: () async {
                              final navigator = Navigator.of(context);
                              final selectedNote =
                                  await controller.getNoteById(notes.id!);
                              navigator.push(MaterialPageRoute(
                                  builder: (context) => NoteAddUpdateView(
                                        notes: selectedNote,
                                      )));
                            },
                          ),
                        ));
                  }))),
    );
  }
}
