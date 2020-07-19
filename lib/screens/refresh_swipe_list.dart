import 'package:flutter/material.dart';

class RefreshSwipeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RefreshSwipeList'),
      ),
      body: ListHome()
    );
  }
}

class ListHome extends StatefulWidget {
  @override
  ListHomeState createState() => ListHomeState();
}

class ListHomeState extends State<ListHome> {
  // インスタンス変数
  List<String> fruits;
  GlobalKey<RefreshIndicatorState> refreshKey;

  // 初期化
  @override
  void initState() {
    super.initState();
    fruits = List();
    refreshKey = GlobalKey<RefreshIndicatorState>();
    addFruits();
  }

  addFruits() {
    fruits.add('apple');
    fruits.add('orange');
    fruits.add('banana');
    fruits.add('melon');
    fruits.add('strawberry');
  }

  removeFruits(index) {
    setState(() {
      fruits.removeAt(index);
    });
  }

  undoDelete(index, fruit) {
    setState(() {
      fruits.insert(index, fruit);
    });
  }

  Future<Null> refreshList() async{
    await Future.delayed(Duration(seconds: 1));
    return null;
  }

  showSnackBar(context, fruit, index) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$fruit delete'),
      action: SnackBarAction(
        label: 'UNDO',
        onPressed: () {
          undoDelete(index, fruit);
        },
      ),
    ));
  }

  Widget itemBg() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      )
    );
  }
  
  Widget list() {
    return ListView.builder(
      padding: EdgeInsets.all(20.0),
      itemCount: fruits.length,
      itemBuilder: (BuildContext context, int index) {
        return row(context, index);
      },
    );
  }

  Widget row(context, index) {
    debugPrint('index: $index');
    return Dismissible(
      key: Key(fruits[index]),
      onDismissed: (direction) {
        debugPrint('fruits: is $index');
        var fruit = fruits[index];
        showSnackBar(context, fruit, index);
        removeFruits(index);
      },
      background: itemBg(),
      child: Card(
        child: ListTile(
          title: Text(fruits[index])
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async{
          await refreshList();
        },
        child: list(),
      ),
    );
  }
}