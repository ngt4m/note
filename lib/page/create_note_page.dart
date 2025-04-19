import 'package:flutter/material.dart';
import 'package:note_app/data/database.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/theme/note_color.dart';
import 'package:note_app/widget/button_widget.dart';
import 'package:note_app/widget/form_widget.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({Key? key}) : super(key: key);

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  bool _isNoteCreating = false;

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  int selectedColor = 4294967295;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWidget(
                icon: Icons.arrow_back,
                onTap: () {
                  Navigator.pop(context);
                  _createNote();
                },
              ),
              ButtonWidget(
                icon: Icons.done,
                onTap: () {
                  _createNote();
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          FormWidget(
              fontSize: 23,
              maxLine: 10,
              controller: titleController,
              hintText: 'Title'),
          SizedBox(
            height: 20,
          ),
          FormWidget(
              fontSize: 15,
              controller: bodyController,
              hintText: 'Start typing...'),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 80,
            child: ListView.builder(
              itemCount: noteColor.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final singleColor = noteColor[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = singleColor.value;
                    });
                  },
                  child: Container(
                    width: 60,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 60,
                    decoration: BoxDecoration(
                        color: singleColor,
                        border: Border.all(
                            width: 3,
                            color: selectedColor == singleColor.value
                                ? Colors.white
                                : Colors.transparent),
                        shape: BoxShape.circle),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  _createNote() {
    setState(() => _isNoteCreating = true);
    Future.delayed(Duration(milliseconds: 1000)).then((value) {
      if (titleController.text.isEmpty) {
        toast(message: 'Enter Title');
        setState(() => _isNoteCreating = false);
        return;
      }
      if (bodyController.text.isEmpty) {
        toast(message: 'Type something in the body');
        setState(() => _isNoteCreating = false);
        return;
      }
      Database.createNote(NoteModel(
              title: titleController.text,
              body: bodyController.text,
              color: selectedColor))
          .then((value) {
        _isNoteCreating = false;
        Navigator.pop(context);
      });
    });
  }
}
