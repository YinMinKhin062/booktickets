import 'package:flutter/material.dart';

class listTileWidget extends StatelessWidget {
  const listTileWidget({
    super.key,
    required this.icon,
    required this.text,
    this.ontap,
  });

  final IconData icon;
  final String text;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue.shade400,
      ),
      title: Text(
        text,
      ),
      onTap: ontap,
    );
  }
}
