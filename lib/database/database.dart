import 'package:hive_flutter/hive_flutter.dart';

class DatabaseClass {
  //reference
  final _mybox = Hive.box('mybox');
  List toDoList = [];

  //initiailize
  void initDatabase() {
    toDoList = [
      ['sekolah', false],
      ['mengaji', false]
    ];
  }

  //load database
  void loadDatabase() {
    toDoList = _mybox.get('OPEN');
  }

  //open
  void openDatabase() {
    _mybox.put('OPEN', toDoList);
  }
}
