import 'package:fluent_ui/fluent_ui.dart';

class IconButtonFixedWidth extends StatelessWidget {
  const IconButtonFixedWidth({
    required this.iconData,
    required this.text,
    required this.onPressed,
    this.size = const Size(40, 40),
    super.key,
  });

  final IconData iconData;
  final String text;
  final VoidCallback onPressed;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SizedBox(
        width: size.width,
        height: size.height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(iconData),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
