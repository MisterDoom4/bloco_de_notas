// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class AllNotesLists extends StatelessWidget {
  final data;
  final selectedNoteIds;
  final afterNavigatorPop;
  final handleNoteListLongPress;
  final handleNoteListTapAfterSelect;

  const AllNotesLists(this.data, this.selectedNoteIds, this.afterNavigatorPop,
      this.handleNoteListLongPress, this.handleNoteListTapAfterSelect,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        dynamic item = data[index];
        return DisplayNotes(
          item,
          selectedNoteIds,
          (selectedNoteIds.contains(item['id']) == false ? false : true),
          afterNavigatorPop,
          handleNoteListLongPress,
          handleNoteListTapAfterSelect,
        );
      },
    );
  }
}

class DisplayNotes extends StatelessWidget {
  final notesData;
  final selectedNoteIds;
  final selectedNote;
  final callAfterNavigatorPop;
  final handleNoteListLongPress;
  final handleNoteListTapAfterSelect;

  const DisplayNotes(
      this.notesData,
      this.selectedNoteIds,
      this.selectedNote,
      this.callAfterNavigatorPop,
      this.handleNoteListLongPress,
      this.handleNoteListTapAfterSelect,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Material(
        elevation: 1,
        color: (selectedNote == false ? Colors.white : Colors.grey[300]),
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          onTap: () {
            if (selectedNote == false) {
              if (selectedNoteIds.length == 0) {
                Navigator.pushNamed(context, '/notes_edit',
                    arguments: ['edit', notesData]).then((dynamic value) {
                  callAfterNavigatorPop();
                });
              } else {
                handleNoteListLongPress(notesData['id']);
              }
            } else {
              handleNoteListTapAfterSelect(notesData['id']);
            }
          },
          onLongPress: () {
            handleNoteListLongPress(notesData['id']);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notesData['title'],
                  style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  notesData['content'],
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomActionBar extends StatelessWidget {
  final VoidCallback handleDelete;

  BottomActionBar(this.handleDelete, {super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            iconSize: 80,
            icon: const Icon(Icons.delete),
            onPressed: handleDelete,
          ),
        ],
      ),
    );
  }
}
