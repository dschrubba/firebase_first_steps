import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_first_steps/constants.dart';
import 'package:flutter/material.dart';

class ScreenHomeBody extends StatelessWidget {
  const ScreenHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot<Map<String, dynamic>>> stream = FirebaseFirestore
        .instance
        .collection(kUserCollectionName)
        .snapshots();
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: stream,
      builder: (context, snapshot) {
        final List<QueryDocumentSnapshot<Map<String, dynamic>>>? data =
            snapshot.data?.docs;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              if ((data != null) && data.isNotEmpty)
                Column(
                  children: [
                  countDocuments(context, data),
                  ...data.map((doc) {
                    // Replace 'expectedFields' with your actual list of fields
                    List<String> expectedFields = ['firstName', 'lastName'];
                    return getDocumentData(context, doc, doc.id, expectedFields);
                  }).toList()],
                )
              else
                Text("No data"),
            ],
          ),
        );
      },
    );
  }

  /*
    Shows the number of documents in a collection
  */
  Widget countDocuments(BuildContext context, List<QueryDocumentSnapshot<Map<String, dynamic>>> documentList) {
        return Column(
      children: [

        Text("Documents: ${documentList.length}", style: Theme.of(context).textTheme.labelLarge),
          SizedBox(height: 16,)
      ],
    );
  }

  /*
    Lists all documents of a collection, shows document data based on expected fields
  */
  Widget getDocumentData(BuildContext context, QueryDocumentSnapshot<Map<String, dynamic>> docSnap, String documentName, List<String> expectedFields) {
    Map<String,dynamic> data = docSnap.data();
    List<Widget> list = List.empty(growable: true);
    for (String field in expectedFields) {
      if (data.containsKey(field)) {
        list.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("$field: \t"),
            Text(data[field].toString())
          ],
        ));
      }
    }
    return Column(
      children: [

        Text("Document: $documentName", style: Theme.of(context).textTheme.labelLarge),
        Card.outlined(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: list,),
          ),),
          SizedBox(height: 16,)
      ],
    );
  }

  /*
    Gets all documents of a collection
  */
  Widget getCollectionData() {
    return Placeholder();
  }
}
