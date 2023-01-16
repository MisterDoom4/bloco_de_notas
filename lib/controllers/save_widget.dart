import 'package:flutter/material.dart';

import '../models/note.dart';
import '../models/notes_database.dart';

Future<void> saveNote(String noteTitle, String noteContent, dynamic args,
    BuildContext context) async {
  if (noteTitle.isNotEmpty && noteContent.isNotEmpty) {
    if (args[0] == 'new') {
      Note note = Note(
        title: noteTitle,
        content: noteContent,
      );
      try {
        await _insertNote(note);
      } finally {
        Navigator.pop(context);
      }
    } else if (args[0] == 'edit') {
      Note note =
          Note(id: args[1]['id'], title: noteTitle, content: noteContent);
      try {
        await _updateNote(note);
      } finally {
        Navigator.pop(context);
      }
    }
  }
}

Future<void> _insertNote(Note note) async {
  NotesDatabase notesDb = NotesDatabase();
  await notesDb.initDatabase();
  await notesDb.insertNote(note);
  await notesDb.closeDatabase();
}

Future<void> _updateNote(Note note) async {
  NotesDatabase notesDb = NotesDatabase();
  await notesDb.initDatabase();
  await notesDb.updateNote(note);
  await notesDb.closeDatabase();
}
