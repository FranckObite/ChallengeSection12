import 'package:flutter/material.dart';

class InteractifPage extends StatefulWidget {
  const InteractifPage({super.key});

  @override
  State<InteractifPage> createState() => _InteractifPageState();
}

class _InteractifPageState extends State<InteractifPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //initialiser la base
    //tous ce que l'on va faire pendant l'initialisation du widget
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //tous ce que l'on va faire quand le widget sera supprimer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('les interactifs'),
      ),
      body: Center(child: Text("apprendre")),
    );
  }
}
