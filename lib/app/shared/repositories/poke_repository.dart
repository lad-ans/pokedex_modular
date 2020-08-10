import 'package:dio/dio.dart';
import 'package:flutter_modular_slidy/app/shared/models/pokemon_model.dart';

class PoKeRepository {
  final Dio dio;

  PoKeRepository(this.dio);

  Future<List<PokemonModel>> getAllPokemons() async {
    var response = await dio.get("/pokemon");
    List<PokemonModel> list = [];
    for (var json in response.data["results"] as List) {
      PokemonModel model = PokemonModel(name: json["name"]);
      list.add(model);
    }

    return list;
  }
}
