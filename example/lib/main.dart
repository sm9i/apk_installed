import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:apk_installed/apk_installed.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController inputController = TextEditingController(text: 'com.sm9i.apk_installed_example');

  bool isInstall;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: inputController,
              decoration: const InputDecoration(hintText: '请输入检测的包名'),
              onSubmitted: check,
            ),
            RaisedButton(onPressed: () => check(inputController.text), child: Text('检测是否存在')),
            if (isInstall != null)
              Text(
                isInstall ? '安装' : '没安装',
                style: Theme.of(context).textTheme.caption,
              )
          ],
        ),
      ),
    );
  }

  void check(String value) async {
    isInstall = await ApkInstalled.isInstall(package: inputController.text);
    setState(() {});
  }
}
