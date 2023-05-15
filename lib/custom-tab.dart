import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String name;
  final bool isSelected;
  final bool isFirst;
  final void Function() onTap;

  const CustomTab({
    required this.name,
    required this.isSelected,
    required this.isFirst,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          height: 50,
          decoration: _decoration(),
          child: Center(
            child: Text(name),
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  BoxDecoration _decoration() => BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        border: Border(
          bottom: isSelected
              ? BorderSide.none
              : BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
          top: isSelected
              ? BorderSide(
                  color: Colors.black,
                  width: 1,
                )
              : BorderSide.none,
          right: (isFirst && isSelected)
              ? BorderSide(
                  color: Colors.black,
                  width: 1,
                )
              : BorderSide.none,
          left: (!isFirst && isSelected)
              ? BorderSide(
                  color: Colors.black,
                  width: 1,
                )
              : BorderSide.none,
        ),
        boxShadow: isSelected // Tab shadow logic
            ? [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: isFirst
                      ? Offset(4, -4)
                      : Offset(-4, -4), // changes position of shadow
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: -4,
                  blurRadius: 7,
                  offset: Offset(0, 35), // changes position of shadow
                ),
              ],
      );
}
