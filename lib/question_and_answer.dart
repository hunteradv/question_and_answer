import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuestionAndAnswerPage extends StatelessWidget {
  QuestionAndAnswerPage({super.key});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final marginDefault = const EdgeInsets.fromLTRB(30, 20, 30, 0);
  final TextEditingController txtQuestion = TextEditingController();

  addNewQuestion(BuildContext context, String questionText) {
    firestore.collection('questions').add({'questionText': questionText});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [Text("Q&A"), Text("CODE: CODIGO")],
      )),
      body: Column(
        children: [
          Card(
            margin: marginDefault,
            child: Column(
              children: [
                TextField(
                  controller: txtQuestion,
                  maxLines: 7,
                  decoration: const InputDecoration(
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
                      onPressed: () => {
                        addNewQuestion(context, txtQuestion.text),
                        txtQuestion.text = ""
                      },
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
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: firestore.collection('questions').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      var questions = snapshot.data!.docs;

                      return ListView(
                        shrinkWrap: true,
                        children: questions
                            .map((question) => Card(
                                  margin: marginDefault,
                                  child: ListTile(
                                    title: const Text("Anonymous"),
                                    subtitle: Text(question['questionText']),
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
                                ))
                            .toList(),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
