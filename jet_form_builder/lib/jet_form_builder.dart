library jet_form_builder;

import 'package:flutter/material.dart';

enum JetFormTypes { text, button }

class JetDisplay extends StatelessWidget {
  final List<List<JetDisplayItem>> listParent;

  const JetDisplay(this.listParent);

  @override
  Widget build(BuildContext context) {
    if (this.listParent == null) {
      print('list cant be nul');
      return Container();
    }
    if (this.listParent.isEmpty) {
      print('list cant be empty');
      return Container();
    }
    ThemeData theme = Theme.of(context);
    List<Widget> listWidgets = [];
    Widget widgetA = Container();
    Widget widgetB = Container();

    //loop tthru the list of list<map>
    for (var i = 0; i < listParent.length; i++) {
      //store each list<map> in a var
      List<JetDisplayItem> listChild = listParent[i];

      //check how many maps this list has
      if (listChild.length == 1) {
        //case 1, buid entire row widget
        widgetA = listChild[0].type == JetFormTypes.button
            ? OutlinedButton(
                onPressed: listChild[0].onPressed,
                child: Text("${listChild[0].label}"))
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                      "${listChild[0].label}",
                      style: theme.textTheme.caption,
                    ),
                    SelectableText("${listChild[0].text}",
                        style: theme.textTheme.bodyText2)
                  ]);
        //store entire row in listWidget
        listWidgets.add(widgetA);
      } else if (listChild.length == 2) {
        //case 2, buid 2 widgets per row
        widgetA = listChild[0].type == JetFormTypes.button
            ? OutlinedButton(
                onPressed: listChild[0].onPressed,
                child: Text("${listChild[0].label}"))
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${listChild[0].label}",
                    style: theme.textTheme.caption,
                  ),
                  SelectableText(
                    "${listChild[0].text}",
                    style: theme.textTheme.bodyText2,
                  )
                ],
              );
        widgetB = listChild[1].type == JetFormTypes.button
            ? OutlinedButton(
                onPressed: listChild[1].onPressed,
                child: Text("${listChild[1].label}"))
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${listChild[1].label}",
                    style: theme.textTheme.caption,
                  ),
                  SelectableText(
                    "${listChild[1].text}",
                    style: theme.textTheme.bodyText2,
                  )
                ],
              );
        listWidgets.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: widgetA),
            SizedBox(
              width: 8.0,
            ),
            Expanded(child: widgetB)
          ],
        ));

        //buid divided row widget
      } else {
        print('this list cant have more than 2 items per line');
        List<Widget> listWidgetsChild = [];

        for (var i = 0; i < listChild.length; i++) {
          listWidgetsChild.add(listChild[i].type == JetFormTypes.button
              ? OutlinedButton(
                  onPressed: listChild[i].onPressed,
                  child: Text("${listChild[i].label}"))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${listChild[i].label}",
                      style: theme.textTheme.caption,
                    ),
                    SelectableText(
                      "${listChild[i].text}",
                      style: theme.textTheme.bodyText2,
                    )
                  ],
                ));
        }
        listWidgets.add(Container(
          height: 40,
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (b, i) {
                return listWidgetsChild[i];
              },
              separatorBuilder: (bx, ix) => SizedBox(width: 4),
              itemCount: listWidgetsChild.length),
        ));
      }
    }
    //builde final list
    if (listWidgets.length > 0) {
      return ListView.builder(
          itemCount: listWidgets.length,
          itemBuilder: (ctx, idx) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: listWidgets[idx],
            );
          });
    }
    print('should not come to here...CHECK');
    return Container();
  }
}

///model class to be displayed on [JetDisplay] widget
class JetDisplayItem {
  ///type of content information to be displayed
  final JetFormTypes type;

  //label of content
  final String label;

  ///text of content, only used when its a NOT buttom
  final String text;

  /// the function of a type button
  final Function onPressed;

  JetDisplayItem(
      {@required this.type,
      @required this.label,
      this.text = '',
      this.onPressed});
}
