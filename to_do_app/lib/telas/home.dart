// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/add_task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'categories.dart';
import 'tasks.dart';

//import 'package:to_do_app/widgets/add_task.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController(initialPage: 0);
  late int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        elevation: 16,
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc('BqqXwj7eIvqaSmqp4DSZ')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var userData = snapshot.data!.data();
              var userDataMap = userData as Map<String, dynamic>;
              var email = userDataMap['email'];
              var name = userDataMap['name'];
              var password = userDataMap['password'];
              // var email = userData!['email'];
              return Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white70,
                ),
                child: Column(
                  //icon
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 30, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Olá, $name!',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontFamily: 'Space Grotesk',
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 88, 24, 69),
                                ),
                          ),
                          Text(
                            email,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 12,
                                  fontFamily: 'Space Grotesk',
                                  color: Color.fromARGB(183, 88, 24, 69),
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 30, 0, 10),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        //onTap: () async {
                        //   context.pushNamed('Conta');
                        //},
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.account_box_outlined,
                              color: Color.fromARGB(255, 88, 24, 69),
                              //color: FlutterFlowTheme.of(context).secondaryText,
                              size: 30,
                            ),
                            Text(
                              'Minha Conta',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontFamily: 'Space Grotesk',
                                    color: Color.fromARGB(255, 88, 24, 69),
                                    //color: FlutterFlowTheme.of(context).primaryBackground,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.logout,
                            color: Color.fromARGB(255, 88, 24, 69),
                            // color: FlutterFlowTheme.of(context).secondaryText,
                            size: 30,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              'Log Out',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontFamily: 'Space Grotesk',
                                    color: Color.fromARGB(255, 88, 24, 69),
                                    //color: FlutterFlowTheme.of(context).primaryBackground,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 110,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              iconSize: 25,
              onPressed: () {
                //Scaffold.of(context).openDrawer();
                _scaffoldKey.currentState!.openDrawer();
              }, //openDrawer
              icon: Icon(
                Icons.menu_rounded,
                color: Color.fromARGB(255, 255, 88, 51),
              ),
            ),
            Text('To-Do App'),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(CupertinoIcons.calendar)),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AddTask(title: 'title');
              });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        //notchMargin: 6.0,
        //clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight /*+ 6.*/,
          padding: EdgeInsets.only(bottom: 0.0),
          child: BottomNavigationBar(
            elevation: 3,
            currentIndex: selectedIndex,
            selectedItemColor: Color.fromARGB(255, 88, 24, 69),
            unselectedItemColor: Color.fromARGB(255, 144, 12, 63),
            onTap: (index) {
              setState(() {
                selectedIndex = index;
                pageController.jumpToPage(index);
              });
            },
            iconSize: 20,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.square_list),
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.tag),
                label: 'Categories',
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        children: const <Widget>[
          Center(
            child: Tasks(),
          ),
          Center(
            child: Categories(),
          ),
        ],
      ),
    );
  }
}
/*
//função para aumentar/diminuir a quantidade de tasks por categoria
Future<void> updateCategoryQuant() async {
  CollectionReference categoriesRef =
      FirebaseFirestore.instance.collection('category');
  CollectionReference taskRef = FirebaseFirestore.instance.collection('task');
  QuerySnapshot taskSnapshot = await taskRef.get();
  int taskCount = taskSnapshot.docs.length;
  // Atualizando o campo "quant" de cada documento na coleção "category"
  QuerySnapshot categorySnapshot = await categoriesRef.get();
  categorySnapshot.docs.forEach((categoryDoc) async {
    // Obtendo o valor atual do campo "quant"
   int currentQuant = categoryDoc.data()['quant'] ?? 0;

    // Novo valor para o campo "quant" (aumenta ou diminui com base na quantidade de tarefas)
    int newQuant = currentQuant + taskCount;

    // Atualizando o documento na coleção "category" com o novo valor de "quant"
    await categoriesRef.doc(categoryDoc.id).update({'quant': newQuant});
  });
}
*/