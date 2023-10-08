import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarWidgetItem {
  BottomNavBarWidgetItem({this.iconData, required this.text});
  final iconData;
  String text;
}

class BottomNavBarWidget extends StatefulWidget {
  BottomNavBarWidget({
    required this.items,
    this.height = 60.0,
    this.iconSize = 20.0,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    required this.onTabSelected,
  }) {}

  final List<BottomNavBarWidgetItem> items;

  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;

  final ValueChanged<int> onTabSelected;
  @override
  State<StatefulWidget> createState() => BottomNavBarWidgetState();
}

class BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items,
        ),
        color: widget.backgroundColor,
      ),
    );
  }

  Widget _buildTabItem({
    required BottomNavBarWidgetItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
        child: SizedBox(
      height: widget.height,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => onPressed(index),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                item.iconData,
                color: color,
                height: widget.iconSize,
                width: widget.iconSize,
              ),
              const SizedBox(
                height: 5,
              ),
              // Text(
              //   item.text,
              //   style: TextStyle(
              //     color: color,
              //     fontSize: 12,
              //     fontFamily: 'Quicksand',
              //     fontWeight: FontWeight.w700,
              //   ),
              // )
            ],
          ),
        ),
      ),
    ));
  }
}
