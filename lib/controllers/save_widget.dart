import 'package:flutter/material.dart';

import '../models/note.dart';
import '../models/notes_database.dart';

Future<void> saveNote(
    String noteTitle, String noteContent, BuildContext context) async {
  if (noteTitle.isNotEmpty && noteContent.isNotEmpty) {
    Note note = Note(
      title: noteTitle,
      content: noteContent,
    );
    try {
      await _insertNote(note);
    } catch (e) {
      print(e);
    } finally {
      Navigator.pop(context);
    }
  }
}

Future<void> _insertNote(Note note) async {
  NotesDatabase notesDb = NotesDatabase();
  await notesDb.initDatabase();
  int result = await notesDb.insertNote(note);
  await notesDb.closeDatabase();
}
