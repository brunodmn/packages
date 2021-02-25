import 'package:flutter/material.dart';
import 'package:jet_form_builder/jet_form_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JetFormBuilder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget _build(BuildContext context) {
    ///Cre
    // JetForm jetForm = new JetForm();

    List<List<JetDisplayItem>> listParent = [];

    //Row 1
    listParent.add([
      new JetDisplayItem(
          type: JetFormTypes.text, label: 'Due date', text: '25/02'),
      new JetDisplayItem(
          type: JetFormTypes.text, label: 'Amount', text: '35,00')
    ]);
    //Row 2
    listParent.add([
      new JetDisplayItem(
          type: JetFormTypes.text, label: 'Payment date', text: '30/02'),
      new JetDisplayItem(
          type: JetFormTypes.text, label: 'Payment amount', text: '35,00')
    ]);
    //Row 3
    listParent.add([
      new JetDisplayItem(
          type: JetFormTypes.text, label: 'Obs', text: 'Already paid')
    ]);
    //Row 4
    listParent.add([
      new JetDisplayItem(
          type: JetFormTypes.text, label: 'Bill code', text: '321321321321')
    ]);
    //Row 5
    listParent.add([
      new JetDisplayItem(
          type: JetFormTypes.button,
          label: 'Print invoice',
          onPressed: () => print('321')),
      new JetDisplayItem(
          type: JetFormTypes.button,
          label: 'Copy code',
          onPressed: () => print('123')),
    ]);

    return JetDisplay(listParent);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _build(context),
    );
  }
}
