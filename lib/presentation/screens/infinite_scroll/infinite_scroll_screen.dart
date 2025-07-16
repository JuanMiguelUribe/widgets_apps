import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = "infinite_screen";
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;

    if (!isMounted) return;
    setState(() {});
    moveScrolltoBottom();
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    // imagesIds.add(lastId+1);
    // imagesIds.add(lastId+2);
    // imagesIds.add(lastId+3);
    // imagesIds.add(lastId+4);
    // imagesIds.add(lastId+5); //para hacer Esto
    //Sale mejor hacer esto de abajo
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  void moveScrolltoBottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent)
      return;

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    if (!isMounted) return;
    await Future.delayed(const Duration(seconds: 3));
    isLoading = false;

    final lastId = imagesIds.last;

    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("InfiniteScroll")),
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2,
          onRefresh: onRefresh,
          child: ListView.builder(
            //el builder es para trabajar bajo demanda, para que no consuma memoria
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: AssetImage("assets/images/jar-loading.gif"),
                image: NetworkImage(
                  "https://picsum.photos/id/${imagesIds[index]}/500/300",
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: (isLoading)
            ? SpinPerfect(
                infinite: true,
                child: const Icon(Icons.refresh_outlined),
              )
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_rounded)),
        onPressed: () => context.pop(),
      ),
    );
  }
}
