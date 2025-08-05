import 'package:crud/functions/functions.dart';
import 'package:crud/model/model.dart';
import 'package:flutter/material.dart';


class EditPage extends StatefulWidget {
  String? name;
  String? address;
  String? age;
  String? classname;
  int index;

  EditPage({
  required this.name,
  required this.address,
  required this.age,
  required this.classname,
  required this.index});

  

  @override
  State<EditPage> createState() => _EditPageState();
}

TextEditingController nameController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController ageController = TextEditingController();
TextEditingController classnameController = TextEditingController();

class _EditPageState extends State<EditPage> {
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    addressController = TextEditingController(text: widget.address);
    ageController = TextEditingController(text: widget.age);
    classnameController = TextEditingController(text: widget.classname);
  }


    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students Update',
        style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          SizedBox(height: 40),
          TextField(
            controller: addressController,
            decoration: InputDecoration(
              labelText: 'Address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          SizedBox(height: 40),
          TextField(
            controller: ageController,
            decoration: InputDecoration(
              labelText: 'Age',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          SizedBox(height: 40),
          TextField(
            controller: classnameController,
            decoration: InputDecoration(
              labelText: 'Class',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          SizedBox(height: 40),

          ElevatedButton(
            onPressed: () {
              editBtn(context);
            },
            style:ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
            ) ,
            
            child: Text('Edit',
            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void editBtn(BuildContext content) {
    final name = nameController.text.trim();
    final address = addressController.text.trim();
    final age = ageController.text.trim();
    final classname = classnameController.text.trim();

    if (name.isEmpty || address.isEmpty||age.isEmpty||classname.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              'Enter Fields',
              style: TextStyle(
                color:Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              ),
          ),
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            )
            
            );
    } else {
      final editData = PersonData(name: name, address: address,age: age,classname: classname,addedOn: DateTime.now(),);
      updateData(widget.index, editData);
      Navigator.pop(context);
    }
  }
}
