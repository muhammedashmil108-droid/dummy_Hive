

import 'package:hive_flutter/hive_flutter.dart';
part 'students_model.g.dart';

@HiveType(typeId: 0)
class Model extends HiveObject{
  @HiveField(0)
 String? name;
 @HiveField(1)
 int? age;

 Model({required this.name,required this.age});
}