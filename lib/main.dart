import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> savollarVaJavoblar = [
    {
      "savol": "1. 2 + 4 + 2 + 4 = ?",
      "javoblar": [
        {"matn": "12", "togrimi": true},
        {"matn": "35", "togrimi": false},
        {"matn": "78", "togrimi": false},
        {"matn": "6", "togrimi": false}
      ]
    },
    {
      "savol": "2. 2 * 4 * 2 * 4 = ?",
      "javoblar": [
        {"matn": "45", "togrimi": false},
        {"matn": "25", "togrimi": false},
        {"matn": "64", "togrimi": true},
        {"matn": "32", "togrimi": false}
      ]
    },
    {
      "savol": "3.  2 + 4 = ?",
      "javoblar": [
        {"matn": "4", "togrimi": false},
        {"matn": "6", "togrimi": true},
        {"matn": "5", "togrimi": false},
        {"matn": "2", "togrimi": false}
      ]
    },
    {
      "savol": "4. 55-7 = ?",
      "javoblar": [
        {"matn": "56", "togrimi": false},
        {"matn": "32", "togrimi": false},
        {"matn": "85", "togrimi": false},
        {"matn": "48", "togrimi": true}
      ]
    },
  ];

  int hozirgiSavonRaqami = 0;
  int countAnswer = 0;

  void restart() {
    setState(() {
      hozirgiSavonRaqami = 0;
      countAnswer = 0;
    });
  }

  void answerQuestion(bool togri) {
    print(togri);

    if (togri) {
      countAnswer += 1;
    }
    print(countAnswer);

    setState(() {
      hozirgiSavonRaqami++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('Ingliz tili quiz'),
            ),
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: hozirgiSavonRaqami < savollarVaJavoblar.length
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            savollarVaJavoblar[hozirgiSavonRaqami]["savol"],
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          ElevatedButton(
                            onPressed: () => answerQuestion(
                                savollarVaJavoblar[hozirgiSavonRaqami]
                                    ["javoblar"][0]["togrimi"]),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                savollarVaJavoblar[hozirgiSavonRaqami]
                                    ["javoblar"][0]["matn"],
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          ElevatedButton(
                            onPressed: () => answerQuestion(
                                savollarVaJavoblar[hozirgiSavonRaqami]
                                    ["javoblar"][1]["togrimi"]),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                savollarVaJavoblar[hozirgiSavonRaqami]
                                    ["javoblar"][1]["matn"],
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          ElevatedButton(
                            onPressed: () => answerQuestion(
                                savollarVaJavoblar[hozirgiSavonRaqami]
                                    ["javoblar"][2]["togrimi"]),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                savollarVaJavoblar[hozirgiSavonRaqami]
                                    ["javoblar"][2]["matn"],
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          ElevatedButton(
                            onPressed: () => answerQuestion(
                                savollarVaJavoblar[hozirgiSavonRaqami]
                                    ["javoblar"][3]["togrimi"]),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                savollarVaJavoblar[hozirgiSavonRaqami]
                                    ["javoblar"][3]["matn"],
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "To'g'ri javoblar soni " +
                                  countAnswer.toString() +
                                  "/4" +
                                  " ta ",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${countAnswer * 25} %",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton.icon(
                                onPressed: restart,
                                icon: Icon(Icons.restart_alt),
                                label: Text("RESTART"))
                          ],
                        ),
                      ))));
  }
}
