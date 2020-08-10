import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_slidy/app/app_controller.dart';
import 'package:flutter_modular_slidy/app/app_widget.dart';
import 'package:flutter_modular_slidy/app/pages/home/home_controller.dart';
import 'package:flutter_modular_slidy/app/pages/home/home_page.dart';
import 'package:flutter_modular_slidy/app/pages/other/other_page.dart';
import 'package:flutter_modular_slidy/app/shared/repositories/poke_repository.dart';
import 'package:flutter_modular_slidy/app/shared/utils/const.dart';

class AppModule extends MainModule {
  // dependencies injection
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController(repository: i.get<PoKeRepository>())),
        Bind((i) => PoKeRepository(i.get<
            Dio>())), // i.get() pegando a injeção do dio de lá no repository
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))), // pegando url
      ];

  // principal widget
  @override
  Widget get bootstrap => AppWidget();

  // routes
  @override
  List<Router> get routers => [
        Router("/", child: (_, args) => HomePage()),
        /*Router("/other/:text",
            child: (_, args) => OtherPage(
                  text: args.params["text"],
                )), */ //dinamic routes
        Router("/other", child: (_, args) => OtherPage())
      ];
}
