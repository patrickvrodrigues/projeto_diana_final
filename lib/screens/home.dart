import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:projeto_diana_final/drawers/drawer.dart';
import 'package:projeto_diana_final/screens/cadastrar.dart';
import 'package:projeto_diana_final/screens/localizar_pet.dart';

class Home extends StatelessWidget {
  BoxDecoration _boxDecoration1 = new BoxDecoration(
      color: Color.fromRGBO(255, 144, 82, 1.0),
      borderRadius: BorderRadius.all(Radius.circular(40.0)));
  BoxDecoration _boxDecoration2 = new BoxDecoration(
      color: Color.fromRGBO(255, 186, 92, 1.0),
      borderRadius: BorderRadius.all(Radius.circular(40.0)));
  TextStyle _estilo_texto_botao = TextStyle(
    fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 240, 237, 1.0),
      appBar: AppBar(
        title: Text("Diana"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(255, 144, 82, 1.0),
      ),
      drawer: DrawerCustomizado(),
      body: Column(

        children: <Widget>[
          CarouselSlider(
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 1),
            enlargeCenterPage: true,
            items: <Widget>[
              Container(
                child: Image.asset('assets/images/foto1.jpg'),
              ),
              Container(
                child: Image.asset('assets/images/foto2.jpg'),
              ),
              Container(
                child: Image.asset('assets/images/foto3.jpg'),
              )
            ],
          ),
          Expanded(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(15.0),
                        child: InkWell(
                          child: Container(
                            decoration: _boxDecoration1,
                            width: 150,
                            height: 90,
                            child: Center(child:
                            Text("Cadastrar Pet", style: _estilo_texto_botao,)),
                          ),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cadastrar()),
                            );
                          },
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: InkWell(
                      child: Container(
                        decoration: _boxDecoration2 ,
                        width: 150,
                        height: 90,
                        child: Center(child:
                        Text("Localizar Pet", style: _estilo_texto_botao,)),
                      ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LocalizarPet()),
                          );
                        },
                      )
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Container(
                        width: 150,
                        height: 90,
                        decoration: _boxDecoration2,
                        child: Center(child:
                        Text("Pista", style: _estilo_texto_botao,)),

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Container(
                        width: 150,
                        height: 90,
                        decoration: _boxDecoration1,
                        child: Center(child:
                        Text("Dicas", style: _estilo_texto_botao,)),

                      ),
                    ),
                  ],
                )
              ],
            ),
          )




        ],
      ),
    );
  }
}
