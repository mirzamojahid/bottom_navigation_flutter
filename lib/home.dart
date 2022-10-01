import 'dart:math';

import 'package:bottom_nav/tests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends StatefulWidget {
//  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            ElevatedButton(
                onPressed: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return Tests();
                  })));
                }),
                child: Text("New Screen"))
          ],
          leading: Consumer(builder: ((context, ref, child) {
            return ElevatedButton(
                onPressed: (() {
                  ref.watch(DataFuture.notifier).tryLoad();
                }),
                child: Text("Reload cart app"));
          }))),
      body: ListView.builder(
          // physics: NeverScrollableScrollPhysics(),
          itemCount: 100,
          itemBuilder: ((context, index) {
            return Text("$index Home");
          })),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class CartReload extends ChangeNotifier {
  CartReload() {
    tryLoad();
  }
  var isLoad = true;
  tryLoad() {
    isLoad = !isLoad;
    print("Cart state Persistent request: $isLoad");
    notifyListeners();
  }
}

final DataFuture = ChangeNotifierProvider((ref) => CartReload());
