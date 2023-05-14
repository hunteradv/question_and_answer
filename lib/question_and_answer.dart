import 'package:flutter/material.dart';

class QuestionAndAnswerPage extends StatelessWidget {
  final marginDefault = const EdgeInsets.fromLTRB(30, 20, 30, 0);

  const QuestionAndAnswerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Q&A"),
      ),
      body: Column(
        children: [
          Card(
            margin: marginDefault,
            child: Column(
              children: [
                const TextField(
                  maxLines: 7,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                      hintText: "Faça sua pergunta...",
                      hintStyle: TextStyle(fontSize: 18),
                      border: InputBorder.none),
                  keyboardType: TextInputType.text,
                ),
                Row(children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                    child: const Text(
                      "Enviar como anônimo",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(180, 0, 0, 15),
                    child: ElevatedButton(
                      onPressed: () => {},
                      child: const Text(
                        "Enviar",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                ])
              ],
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Card(
                  margin: marginDefault,
                  child: ListTile(
                    title: const Text("Anonymous"),
                    subtitle: const Text(
                        "pergunta muito grande para caber numa unica linha, sendo assim não conseguiria visualiza-la por inteiro"),
                    leading: const CircleAvatar(
                      child: Text("A"),
                    ),
                    trailing: SizedBox(
                      height: 40,
                      width: 80,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () => {},
                              icon: const Icon(Icons.thumb_up)),
                          const Text("12")
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: marginDefault,
                  child: ListTile(
                    title: const Text("Anonymous"),
                    subtitle: const Text(
                        "pergunta muito grande para caber numa unica linha, sendo assim não conseguiria visualiza-la por inteiro"),
                    leading: const CircleAvatar(
                      child: Text("A"),
                    ),
                    trailing: SizedBox(
                      height: 40,
                      width: 80,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () => {},
                              icon: const Icon(Icons.thumb_up)),
                          const Text("12")
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: marginDefault,
                  child: ListTile(
                    title: const Text("Anonymous"),
                    subtitle: const Text(
                        "pergunta muito grande para caber numa unica linha, sendo assim não conseguiria visualiza-la por inteiro"),
                    leading: const CircleAvatar(
                      child: Text("A"),
                    ),
                    trailing: SizedBox(
                      height: 40,
                      width: 80,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () => {},
                              icon: const Icon(Icons.thumb_up)),
                          const Text("12")
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
