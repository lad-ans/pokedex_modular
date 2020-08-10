import 'package:flutter_modular_slidy/app/shared/models/pokemon_model.dart';
import 'package:flutter_modular_slidy/app/shared/repositories/poke_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PoKeRepository repository;

  @observable
  ObservableFuture<List<PokemonModel>> pokemon;

  _HomeControllerBase({this.repository}) {
    pokemon = repository.getAllPokemons().asObservable();
  }
}
