import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newzz/utils/custom_icons_icons.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  final Icon actionIcon;
  final bool showAction;

  CustomAppBar(
      this.title, {this.actionIcon, this.showAction, Key key}) : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            actions: [
              showActions(showAction)
            ],
          ),
        ],
      ),
    );
  }

  Widget showActions(bool show){
    if(show){
      return IconButton(
        icon: Icon(CustomIcons.settings,
          color: Colors.black,),
        onPressed: () {},
      );}else{
      return Container();
    }
    }
}

