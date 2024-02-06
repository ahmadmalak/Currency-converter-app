import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    this.color = Colors.blue,
    required this.onPressed,
    this.paddingHorizontal = 324,
    this.paddingVertical = 53,
    this.child,
  }) : super(key: key);

  final String text;
  final Color color;
  final double paddingVertical;
  final double paddingHorizontal;
  final Function onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: paddingHorizontal,
      height: paddingVertical,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.blueAccent,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        onPressed: () => onPressed(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: child ??
              Text(
                text,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
              ),
        ),
      ),
    );
  }
}
