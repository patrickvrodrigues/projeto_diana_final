
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_diana_final/bd/pet_bd.dart';
import 'package:projeto_diana_final/model/PetModel.dart';


class Cadastrar extends StatefulWidget {
  @override
  _CadastrarState createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  final _formKey = GlobalKey<FormState>();
  String nome = '';
  String dropdownValue = 'Cachorro';
  String dropdownValue2 = 'Macho';
  File _image;
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _tipoController = TextEditingController();
  TextEditingController _sexoController = TextEditingController();
  TextEditingController _racaController = TextEditingController();
  TextEditingController _corController = TextEditingController();
  TextEditingController _numeroController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();

  PetBD bd = PetBD();


  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Divider(),
                  Center(
                    child: RaisedButton(
                      child: Icon(Icons.add_a_photo),
                      onPressed: getImage,
                    ),
                  ),

                  Divider(),
                  TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(
                      hintText: 'Nome',
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, Insira algum valor';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          color: Colors.black
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.deepOrangeAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['Cachorro', 'Gato']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child:DropdownButton<String>(
                      value: dropdownValue2,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          color: Colors.black
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.deepOrangeAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue2 = newValue;
                        });
                      },
                      items: <String>['Macho', 'Fêmea']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                          .toList(),
                    ),
                  ),

                  TextFormField(
                    controller: _racaController,
                    decoration: const InputDecoration(
                      hintText: 'Raça',
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, Insira algum valor';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _corController,
                    decoration: const InputDecoration(
                      hintText: 'Cor',
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, Insira algum valor';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _numeroController,
                    decoration: const InputDecoration(
                      hintText: 'Telefone',
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Pora favor, insira um telefone';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                  ),
                  TextFormField(
                    controller: _descricaoController,
                    decoration: const InputDecoration(
                      hintText: 'Descrição',
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Pora favor, insira uma raça';
                      }


                      return null;
                    },
                    maxLines: 7,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            print(_formKey);
                            print(_formKey.currentState.toString());
                            PetModel pet = new PetModel(_nomeController.text, dropdownValue,
                                dropdownValue2, _racaController.text, _corController.text,
                                int.parse(_numeroController.text), _descricaoController.text);
                            bd.createData(pet);
                            Navigator.pop(context);


                          }
                        },
                        child: Text('Cadastrar'),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ],
        )
    );
  }
}
