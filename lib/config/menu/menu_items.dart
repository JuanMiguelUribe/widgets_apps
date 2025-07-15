import 'package:flutter/material.dart'
    show IconData, Icons; //solo se importa el paquete de icondata

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const List<MenuItem> appMenuItems = [
  MenuItem(
    title: "Botones",
    subTitle: "Varios botones en Flutter",
    link: "/buttons",
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: "Tarjetas",
    subTitle: "Un contenedor estilizado",
    link: "/cards",
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: "Progress Indicators",
    subTitle: "Generales y Controlados",
    link: "/progress",
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: "SnackBars y Dialogos",
    subTitle: "Indicadores en pantalla",
    link: "/snackbars",
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: "UI Controls + Tiles",
    subTitle: "Una serie de controles de flutter",
    link: "/ui-controls",
    icon: Icons.car_rental_outlined,
  ),
  MenuItem(
    title: "Introduccion a la aplicación",
    subTitle: "Pequeño tutorial introductorio de la app",
    link: "/tutorial",
    icon: Icons.accessible_rounded,
  ),
];
