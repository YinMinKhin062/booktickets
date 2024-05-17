import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/Sizes.dart';
import '../../../widgets/circularContainer.dart';

class AddDeductWidget extends StatelessWidget {
  const AddDeductWidget(
      {super.key, this.add, this.remove, required this.value});

  final void Function()? add, remove;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: remove,
          child: CircularContainer(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              "-",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            bgColor: Colors.blue.shade300,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(value),
        const SizedBox(
          width:10,
        ),
        InkWell(
          onTap: add,
          child: CircularContainer(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              "+",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            bgColor: Colors.blue.shade300,
          ),
        ),
      ],
    );
  }
}
