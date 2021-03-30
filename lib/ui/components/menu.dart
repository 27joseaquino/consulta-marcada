import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/components/logo_consulta_marcada.dart';
import 'package:consulta_marcada/ui/pages/home/home_page.dart';
import 'package:consulta_marcada/ui/styles/custom_text.dart';
import 'package:consulta_marcada/ui/styles/my_colors.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: LogoConsultaMarcada(
              fontSize: 18,
              height: 100,
              width: 100,
            ),
            decoration: BoxDecoration(color: MyColors.appColors["blue"]),
          ),
          buildListTile(
            icon: Icon(Icons.support_agent_outlined),
            title: "Consultas",
            onTap: () {
              pop(context);
              push(context, HomePage(selectedIndex: 1), replace: true);
            },
          ),
          buildListTile(
            icon: Icon(Icons.people_alt),
            title: "Pacientes",
            onTap: () {
              pop(context);
              push(context, HomePage(selectedIndex: 2), replace: true);
            },
          ),
          buildListTile(
            icon: Icon(Icons.settings),
            title: "Configurações",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  ListTile buildListTile({
    @required Icon icon,
    @required String title,
    @required Function onTap,
  }) {
    return ListTile(
      leading: icon,
      title: CustomText(text: title, fontSize: 14),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
