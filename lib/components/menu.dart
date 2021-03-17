import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/pages/home/home_page.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.scaleDown,
                  ),
                ),
                CustomText(
                  text: "Consulta Marcada",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ],
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
