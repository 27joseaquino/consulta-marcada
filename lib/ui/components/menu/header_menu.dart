import 'package:consulta_marcada/core/models/user.dart';
import 'package:consulta_marcada/core/utils/text_utils.dart';
import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:consulta_marcada/ui/providers/user_provider.dart';
import 'package:consulta_marcada/ui/styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, child) {
      User user = userProvider.user;
      return DrawerHeader(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                direction: Axis.vertical,
                children: [
                  CustomText(
                    text: treatUsername(user.name),
                    textAlign: TextAlign.center,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    maxlines: 2,
                  ),
                  CustomText(
                    text: user.email ?? "",
                    fontSize: 16,
                    textAlign: TextAlign.center,
                    color: Colors.white,
                    maxlines: 2,
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings, color: Colors.white),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(color: MyColors.appColors["blue"]),
      );
    });
  }
}
