
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController usernameController =
      TextEditingController();

  final TextEditingController ageController =
      TextEditingController();

  ValueNotifier<List<Map<String, dynamic>>> students =
      ValueNotifier([]);

  void addStudent() {

    String username = usernameController.text.trim();
    int? age = int.tryParse(ageController.text.trim());

    if (username.isEmpty || age == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter valid details')),
      );
      return;
    }

    students.value = [
      ...students.value,
      {
        'username': username,
        'age': age,
      }
    ];

    usernameController.clear();
    ageController.clear();
  }

  @override
  void dispose() {
    usernameController.dispose();
    ageController.dispose();
    students.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'StudentApp',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),

        child: Column(
          children: [

            // Username TextField
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            // Age TextField
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: addStudent,
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 18),
              ),
            ),

            SizedBox(height: 30),

            // ValueListenableBuilder
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: students,

                builder: (context, studentList, child) {

                  return ListView.builder(
                    itemCount: studentList.length,

                    itemBuilder: (context, index) {

                      return Card(
                        elevation: 4,

                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),

                          title: Text(
                            studentList[index]['username'],
                          ),

                          subtitle: Text(
                            'Age: ${studentList[index]['age']}',
                          ),

                          trailing: Icon(Icons.person),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
