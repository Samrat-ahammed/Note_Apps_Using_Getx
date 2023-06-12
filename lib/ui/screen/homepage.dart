import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/getx_controller/note_controller.dart';
import 'package:noteapp/ui/screen/add_note_screen.dart';
import 'package:noteapp/ui/screen/edit_note_screen.dart';
import 'package:noteapp/ui/widget/app_snakbar.dart';
import 'package:noteapp/ui/widget/appbar_method.dart';
import 'package:noteapp/ui/widget/app_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    getNotBoardColor() {
      Random random = Random();
      return noteBordColor[random.nextInt(noteBordColor.length)];
    }

    final noteController = Get.put(NoteController());

    DateTime now = DateTime.now();
    String formattedDate = DateFormat().format(now);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: screenBackgroundColor(),
      appBar: appBarMethod('NOTE'),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(AddNote());
        },
        label: Text(
          'Add Note',
          style: TextStyle(
              fontSize: size.height / 70, fontWeight: FontWeight.w800),
        ),
        backgroundColor: buttonColorMethod().withGreen(100),
      ),
      body: GetBuilder<NoteController>(builder: (context) {
        return GridView.builder(
          padding: EdgeInsets.all(size.width / 60),
          itemCount: noteController.noteList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: size.width / 50,
              crossAxisSpacing: size.width / 97),
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Card(
                  color: getNotBoardColor(),
                  child: Container(
                    height: size.height / 3,
                    width: size.width,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width / 70),
                      // color: const Color.fromARGB(255, 222, 205, 205),
                    ),
                    child: Text(
                      maxLines: 6,
                      noteController.noteList[index].note,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: size.height / 60),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Row(
                      children: [
                        iconButtonMethod(Icons.edit, Colors.black, () {
                          Get.to(
                            EditNote(
                              note: noteController.noteList[index].note,
                              index: index,
                            ),
                          );
                        }),
                        iconButtonMethod(Icons.delete, Colors.red, () {
                          if (noteController.noteList[index].note != null) {
                            noteController
                                .deleteNote(noteController.noteList[index]);
                            snkbr('Delete this note', context);
                          }
                        }),
                      ],
                    )),
              ],
            );
          },
        );
      }),
    );
  }

  IconButton iconButtonMethod(IconData icon, Color color, ontap) {
    return IconButton(
      onPressed: ontap,
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }
}
