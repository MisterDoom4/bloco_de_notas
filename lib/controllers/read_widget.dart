import '../models/notes_database.dart';

Future<List<Map<String, dynamic>>> readDatabase() async {
  try {
    NotesDatabase notesDb = NotesDatabase();
    await notesDb.initDatabase();
    List<Map> result = await notesDb.getAllNotes();
    await notesDb.closeDatabase();
    List<Map<String, dynamic>> notes = List<Map<String, dynamic>>.from(result);
    notes.sort(((a, b) => a['title'].compareTo(b['title'])));
    return notes;
  } catch (e) {
    return [];
  }
}
