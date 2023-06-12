import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/getx_controller/note_controller.dart';
import 'package:noteapp/ui/widget/app_snakbar.dart';
import 'package:noteapp/ui/widget/appbar_method.dart';
import 'package:noteapp/ui/widget/app_color.dart';
import 'package:noteapp/ui/widget/note_board.dart';

class EditNote extends StatelessWidget {
  EditNote({super.key, required this.note, required this.index});
  String note;
  int index;
  @override
  Widget build(BuildContext context) {
    final noteController = Get.put(NoteController());
    note = index == null ? '' : noteController.noteList[index].note;

    final _size = MediaQuery.of(context).size;
    final TextEditingController editNoteController =
        TextEditingController(text: note);
    return Scaffold(
      backgroundColor: screenBackgroundColor(),
      appBar: appBarMethod('EDIT NOTE'),
      body: Column(
        children: [
          SizedBox(
            height: _size.height / 50,
          ),
          Padding(
            padding: EdgeInsets.all(_size.width / 50),
            child: Container(
              padding: EdgeInsets.all(_size.width / 50),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromARGB(255, 235, 158, 158),
                  )),
              child: TextFormField(
                // onSaved: (newValue) {
                //   note = newValue.toString();
                // },
                controller: editNoteController,
                maxLines: 10,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'edit Note'),
              ),
            ),
          ),
          SizedBox(
            height: _size.height / 30,
          ),
          AppButon(
            size: _size,
            title: 'Update',
            tap: () {
              var updateNote = noteController.noteList[index];
              updateNote.note = editNoteController.text;
              noteController.noteList[index] = updateNote;
              snkbr('Save Note', context);
              Get.back();
            },
          )
        ],
      ),
    );
  }
}

class AppButon extends StatelessWidget {
  const AppButon({
    super.key,
    required Size size,
    required this.tap,
    required this.title,
  }) : _size = size;

  final Size _size;
  final VoidCallback tap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        height: _size.height / 20,
        width: _size.width / 4,
        decoration: BoxDecoration(
            color: buttonColorMethod().withGreen(100),
            borderRadius: BorderRadius.circular(_size.width / 10)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: _size.height / 60,
              fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
