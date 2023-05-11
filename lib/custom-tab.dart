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
      child: InkWell(
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
    color: isSelected ? Colors.white : Colors.black26,
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
          right: isFirst
              ? BorderSide(
                  color: Colors.black,
                  width: 1,
                )
              : BorderSide.none,
        ),
      );
}
