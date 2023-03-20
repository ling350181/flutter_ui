import 'package:flutter/material.dart';

class CustomizePageRoute extends StatelessWidget {
  const CustomizePageRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Main Page'),
        actions: [
          IconButton(
            onPressed: () => _toNextSlide(context),
            icon: const Icon(Icons.navigate_next),
          )
        ],
      ),
    );
  }

  void _toNextSlide(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
          pageBuilder: (ctx, a1, a2) => const NextPage(),
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, _, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(
                opacity: Tween<double>(
                  begin: 0.5,
                  end: 1.0,
                ).animate(animation),
                child: child,
              ),
            );
          }),
    );
  }

  void _toNextScale(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
          pageBuilder: (ctx, a1, a2) => const NextPage(),
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, _, child) {
            return ScaleTransition(
              scale: Tween<double>(
                begin: 0,
                end: 1,
              ).animate(animation),
              child: FadeTransition(
                opacity: Tween<double>(
                  begin: 0.5,
                  end: 1.0,
                ).animate(animation),
                child: child,
              ),
            );
          }),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('NextPage'),
      ),
    );
  }
}
