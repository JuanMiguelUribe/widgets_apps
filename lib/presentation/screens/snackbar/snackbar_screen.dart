import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = "snackbar_screen";
  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text("Hola Mundo"),
      action: SnackBarAction(label: "OK!", onPressed: () {}),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text("¿Estas Seguro?"),
        content: const Text(
          "Est veniam cillum proident reprehenderit dolore quis. Ad aliqua esse amet laboris enim sint sint reprehenderit laboris. Elit quis anim deserunt mollit anim ipsum Lorem cupidatat est irure in aliquip. Incididunt quis minim voluptate magna sint nisi exercitation adipisicing eiusmod nostrud commodo elit. Ut dolore mollit occaecat ut.",
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text("Cancelar"),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text("Aceptar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SnackBars Y Dialogos")),

      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.remove_red_eye_outlined),
        label: Text("Mostrar Snackbar"),
        onPressed: () => showCustomSnackbar(context),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    Text(
                      "Qui labore laboris enim exercitation amet exercitation occaecat voluptate dolor adipisicing proident sit esse. Laborum eiusmod nisi voluptate esse eu officia anim qui sunt esse fugiat. Incididunt pariatur eiusmod nisi excepteur nulla non est laboris officia velit adipisicing nisi excepteur cupidatat. Commodo ullamco ad minim aliquip veniam nostrud. Irure sint do aliquip culpa aliqua ipsum nisi anim nulla mollit sunt.",
                    ),
                  ],
                );
              },
              child: Text("Licencias Usadas"),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: Text("Mostrar Diálogo"),
            ),
          ],
        ),
      ),
    );
  }
}
