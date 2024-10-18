import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:project_fnb/bayar.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<int> biling = List.generate(10, (index) => 1);
  List<int> indexing = List.generate(10, (index) => index);

  int idxTab = 0;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: idxTab,
      length: 10,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          title: const Text("Warunk Makan"),
          actions: [
            IconButton(icon: Icon(Icons.settings), onPressed: () {}),
          ],
        ),
        body: Row(
          children: [
            // bagian menu
            Flexible(
              flex: 2,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: AppBar(
                    toolbarHeight: 80,
                    backgroundColor: Colors.yellow.shade300,
                    title: Text("Menu"),
                    actions: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.search))
                    ],
                  ),
                ),
                body: Stack(
                  children: [
                    Container(
                      color: Colors.yellow.shade50,
                      padding: const EdgeInsets.only(bottom: 60),
                      child: TabBarView(
                        children: [
                          builtdDrafMenu(),
                          builtdDrafMenu(),
                          builtdDrafMenu(),
                          builtdDrafMenu(),
                          builtdDrafMenu(),
                          builtdDrafMenu(),
                          builtdDrafMenu(),
                          builtdDrafMenu(),
                          builtdDrafMenu(),
                          builtdDrafMenu(),
                        ],
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Container(
                        color: Colors.yellow.shade100,
                        height: 60,
                        child: TabBar(
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          unselectedLabelColor: Colors.orange.shade800,
                          labelColor: Colors.brown,
                          indicatorColor: Colors.brown,
                          tabs: [
                            Tab(text: "halo 1"),
                            Tab(text: "halo 2"),
                            Tab(text: "halo 3"),
                            Tab(text: "halo 4"),
                            Tab(text: "halo 5"),
                            Tab(text: "halo 6"),
                            Tab(text: "halo 7"),
                            Tab(text: "halo 8"),
                            Tab(text: "halo 9"),
                            Tab(text: "halo 10"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //  bagian bill
            Flexible(
              flex: 1,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: AppBar(
                    toolbarHeight: 80,
                    backgroundColor: Colors.grey.shade200,
                    title: Text("bill"),
                    actions: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.print)),
                    ],
                  ),
                ),
                body: Stack(
                  children: [
                    ListView.builder(
                      padding: EdgeInsets.only(bottom: 60),
                      itemCount: biling.length,
                      itemBuilder: (context, index) {
                        return ClipRect(
                          child: Dismissible(
                            confirmDismiss: (direction) {
                              if (direction == DismissDirection.endToStart) {
                                // menu hapus
                                return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("condirm"),
                                      content: Text("apa iyha"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(false);
                                            },
                                            child: Text("no")),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(true);
                                              setState(() {
                                                biling.removeAt(index);
                                                indexing.removeAt(index);
                                                print(direction);
                                              });
                                            },
                                            child: Text("yes"))
                                      ],
                                    );
                                  },
                                );
                              } else {
                                // menu edit
                                return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("condirm"),
                                      content: Text("apa iyha"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(false);
                                            },
                                            child: Text("no")),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(true);
                                              setState(() {
                                                biling.removeAt(index);
                                                indexing.removeAt(index);
                                                print(direction);
                                              });
                                            },
                                            child: Text("yes"))
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            key: Key(indexing.toString()),
                            onDismissed: (direction) {
                              setState(() {
                                biling.removeAt(index);
                                indexing.removeAt(index);
                              });
                            },
                            background: Container(
                              color: Colors.blue,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                            secondaryBackground: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                "Nasi Goreng Pake Kuah hahaha",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 13),
                              ),
                              subtitle: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (biling[index] > 1) {
                                        setState(() {
                                          biling[index]--;
                                        });
                                      }
                                    },
                                    icon: Icon(Icons.remove),
                                    iconSize: 15,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      biling[index].toString(),
                                      maxLines: 1,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        biling[index]++;
                                      });
                                    },
                                    icon: Icon(Icons.add),
                                    iconSize: 15,
                                  ),
                                  Text("${54000 * biling[index]}")
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Container(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Container(
                        color: Colors.yellow.shade100,
                        height: 60,
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(90, 36),
                            padding: EdgeInsets.all(10),
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                          ),
                          child: Text("bayar"),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Bayar()));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GridView builtdDrafMenu() {
    return GridView.count(
      crossAxisCount: 4,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 2,
      children: buildMenu,
    );
  }

  List<Widget> get buildMenu {
    List<Widget> menu = [];
    for (var i = 0; i < 41; i++) {
      menu.add(ButtonMenu("Nasi goreng dengan kuah $i"));
    }
    return menu;
  }

  Container ButtonMenu(String buttonText) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(90, 36),
          padding: EdgeInsets.all(10),
          backgroundColor: Colors.orange.shade200,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.brown,
            fontSize: 14,
          ),
        ),
        onPressed: () {
          log("message" + count.toString());
          count++;
        },
      ),
    );
  }
}
