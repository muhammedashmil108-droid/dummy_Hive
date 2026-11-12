import 'package:dummy/model/students_model.dart';
import 'package:hive/hive.dart';

class Service{
   Box<Model> studentBox= Hive.box<Model>("List");

Future<void> addModel(Model student){
return studentBox.add(student);
}                                 

Future <void>delete(int index){

return studentBox.deleteAt(index);
}


}
