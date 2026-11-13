


import 'package:dummy/model/students_model.dart';
import 'package:dummy/service/student_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
 final Box <Model>studentBox =Hive.box<Model>("List");
 final studentService= Service();

  final  usernameController =
      TextEditingController();

  final  ageController =
      TextEditingController();


  void save() async{
     if(usernameController.text.isEmpty ||
                ageController.text.isEmpty
                  ){
                return;
          }

                  
         Model student=Model(name: usernameController.text, age: int.tryParse(ageController.text) ?? 0);
          
      
         await studentService.addModel(student);
           usernameController.clear();
          ageController.clear();
        
  }
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'StudentApp',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
  ),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          children: [

            // Username TextField
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter username',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            SizedBox(height: 15),

            // Age TextField
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age',
                hintText: 'Enter age',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ),

            SizedBox(height: 20),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: ()async {
         
        save();
                },
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            SizedBox(height: 35),


      Expanded(child: ValueListenableBuilder(valueListenable: studentBox.listenable(),
       builder: (context,box,child){
        final student =box.values.toList();

        return ListView.builder(
          itemCount: student.length,
          itemBuilder: (context,Index){
            final students= student[Index];
            return Card(
              elevation: 3,

              child: ListTile(
                title: Text(students.name ?? "null"),
                subtitle: Text(students.age.toString()),
                trailing: IconButton(onPressed: ()async{
                  await studentService.delete(Index);
                }, icon: Icon(Icons.delete,color: Colors.red,),
                )
              ),
            );

          }
          );
       }
       ),
       ),

        
          ],
        ),
      ),
    );
  }
}