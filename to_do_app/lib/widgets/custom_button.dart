import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double height;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry iconPadding;
  final Color color;
  final TextStyle textStyle;
  final double elevation;
  final BorderSide borderSide;
  final BorderRadius borderRadius;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.height = 40,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
    this.iconPadding = EdgeInsets.zero,
    this.color = const Color(0xFF900C3F),
    required this.textStyle,
    this.elevation = 3,
    this.borderSide = BorderSide.none,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: borderRadius,
          child: Padding(
            padding: padding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: textStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
// Exemplo de uso:
CustomButton(
onPressed: () {
print('Button pressed ...');
},
text: 'Sign Up',
textStyle: TextStyle(
fontFamily: 'Space Grotesk',
color: Colors.white,
// outros estilos de texto, se necessário
),
// outros parâmetros opcionais conforme necessário
)
*/