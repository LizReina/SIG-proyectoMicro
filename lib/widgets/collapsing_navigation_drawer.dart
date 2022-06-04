import 'package:flutter/material.dart';
import 'package:proyecto_bus/models/navigation_model.dart';
import 'package:proyecto_bus/pages/ver_lineas_page.dart';
import 'package:proyecto_bus/widgets/collapsing_list_tile.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  const CollapsingNavigationDrawer({Key? key}) : super(key: key);

  @override
  State<CollapsingNavigationDrawer> createState() => _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer> with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidth = 70;
  bool isCollapsed = false;
  late AnimationController _animationController;
  late Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 100));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent, 
      ),
      child: AnimatedBuilder(
        animation: _animationController, 
        builder: (context, widget) => getWidget(context, widget),
      ),
    );
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 80.0,
      child: Container(
        width: widthAnimation.value,
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50.0,),
            InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed ? _animationController.forward() : _animationController.reverse();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _animationController,
                color: Colors.white, 
                size: 30.0,
              )
            ),
            const SizedBox(height: 50.0,),
            const Divider(color: Colors.grey, height: 12.0,),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return const Divider(height: 12.0,);
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                    onTap: () {
                      setState(() {
                        currentSelectedIndex = counter;
                        // ignore: avoid_print
                        print('Counter: $counter');
                        if (counter == 0) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ShowLineaPage()));
                        } else if (counter == 1) {
                          //Desplegar Searchbar
                        } 
                      });
                    },
                    isSelected: currentSelectedIndex == counter,
                    title: navigationItems[counter].title,
                    icon: navigationItems[counter].icon,
                    animationController: _animationController,
                  );
                },
                itemCount: navigationItems.length,
              ),
            ),
            const SizedBox(height: 50.0,),
          ],
        ),
      ),
    );
  }
}