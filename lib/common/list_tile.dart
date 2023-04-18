import 'package:flutter/material.dart';

import '../themes/themes.dart';

class CommonListTile extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const CommonListTile({super.key, required this.label,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListTile(
        title:  Text(
          label,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
        ),
        trailing: InkWell(
          onTap: onTap,
          child: const Text(
            "SEE ALL",
            style: TextStyle(
                color: Themes.accentColor, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
