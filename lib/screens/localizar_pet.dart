import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LocalizarPet extends StatefulWidget {
  @override
  _LocalizarPetState createState() => _LocalizarPetState();
}

class _LocalizarPetState extends State<LocalizarPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection("CRUD").snapshots(),
              builder: (context, snapshot){
                switch(snapshot.connectionState){
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    List<DocumentSnapshot> documents = snapshot.data.documents;

                    return ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (contex,index){
                          return ListTile(
                            contentPadding: EdgeInsets.all(5),
                            title: Text(documents[index].data['nome']+"\nasdasd"),
                            leading: Image.network("https://www.petlove.com.br/dicas/wp-content/uploads/2018/05/golden-idoso.jpg"),

                          );
                        }
                    );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
