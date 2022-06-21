import 'dart:io';

import 'package:contact/details.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtnumber = TextEditingController();
  File f1 = (File(""));

  String cname = "";
  String cnumber = "";
  List name = [""];
  List contact = [""];
  List img = [""];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title: Text("Contacts"),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              SizedBox(
                width: 5,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.sort)),
              SizedBox(
                width: 5,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.filter_list)),
              SizedBox(
                width: 5,
              ),
              PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: Text("Add Contact"),
                        onTap: () {
                          //dialog();
                        },
                      ),
                      PopupMenuItem(
                        child: Text("Delete All Contact"),
                        onTap: () {
                          setState(() {
                            name.clear();
                            contact.clear();
                            img.clear();
                          });
                        },
                      )
                    ];
                  },
                  child: Icon(Icons.more_vert)),
            ],
          ),
          body: Stack(
            children: [
              ListView.builder(
                itemCount: name.length,
                itemBuilder: (context, index) {
                  return Stack(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        color: Colors.black87,
                        child: ElevatedButton(
                          onPressed: () {
                            Model m1 = Model(
                                name: txtname.text,
                                number: txtnumber.text,
                                photo: f1.path);

                            Navigator.pushNamed(context, '/cd', arguments: m1);
                          },
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black87),
                          child: Container(
                            height: 80,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  child: CircleAvatar(
                                      backgroundImage: FileImage(
                                          File(img[index].toString()))),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${name[index]}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () {
                        dialog();
                        txtname.clear();
                        txtnumber.clear();
                        f1 = File("");
                      },
                      child: Icon(Icons.add),
                    )),
              ),
            ],
          )),
    );
  }

  void dialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    ImagePicker ipick = ImagePicker();
                    XFile? f2 =
                        await ipick.pickImage(source: ImageSource.gallery);

                    setState(() {
                      f1 = File(f2!.path);
                    });
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    child: CircleAvatar(
                      backgroundImage: FileImage(f1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: txtname,
                  decoration: InputDecoration(
                      label: Text("Name"),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: txtnumber,
                  decoration: InputDecoration(
                      label: Text("Mobile Number"),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                )
              ],
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cname = txtname.text;
                      cnumber = txtnumber.text;
                      name.add(cname);
                      contact.add(cnumber);
                      img.add(f1.path);
                    });
                    Navigator.pop(context);
                    snack();
                  },
                  child: Text("Save")),
            ],
          );
        });
  }

  void snack()
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Contact Saved")));
  }
}
