import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuestionAndAnswerPage extends StatelessWidget {
  QuestionAndAnswerPage({super.key});

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  final marginDefault = const EdgeInsets.fromLTRB(30, 20, 30, 0);
  final TextEditingController txtQuestion = TextEditingController();

  addNewQuestion(BuildContext context, String questionText) {
    firestore.collection('questions').add({
      'questionText': questionText,
      'likesQuantity': 0,
      'uid': auth.currentUser!.uid,
      'date': DateTime.now(),
      'usersLikes': <String>[]
    });
  }

  addLike(BuildContext context, String questionId) async {
    DocumentReference docRef =
        firestore.collection('questions').doc(questionId);

    DocumentSnapshot snapshot = await docRef.get();

    if (snapshot.exists) {
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>;
      List<dynamic> usersLikes = data['usersLikes'];

      if (!usersLikes.contains(auth.currentUser!.uid)) {
        int likesQuantity = data['likesQuantity'] ?? 0;
        int newLikesQuantity = likesQuantity + 1;
        usersLikes.add(auth.currentUser!.uid);

        await docRef.update(
            {'likesQuantity': newLikesQuantity, 'usersLikes': usersLikes});
      }
    }
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
                    stream: firestore
                        .collection('questions')
                        .orderBy('likesQuantity', descending: true)
                        .orderBy('date', descending: false)
                        .snapshots(),
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
                                              onPressed: () => {
                                                    addLike(
                                                        context, question.id)
                                                  },
                                              icon: const Icon(Icons.thumb_up)),
                                          Text(question['likesQuantity']
                                              .toString())
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
