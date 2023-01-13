import 'package:flutter/material.dart';

import '../controllers/save_widget.dart';

class NotesEdit extends StatefulWidget {
  final args;
  const NotesEdit(this.args, {super.key});

  @override
  State<NotesEdit> createState() => _NotesEditState();
}

class _NotesEditState extends State<NotesEdit> {
  String noteTitle = '';
  String noteContent = '';

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void handleTitleChange() {
    setState(() {
      noteTitle = titleController.text.trim();
    });
  }

  void handleContentChange() {
    setState(() {
      noteContent = contentController.text.trim();
    });
  }

  @override
  void initState() {
    super.initState();
    titleController.addListener(handleTitleChange);
    contentController.addListener(handleContentChange);
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 215, 146),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255)),
          tooltip: 'Voltar',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: NoteTitleEntry(titleController),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.save,
                  color: Color.fromARGB(255, 255, 255, 255)),
              tooltip: 'Salvar',
              onPressed: () {
                saveNote(noteTitle, noteContent, context);
              }),
        ],
      ),
      body: NoteEntry(contentController),
    );
  }
}

class NoteTitleEntry extends StatelessWidget {
  final _textFieldController;

  const NoteTitleEntry(this._textFieldController, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textFieldController,
      decoration: const InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.all(0),
        counter: null,
        counterText: "",
        hintText: 'Título',
        hintStyle: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            height: 1.5,
            color: Colors.white),
      ),
      maxLength: 31,
      maxLines: 1,
      style: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          height: 1.5,
          color: Colors.white),
      textCapitalization: TextCapitalization.words,
    );
  }
}

class NoteEntry extends StatelessWidget {
  final _textFieldController;

  const NoteEntry(this._textFieldController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: TextField(
        controller: _textFieldController,
        maxLines: null,
        textCapitalization: TextCapitalization.sentences,
        decoration: null,
        style: const TextStyle(
          fontSize: 19,
          height: 1.5,
          color: Colors.black,
        ),
      ),
    );
  }
}
