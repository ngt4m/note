import 'package:flutter/material.dart';
import 'package:note_app/data/database.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/page/edit_note_page.dart';
import 'package:note_app/theme/colors.dart';
import 'package:note_app/widget/dialog_widget.dart';
import 'package:note_app/widget/note_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBackgroundColor,
        title: Text(
          'Note',
          style: TextStyle(fontSize: 25),
        ),
        // actions: [
        //   Padding(padding: EdgeInsets.only(right: 20),
        //   child: Row(
        //     children: [
        //       ButtonWidget(icon: Icons.search, onTap: ,),
        //       SizedBox(width: 10,),
        //     ],
        //   ),
        //   ),
        // ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          size: 16,
          color: Colors.white,
        ),
      ),
      body: StreamBuilder<List<NoteModel>>(
        stream: Database.getNotes(),
        builder: (context, snapshot) {
          final notes = snapshot.data;
          return ListView.builder(
            itemCount: notes!.length,
            itemBuilder: (context, index) {
              return NoteWidget(
                title: notes[index].title,
                body: notes[index].body,
                color: notes[index].color,
                ontap: () {
                  MaterialPageRoute(
                      builder: (_) => EditNotePage(
                            noteModel: notes[index],
                          ),
                          );
                },
                onlongpress: showDialogBoxWidget(
                  context,
                  title: 'Are sure delete this note?',
                  height: 25,
                  onTapYes:  () {
                          Database.deleteNote(notes[index].id!);
                          Navigator.pop(context);
                        },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
