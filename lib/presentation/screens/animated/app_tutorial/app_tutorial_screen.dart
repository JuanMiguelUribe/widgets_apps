import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
    title: "Busca la comida",
    caption: "Exercitation esse consequat non adipisicing.",
    imageUrl: "assets/images/1.png",
  ),
  SlideInfo(
    title: "Entrega rapida",
    caption: "Est Lorem sunt ipsum mollit adipisicing aliquip amet do ad quis.",
    imageUrl: "assets/images/2.png",
  ),
  SlideInfo(
    title: "Disfruta la comida",
    caption: "Sunt pariatur et commodo cillum non ad officia duis.",
    imageUrl: "assets/images/3.png",
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = "tutorial_screen";
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
      ;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageViewController,
              physics: BouncingScrollPhysics(),
              children: slides
                  .map(
                    (slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl,
                    ),
                  )
                  .toList(),
            ),
            Positioned(
              right: 10,
              child: TextButton(
                child: const Text("Salir"),
                onPressed: () => context.pop(),
              ),
            ),
            endReached
                ? Positioned(
                    bottom: 30,
                    right: 30,
                    child: FadeInRight(
                      from: 15,
                      delay: const Duration(milliseconds: 500),
                      child: FilledButton(
                        onPressed: () {
                          return context.pop();
                        },
                        child: const Text("Comenzar"),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 20),
            Text(caption, style: captionStyle),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
