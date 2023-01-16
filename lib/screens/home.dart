import 'package:flutter/material.dart';
import 'package:bloco_de_notas/controllers/read_widget.dart';
import '../controllers/notehome_widget.dart';
import '../models/notes_database.dart';

// Home screen
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> notes = [];
  List<int> selectedNotesIds = [];

  void afterNavigatorPop() {
    setState(() {});
  }

  void handleNoteListLongPress(int id) {
    setState(() {
      if (selectedNotesIds.contains(id) == false) {
        selectedNotesIds.add(id);
      }
    });
  }

  void handleNoteListTapAfterSelect(int id) {
    setState(() {
      if (selectedNotesIds.contains(id) == true) {
        selectedNotesIds.remove(id);
      }
    });
  }

  void handleDelete() async {
    try {
      NotesDatabase db = NotesDatabase();
      await db.initDatabase();
      for (int id in selectedNotesIds) {
        await db.deleteNote(id);
      }
      await db.closeDatabase();
    } finally {
      setState(() {
        selectedNotesIds = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 215, 146),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text(
          'Bloco de Notas',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body: FutureBuilder(
        future: readDatabase(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            notes = snapshot.data!;
            return Stack(
              children: <Widget>[
                AllNotesLists(
                  snapshot.data,
                  selectedNotesIds,
                  afterNavigatorPop,
                  handleNoteListLongPress,
                  handleNoteListTapAfterSelect,
                ),
                (selectedNotesIds.isNotEmpty
                    ? BottomActionBar(
                        handleDelete,
                      )
                    : Container()),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/notes_edit',
            arguments: [
              'new',
              [{}],
            ],
          ).then((dynamic value) {
            afterNavigatorPop();
          });
          return;
        },
        tooltip: 'Adicionar',
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
