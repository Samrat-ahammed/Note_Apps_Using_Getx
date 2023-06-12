import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/getx_controller/note_controller.dart';
import 'package:noteapp/model/note_model.dart';
import 'package:noteapp/ui/screen/edit_note_screen.dart';
import 'package:noteapp/ui/widget/app_color.dart';
import 'package:noteapp/ui/widget/app_snakbar.dart';
import 'package:noteapp/ui/widget/appbar_method.dart';
import 'package:noteapp/ui/widget/note_board.dart';

class AddNote extends StatelessWidget {
  String? note;

  final noteController = Get.put(NoteController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController addNoteController = TextEditingController();

    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: screenBackgroundColor(),
      appBar: appBarMethod('ADD NOTE'),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(_size.width / 50),
              child: Container(
                padding: EdgeInsets.all(_size.width / 50),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color.fromARGB(255, 235, 158, 158),
                    )),
                child: TextFormField(
                  controller: addNoteController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your note';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    note = newValue;
                  },
                  maxLines: 10,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'add Note'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: _size.height / 30,
          ),
          AppButon(
              size: _size,
              tap: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  noteController.addNote(
                    NoteModel(
                      note.toString(),
                    ),
                  );
                  // addNoteController.clear();
                  snkbr('Save Note', context);
                }
              },
              title: 'Save')
        ],
      ),
    );
  }

  SizedBox speceMethod(Size _size) {
    return SizedBox(
      height: _size.height / 20,
    );
  }
}
