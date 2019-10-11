import 'package:Pax/components/avaliation_card/avaliation_card.dart';
import 'package:Pax/components/base_screen/base_screen.dart';
import 'package:Pax/components/drawer/drawer_provider.dart';
import 'package:Pax/screens/became_provider_screen/became_provider_tabs/info_tab.dart';
import 'package:Pax/screens/config_screen/config_screen.dart';
import 'package:Pax/screens/perfil_screen/perfil_screen.dart';
import 'package:Pax/screens/chat_screen/chat_screen.dart';
import 'package:Pax/screens/my_conversations/my_conversations.dart';
import 'package:Pax/components/simple_tile/simple_tile.dart';
import 'package:Pax/screens/category_screen/category_screen.dart';
import 'package:Pax/screens/provider_categories_screen/provider_category_screen.dart';
import 'package:Pax/screens/provider_panel/provider_panel.dart';
import 'package:flutter/material.dart';
import 'package:Pax/components/drawer/drawer_user.dart';
import 'package:Pax/screens/home_screen/tabs/home_tab.dart';
import 'package:Pax/components/general_categories_panel/general_categories_panel_card.dart';
import 'package:Pax/screens/general_categories_screen/services_general_categories.dart';

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
          "Opções de Serviço",
          "",
          ServiceGeneralCategory(),
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
          "",
          "Serviços de Assistência Técnica",
          ProviderCategoryScreen(),
          getDrawer(),
        ),
        ProviderPanel(this._pageController),
      ],
    );
  }
}

        BaseScreen(
          "Meus cartoes",
          "Meus cartoes",
          Text("Meus cartoes"),
          getDrawer(),
        ),
        BaseScreen(
          "",
          "Minhas Conversas",
          MyConversations(),
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
