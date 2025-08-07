import 'package:crud/functions/functions.dart';
import 'package:crud/screens/add.dart';
import 'package:crud/screens/edit.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    super.initState();
    getData(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
        title: Text(
          'Students Lists',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          foregroundColor: Colors.white,
          elevation: 8,
          backgroundColor: Colors.teal,
          hoverColor: Colors.tealAccent,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MyAdd()));
          },
          child: Icon(Icons.add, size: 30),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: personDataNotifier,
        builder: (context, value, child) {
          if (value.isEmpty) {
            return Center(
              child: Text(
                'No Data Found',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              final entry = value[index];         
              final key = entry.key;             
              final myData = entry.value;        

              return Card(
                margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.teal,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/default.png'),
                  ),
                  title: Text(myData.name ?? '', style: TextStyle(color: Colors.white)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(myData.address ?? '', style: TextStyle(color: Colors.white)),
                      Text(myData.age ?? '', style: TextStyle(color: Colors.white)),
                      Text(myData.classname ?? '', style: TextStyle(color: Colors.white)),
                      Text('Added: ${myData.addedOn.toString()}', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Delete Confirmation'),
                            content: Text('Are you sure you want to delete this student?'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('Cancel'),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                                onPressed: () {
                                  deleteData(key); 
                                  Navigator.of(context).pop();
                                },
                                child: Text('Delete', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.delete),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => EditPage(
                          keyId: key,                       
                          name: myData.name ?? '',
                          address: myData.address ?? '',
                          age: myData.age ?? '',
                          classname: myData.classname ?? '',
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
