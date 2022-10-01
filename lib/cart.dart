import 'package:bottom_nav/Cart.dart';
import 'package:bottom_nav/home.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

class Cart extends ConsumerStatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  ConsumerState<Cart> createState() => _CartState();
}

class _CartState extends ConsumerState<Cart>
    with AutomaticKeepAliveClientMixin<Cart> {
  bool reload = true;

  var random = new Random();
  @override
  void initState() {
    print(ref.read(DataFuture).isLoad);

    if (ref.read(DataFuture).isLoad) {
      print("Persistent");
    } else {
      setState(() {
        reload = false;
      });

      print("Non Persistent");
      updateKeepAlive();
    }

    print(random.nextInt(10000));
    super.initState();
  }

  @override
  void dispose() {
    updateKeepAlive.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(body: Consumer(builder: ((context, ref, child) {
      final data = ref.read(DataFuture).isLoad;
      return Column(
        children: [
          Text(" cart $data  Persistent: $reload"),
          StreamBuilder(
              initialData: data,
              stream: ref.read(DataFuture.notifier).tryLoad(),
              builder: ((context, snapshot) {
                print(random.nextInt(7878));
                return Text(data.toString());
              }))
        ],
      );
    })));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => reload;
}


/*
import 'package:bottom_nav/Cart.dart';
import 'package:bottom_nav/home.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart' ;
import 'dart:math';



class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> with AutomaticKeepAliveClientMixin {
  bool reload = true;
  Home home = Home();

  var random = new Random();
  @override
  void initState() {
    if(DataFuture.notifier){
      print("Mirza");
    } else {
      setState(() {
        reload = false;
      });

      print("Mojahid");
      updateKeepAlive();
    }

    print(random.nextInt(10000));
    super.initState();
  }

  @override
  void dispose() {
    updateKeepAlive();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(body: Consumer(builder: ((context, ref, child) {
     final data= ref.read(DataFuture).isLoad;
      return Text(" cart $data");
    })));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => reload;
}

*/
