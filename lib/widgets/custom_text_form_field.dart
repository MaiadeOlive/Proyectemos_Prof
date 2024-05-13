import 'package:flutter/material.dart';

import '../../../commons/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;

  final bool isEmail;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.keyboardType,
    required this.isEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      maxLines: null,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        label: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            hint,
            style: ThemeText.paragraph16GrayLight,
          ),
        ),
      ),
      keyboardType: keyboardType,
      validator: (resposta) {
        {
          if (resposta!.isEmpty) {
            return 'Ingrese tuja respuesta correctamente';
          }
          if (resposta.length < 3) {
            return 'Su respuesta debe tener al menos 10 caracteres';
          }
          if (isEmail) {
            if (resposta.length < 10) {
              return 'Su respuesta debe tener al menos 10 caracteres';
            }
            if (!resposta.contains(RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'))) {
              return 'Ingrese un corro eletronico valido';
            }
          }
          return null;
        }
      },
    );
  }
}
