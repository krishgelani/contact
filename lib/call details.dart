import 'dart:io';

import 'package:contact/details.dart';
import 'package:contact/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

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
        appBar: AppBar(
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
                style: TextStyle(fontSize: 35,color: m2.co2),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${m2.number}",
                style: TextStyle(fontSize: 25,color: m2.co2),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: m2.co3 as Color,width: 0.5),
                    bottom: BorderSide(width: 0.5,color: m2.co3 as Color),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          String number = "tel: ${m2.number}";
                          print("==========$number");
                          launchUrl(Uri.parse(number));
                          //launch("tel:+917862952601");
                        },
                        icon: Icon(
                          Icons.call,
                          color: m2.co3,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {
                          String number = "sms: ${m2.number}";
                          print("==========$number");
                          launchUrl(Uri.parse(number));
                        },
                        icon: Icon(
                          Icons.textsms_outlined,
                          size: 30,
                          color: m2.co3,
                        )),
                    IconButton(
                        onPressed: () async {
                          String data = "Testing Shar packages";
                          Share.share("${m2.number}");
                        },
                        icon: Icon(
                          Icons.share,
                          size: 30,
                          color: m2.co3,
                        ))
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
