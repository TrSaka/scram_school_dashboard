import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_school/core/riverpod/remember_riverpod.dart';
import 'package:flutter_school/core/widgets/global/text_forms.dart';
import '../../utils/color/scheme_colors.dart';

class RememberMeButton extends ConsumerWidget {
  const RememberMeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text("Remember Me"),
          Observer(builder: (_) {
            return IconButton(
              onPressed: () {
                viewModel.changeRememberMeBoxState();
                ref.read(rememberMeProvider.notifier).changeState();
              },
              icon: viewModel.rememberMeCheckBoxState == false
                  ? const Icon(
                      Icons.check_box_outline_blank_rounded,
                      color: UIColors.COLOR_GREY,
                    )
                  : const Icon(
                      Icons.check_box_rounded,
                      color: UIColors.COLOR_GREY,
                    ),
            );
          }),
        ],
      ),
    );
  }
}