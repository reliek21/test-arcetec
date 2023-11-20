import 'package:flutter/material.dart';
import 'package:test_arcetec/common/colors/colors_common.dart';
import 'package:test_arcetec/common/typography/typography_common.dart';

class ReusableSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    String? actionLabel,
    Function? onActionPressed,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: ArcetecColors.secondaryColor,
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: ArcetecTypography.title(
						color: ArcetecColors.secondaryColor, fontWeight: FontWeight.w400
					),
        ),
        action: SnackBarAction(
          textColor: ArcetecColors.secondaryColor,
          label: actionLabel ?? 'Undo',
          onPressed: onActionPressed as void Function()? ?? () {},
        ),
      ),
    );
  }
}
