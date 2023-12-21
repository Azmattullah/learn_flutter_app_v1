import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:learn_flutter_app/src/services/local_db.dart';

import '../model/note.dart';

class CreateNoteView extends StatefulWidget {
  const CreateNoteView({super.key});

  @override
  State<CreateNoteView> createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final localDb = LocalDbService();

  @override
  void dispose() {
    super.dispose();

    log(_titleController.text);
    log(_descriptionController.text);

    final title = _titleController.text;
    final desc = _descriptionController.text;

    final newNote = Note(
        id: Isar.autoIncrement,
        title: title,
        description: desc,
        lastMod: DateTime.now());

    localDb.saveNote(note: newNote);

    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title",
                ),
                style: GoogleFonts.poppins(
                  fontSize: 26,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Description",
                ),
                style: GoogleFonts.poppins(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
