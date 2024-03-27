import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final fireStore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: fireStore.collection('categories').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('No categories to display');
          } else if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                Color categoryColor = const Color.fromARGB(255, 199, 0, 56);
                var category = data['name'];
                if (category == 'Work') {
                  categoryColor = const Color.fromARGB(255, 144, 12, 63);
                } else if (category == 'School') {
                  categoryColor = const Color.fromARGB(255, 255, 88, 51);
                }
                return Container(
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 88, 24, 69),
                        blurRadius: 5.0,
                        offset: Offset(0, 5), // shadow direction: bottom right
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 20,
                      height: 20,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: categoryColor,
                      ),
                    ),
                    title: Text(data['name']),
                    subtitle: Text(data['quant']),
                    isThreeLine: true,
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
    /*const Center(
      child: Text('Categories text'),
    );*/
  }
}
