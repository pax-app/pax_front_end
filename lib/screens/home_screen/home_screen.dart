import 'package:Pax/components/avaliation_card/avaliation_card.dart';
import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/components/drawer/drawer_provider.dart';
import 'package:Pax/screens/became_provider_screen/became_provider_tabs/info_tab.dart';
import 'package:Pax/screens/config_screen/config_screen.dart';
import 'package:flutter/material.dart';
import 'package:Pax/components/drawer/drawer_user.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  bool isProvider = false;

  Widget getDrawer() {
    return this.isProvider
        ? DrawerProvider(this._pageController)
        : DrawerUser(this._pageController);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: this._pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        BaseScreen(
          "Home",
          "Home",
          Text("home"),
          getDrawer(),
        ),
        BaseScreen(
          "Meu Perfil",
          "Meu Perfil",
          // AvaliationCard(
          //   date: "24/07/2018",
          //   description: "Umas descricao",
          //   name: "Esio",
          //   score: 5,
          // ),
          PerfilScreen(),
          getDrawer(),
          padding: false,
        ),

        BaseScreen(
          "Meus cartoes",
          "Meus cartoes",
          Text("Meus cartoes"),
          getDrawer(),
        ),
        BaseScreen(
          "Minhas Conversas",
          "Minhas Conversas",
          Text("Minhas Conversas"),
          getDrawer(),
        ),
        //roviderPanel(this._pageController),
        BaseScreen(
          "Histórico de Servico",
          "Histórico de Servico",
          Text("Histórico de Servico"),
          getDrawer(),
        ),
        BaseScreen(
          " ",
          "Torne-se um prestador ",
          InfoTab(),
          getDrawer(),
        ),
        BaseScreen(
          "Configurações",
          "Edite suas informações",
          ConfigScreen(),
          getDrawer(),
        ),
      ],
    );
  }
}
