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
  IconData monIconnn = Icons.favorite;
  String prenom = '';
  late TextEditingController controller;
  bool SwitchValue = true;
  double sliderValue = 50;
  bool check = false;
  Map<String, bool> courses = {
    'carote': false,
    'oignon': true,
    'abricot': false,
  };

  int groupeValue = 1;
  DateTime initialDate =
      DateTime.now(); /* datetime est une classe qui exite dans material dart */

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /* initialiser le controller */
    controller = TextEditingController();
    //initialiser la base
    //tous ce que l'on va faire pendant l'initialisation du widget
  }

  @override
  void dispose() {
    controller.dispose(); /* souhaiter que le controller soit nul a la fin */
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
            style: TextButton.styleFrom(
              foregroundColor: Colors.teal,
            ),
          ),
          ElevatedButton(
            onPressed: (() => showDate(context)),
            child: Text(
              "$initialDate",
              style: TextStyle(color: Colors.red),
            ),
            onLongPress: () {
              print('Appui lonnnng');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              elevation: 10,
            ),
          ),
          IconButton(
              onPressed: setIcon(),
              icon: Icon(monIconnn),
              splashColor: Colors.pinkAccent,
              color: Colors.amber),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'entrer votre prenom',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25))),
            /* pour cacher le text entrer, comme les mots de pass */
            /* keyboardType: TextInputType.phone, */
            keyboardType: TextInputType.number,
            //changer imediatement la valeur du text
            /* onChanged: (newString) {
              setState(() {
                prenom = newString;
              });
            },
             */
            onSubmitted: (newString) {
              setState(() {
                prenom = newString;
              });
            },
          ),
          Text(prenom),
          TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'entrer votre nom'),
            onChanged: (newValue) {
              setState(() {});
            },
          ),
          Text(controller.text),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text((SwitchValue)
                  ? "j'aime les chats"
                  : "les chats sont demoniaques"),
              Switch(
                  activeColor: Colors.green,
                  inactiveTrackColor: Colors.red,
                  inactiveThumbColor: Colors.blue,
                  value: SwitchValue,
                  onChanged: ((bool) {
                    setState(() {
                      SwitchValue = bool;
                    });
                  })),
            ],
          ),
          Slider(
            value: sliderValue,
            min: 0.0,
            max: 100.0,
            onChanged: (newValue) {
              setState(() {
                sliderValue = newValue;
              });
            },
            inactiveColor: Colors.deepOrange,
            activeColor: Colors.deepPurple,
            thumbColor: Colors.yellow,
          ),
          Text("valeur: ${sliderValue.toInt()} "),
          Checkbox(
            value: check,
            onChanged: (newBoool) {
              setState(() {
                check = newBoool ?? false; /* une optionnel */
              });
            },
            checkColor: Colors.greenAccent,
            activeColor: Colors.blueGrey,
          ),
          Text(
            "apprendre les interactifs ",
            style: TextStyle(color: textofColor),
          ),
          checks(),
          radios(),
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

  setIcon() {
    setState(() {
      monIconnn = (monIconnn == Icons.favorite)
          ? Icons.favorite_border
          : Icons.favorite;
    });
  }

  Column checks() {
    List<Widget> items = [];
    courses.forEach((course, achete) {
      Widget row = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(course),
          Checkbox(
              value: achete,
              onChanged: ((newValue) {
                setState(() {
                  courses[course] =
                      newValue ?? false; /* new value optionnelle ajoutter ?? */
                });
              }))
        ],
      );
      items.add(row);
    });
    return Column(children: items);
  }

  Row radios() {
    List<Widget> radios = [];
    for (var i = 0; i < 5; i++) {
      Radio r = Radio(
          activeColor: Colors.greenAccent,
          value: i,
          groupValue: groupeValue,
          onChanged: ((newValue) {
            setState(() {
              groupeValue = newValue as int;
            });
          }));
      radios.add(r);
    }
    return Row(children: radios);
  }

  //fonction montrant la date
  showDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1978),
      lastDate: DateTime(2090),
    ).then((value) => {
          if (value != null)
            {
              setState(() {
                initialDate = value;
              })
            }
        });
  }
}
