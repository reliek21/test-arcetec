import 'package:flutter/material.dart';
import 'package:test_arcetec/common/colors/colors_common.dart';
import 'package:test_arcetec/common/typography/typography_common.dart';

class OutlineButtonWidget extends StatelessWidget {
  final String text;
  final bool? fillButton;
  final void Function()? onPressed;
	final Color? color;

  const OutlineButtonWidget({
    super.key,
    this.fillButton = false,
    required this.text,
    required this.onPressed,
		this.color = ArcetecColors.tertiaryColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: (fillButton == false)
            ? Colors.transparent
            : color,
        border: (fillButton == false)
            ? Border.all(color: color!)
            : null,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
            ArcetecColors.primaryColor.withOpacity(0.10),
          ),
        ),
        child: Text(
          text,
          style: ArcetecTypography.title(color: ArcetecColors.primaryColor),
        )
      ),
    );
  }
}
