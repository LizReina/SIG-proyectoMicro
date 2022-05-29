import 'package:flutter/material.dart';
import 'package:proyecto_bus/widgets/theme.dart';

class CollapsingListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;
  final bool isSelected;
  final Function() onTap;

  // ignore: use_key_in_widget_constructors
  const CollapsingListTile({
    required this.title, 
    required this.icon, 
    required this.animationController,
    this.isSelected = false,
    required this.onTap
  });

  @override
  State<CollapsingListTile> createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  late Animation<double> widthAnimation, sizedBoxAnimation;

  @override
  void initState() {
    super.initState();
    widthAnimation = Tween<double>(begin: 250, end: 70).animate(widget.animationController);
    sizedBoxAnimation = Tween<double>(begin: 10, end: 0).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: widget.isSelected ? Colors.transparent.withOpacity(0.3) : Colors.transparent, 
        ),
        width: widthAnimation.value,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Icon(
              widget.icon, 
              color: widget.isSelected ? selectedColor : noSelectedColor, size: 30.0,),
            SizedBox(width: sizedBoxAnimation.value,),
            (widthAnimation.value >= 220) 
              ? Text(
                  widget.title, 
                  style: widget.isSelected 
                    ? listTileSelectedTextStyle 
                    : listTileDefaultTextStyle,
                ) 
              : Container(),
          ],
        ),
      ),
    );
  }
}