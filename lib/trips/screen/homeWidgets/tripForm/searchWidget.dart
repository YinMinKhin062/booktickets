import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import '../../widgets/circularContainer.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key, required this.searchHintTxt});

  final String searchHintTxt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextFormField(
          decoration: InputDecoration(
              hintText: searchHintTxt,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none),
        )
        // const SizedBox(
        //   width: 10,
        // ),
        // const Icon(
        //   Icons.search_outlined,
        //   size: 25,
        //   color: Colors.grey,
        // ),
        // const SizedBox(
        //   width: 15,
        // ),
        // Text(
        //   searchHintTxt,
        //   style: Theme.of(context)
        //       .textTheme
        //       .bodyLarge!
        //       .copyWith(color: Colors.grey),
        // )
      ],
    );
  }
}
