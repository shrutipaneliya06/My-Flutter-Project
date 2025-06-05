// ignore_for_file: camel_case_types

import 'package:hive/hive.dart';
import 'package:hivelocaldata/models/notes_models.dart';

class boxes {
  static Box<NotesModel> getData() => Hive.box<NotesModel>('notes');
}
