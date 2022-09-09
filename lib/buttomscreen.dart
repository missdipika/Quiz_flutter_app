import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  const NavItem(
      {Key? key,
      required this.isActive,
      required this.icon,
      required this.text})
      : super(key: key);
  final bool isActive;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      duration: Duration(milliseconds: 500),
      width: isActive ? 88 : 35,
      height: 38,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: isActive ? Colors.lightBlue.shade200 : Colors.transparent,
          borderRadius: BorderRadius.circular(15)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.lightBlue.shade700 : Colors.grey,
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 700),
              opacity: isActive ? 1 : 0,
              child: Text(
                text,
                style: TextStyle(
                  color:
                      isActive ? Colors.lightBlue.shade700 : Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
