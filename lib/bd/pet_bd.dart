import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_diana_final/model/PetModel.dart';


class PetBD {
  final db = Firestore.instance;
  bool existe = false;

  void createData(PetModel pet) async {
     //var snapshot = await db.collection('CRUD').getDocuments();
     var snapshot = await db.collection('CRUD').getDocuments();


     for(var snap in snapshot.documents){
       if(snap.data['nome']==pet.getNome() && snap.data['tipo']==pet.getTipo()
       && snap.data['sexo']==pet.getSexo() && snap.data['cor'] == pet.getCor()
       && snap.data['telefone']== pet.getTelefone() && snap.data['raca'] == pet.getRaca()){
         existe = true;
         print("true");
       }
     }
     if(existe == false){

       db.collection('CRUD').add({
         "nome": pet.getNome(),
         "tipo": pet.getTipo(),
         "sexo": pet.getSexo(),
         "cor": pet.getCor(),
         "raca": pet.getRaca(),
         "telefone": pet.getTelefone(),
         "descricao": pet.getDescricao(),
       });

     }else{
       print("ja existe");
     }

  }


}


