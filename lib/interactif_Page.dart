import 'package:flutter/material.dart';

class InteractifPage extends StatefulWidget {
  const InteractifPage({super.key});

  @override
  State<InteractifPage> createState() => _InteractifPageState();
}

class _InteractifPageState extends State<InteractifPage> {
  Color background = Colors.white;
  Color textofColor = Colors.red;
  bool textButon = true;

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
      backgroundColor: background,
      appBar: AppBar(
        title: Text(miseAjourTextBar()),
      ),
      body: Center(
          child: Column(
        children: [
          TextButton(
            onPressed: miseAjourAppBar,
            child: Row(
              children: [
                Icon(Icons.work),
                textButtonText(),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                print('salut');
              },
              child: const Text("data")),
          Text(
            "apprendre les interactifs ",
            style: TextStyle(color: textofColor),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          miseAjourCouleur();
          //code du void callback
        },
        child: Icon(Icons.build),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  miseAjourAppBar() {
    setState(
      () => textButon = !textButon,
    );
  }

  miseAjourCouleur() {
    setState(() {
      background = (background == Colors.white) ? Colors.amber : Colors.white;
      textofColor = (textofColor == Colors.red) ? Colors.black : Colors.red;
    });
  }

  String miseAjourTextBar() {
    return (textButon) ? "je m'y connais un peu" : "les interactifs";
  }

  Text textButtonText() {
    return const Text(
      "Je suis un text buton",
      style: TextStyle(color: Colors.pink, backgroundColor: Colors.grey),
    );
  }
}
