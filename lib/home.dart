import 'dart:io';

import 'package:contact/details.dart';
import 'package:contact/main.dart';
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
  List name = ["krish"];
  List contact = ["7862952601"];
  List img = ["asset/image/thomas shelby.jpg"];

  Color c1 = Colors.white;
  Color c2 = Colors.black;
  Color c3 = Colors.black;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.black87,
        appBar: AppBar(
          title: Text("Contacts"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            SizedBox(
              width: 13,
            ),
            Switch(
                value: themeData,
                onChanged: (value) {
                  setState(() {
                    themeData = value;
                    if (themeData == true) {
                      c1 = Colors.white;
                      c2 = Colors.black;
                      c3 = Colors.black;
                    } else if (themeData == false) {
                      c1 = Colors.black;
                      c2 = Colors.white;
                      c3 = Colors.deepOrange;
                    }
                  });
                  data.add(themeData);
                }),
            SizedBox(
              width: 15,
            ),
            PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text("Add Contact"),
                      onTap: () {},
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
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Model m1 = Model(
                            name: name[index],
                            number: contact[index],
                            photo: img[index],
                            co1: c1,
                            co2: c2,
                            co3: c3,
                          );

                          Navigator.pushNamed(context, '/cd', arguments: m1);
                        },
                        style:
                            ElevatedButton.styleFrom(primary: c1, elevation: 0),
                        child: Container(
                          height: 80,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                child: CircleAvatar(
                                  backgroundColor: Colors.black87,
                                  backgroundImage: FileImage(
                                    File(img[index].toString()),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${name[index]}",
                                style: TextStyle(color: c2, fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
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
                ),
              ),
            ),
          ],
        ),
      ),
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
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
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
      },
    );
  }

  void snack() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Contact Saved")));
  }
}

class NameIcon extends StatelessWidget {
  final String firstName;
  final Color backgroundColor;
  final Color textColor;

  const NameIcon({
    Key? key,
    required this.firstName,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
  }) : super(key: key);

  String get firstLetter => this.firstName.substring(0, 1).toUpperCase();

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: this.backgroundColor,
          border: Border.all(color: Colors.black, width: 0.5),
        ),
        padding: EdgeInsets.all(8.0),
        child: Text(this.firstLetter, style: TextStyle(color: this.textColor)),
      ),
    );
  }
}
