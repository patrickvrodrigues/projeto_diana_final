import 'package:flutter/material.dart';
import 'package:projeto_diana_final/screens/configuracoes.dart';
import 'package:projeto_diana_final/screens/menssagens.dart';
import 'package:projeto_diana_final/screens/meus_pets.dart';
import 'package:projeto_diana_final/screens/minhas_dicas.dart';
import 'package:projeto_diana_final/screens/sobre.dart';

class DrawerCustomizado extends StatelessWidget {
  TextStyle _estilo_texto = TextStyle(
    fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 144, 82, 1.0),
              ),
            ),

            ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Color.fromRGBO(255, 186, 92, 1.0)),
                  accountEmail: Text("teste@hotmail.com", style: TextStyle(fontWeight: FontWeight.bold),),
                  accountName: Text("Carlos da Silva", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  currentAccountPicture: CircleAvatar(backgroundImage: Image.asset("assets/sasuke.jpg").image,
                  ),
                  otherAccountsPictures: <Widget>[
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: (){
                      },
                    ),
                  ],
                  margin: EdgeInsets.all(0.0),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 0, 0),
                        child: ListTile(
                          title: Text("Meus Pets",
                            style: _estilo_texto,
                          ),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MeusPets()),
                            );
                          },
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(5, 25, 0, 0),
                          child: ListTile(
                            title: Text("Minhas Dicas",
                              style: _estilo_texto,
                            ),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MinhasDicas()),
                              );
                            },
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(5, 25, 0, 110),
                          child: ListTile(
                            title: Text("Mensagens",
                              style: _estilo_texto,
                            ),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Menssagens()),
                              );
                            },
                          )
                      )
                    ],
                  ),
                ),

                Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Divider(
                          thickness: 1.0,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(5, 15, 0, 0),
                            child: ListTile(
                              title: Text("Configurações",
                                style: _estilo_texto,
                              ),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Configuracoes()),
                                );
                              },
                            )

                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                            child: ListTile(
                              title: Text("Sobre",
                                style: _estilo_texto,
                              ),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Sobre()),
                                );
                              },
                            )
                        ),
                      ],
                    )
                )

              ],
            )
          ],

        )
    );
  }
}

