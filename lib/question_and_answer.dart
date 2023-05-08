import 'package:flutter/material.dart';

class QuestionAndAnswerPage extends StatelessWidget {
  const QuestionAndAnswerPage({super.key});

  final marginDefault = const EdgeInsets.fromLTRB(50, 20, 50, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Q&A"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: marginDefault,
              child: const TextField(
                maxLines: 7,
                decoration: InputDecoration(
                    hintText: "Faça sua pergunta",
                    hintStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(50, 5, 50, 10),
              height: 50,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => {},
                  child: const Text(
                    "Enviar",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    margin: marginDefault,
                    width: double.infinity,
                    child: const ListTile(
                      title: Text("Pergunta 1", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    margin: marginDefault,
                    width: double.infinity,
                    child: const ListTile(
                      title: Text("Pergunta 2", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    margin: marginDefault,
                    width: double.infinity,
                    child: const ListTile(
                      title: Text("Pergunta 3", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
