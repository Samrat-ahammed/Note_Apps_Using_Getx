import 'package:get/get.dart';
import 'package:noteapp/model/note_model.dart';

class NoteController extends GetxController {
  final noteList = <NoteModel>[].obs;

  // List<NoteModel> get noteList => _noteList.value;

  void addNote(NoteModel noteModel) {
    noteList.add(noteModel);
    update();
  }

  void deleteNote(NoteModel noteModel) {
    noteList.remove(noteModel);
    update();
  }

  void updateNote(index) {
    noteList.removeAt(index);
    update();
  }
}
