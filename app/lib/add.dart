import 'dart:convert';

import 'package:app/http.dart';
import 'package:flutter/material.dart';

class AddNews extends StatefulWidget {
  const AddNews({Key? key}) : super(key: key);

  @override
  _AddNewsState createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  TextEditingController numberController = TextEditingController();
  TextEditingController nameConroller = TextEditingController();
  //String response = "200";
  createUser() async {
    var result = await http_post("api/add", {
      "number": numberController.text,
      "name": nameConroller.text,
    });
    if (result.ok) {
      setState(() {
        //response = result.data??['status'];
        print(result.data);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 320,
              child: Opacity(
                opacity: 0.7,
                child: TextField(
                  controller: numberController,
                  style: const TextStyle(
                      color: Color(0xff134373), fontSize: 16, height: 1.1),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color: Color(0xff134373), width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: 'Номер телефона',
                    labelStyle:
                        const TextStyle(fontSize: 14, color: Color(0xff134373)),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: 320,
              child: Opacity(
                opacity: 0.7,
                child: TextField(
                  controller: nameConroller,
                  obscureText: true,
                  style: const TextStyle(
                      color: Color(0xff134373), fontSize: 16, height: 1.1),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color: Color(0xff134373), width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: 'Пароль',
                    labelStyle:
                        const TextStyle(fontSize: 14, color: Color(0xff134373)),
                  ),
                ),
              ),
            ),
            Container(
              width: 320,
              height: 48,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
              margin: const EdgeInsets.only(top: 75),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                  ),
                ),
                onPressed: createUser,
                child: const Text('Завершить'),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
