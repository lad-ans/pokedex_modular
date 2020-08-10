import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_slidy/app/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homeController = Modular.get<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Modular"),
      ),
      body: Observer(
        builder: (_) {
          if (homeController.pokemon.error != null) {
            return Center(
              child: Text("Erro"),
            );
          } else if (homeController.pokemon.value == null) {
            return Center(child: CircularProgressIndicator());
          }
          var list = homeController.pokemon.value;
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(list[index].name),
                );
              });
        },
      ),
    );
  }
}
