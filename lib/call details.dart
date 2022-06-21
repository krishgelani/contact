import 'dart:io';

import 'package:contact/details.dart';
import 'package:flutter/material.dart';

class calldetails extends StatefulWidget {
  const calldetails({Key? key}) : super(key: key);

  @override
  State<calldetails> createState() => _calldetailsState();
}

class _calldetailsState extends State<calldetails> {


  @override
  Widget build(BuildContext context) {
    Model m2 = ModalRoute.of(context)!.settings.arguments as Model;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        ),




        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                width: double.infinity,
                child: CircleAvatar(
                  backgroundImage: FileImage(File(m2.photo.toString())),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "${m2.name}",
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                  top:
                      BorderSide(color: Colors.deepOrange.shade300, width: 0.5),
                  bottom:
                      BorderSide(color: Colors.deepOrange.shade300, width: 0.5),
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: Icon(
                          Icons.call,
                          size: 30,
                          color: Colors.deepOrange,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.textsms_outlined,
                          size: 30,
                          color: Colors.deepOrange,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.video_call,
                          size: 30,
                          color: Colors.deepOrange,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
