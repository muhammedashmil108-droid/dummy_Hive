import 'package:dummy/model/students_model.dart';
import 'package:hive/hive.dart';

class Service{
   Box<Model> studentBox= Hive.box<Model>("List");
// Add
Future<void> addModel(Model student){
return studentBox.add(student);
}                                 
// Delete
Future <void>delete(int index){

return studentBox.deleteAt(index);
}
// Edit
Future<void> update(int index,Model student){
  return studentBox.putAt(index, student);
}


}
