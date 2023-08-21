import 'package:flutter/material.dart';

import '../models/cat_model.dart';
import '../repositories/cat_repository.dart';
import 'cat_details_screen.dart';

/// Screen for displaying list of cats
/// I use FutureBuilder to get data from API
/// and display it in ListView
/// with Image, owner name and button to expand item

class ListScreen extends StatelessWidget {
  ListScreen({super.key});
  final CatRepository catsRepo = CatRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Cat list'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child:
            FutureBuilder(
              future: catsRepo.getCats(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong'));
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                List<Cat> cats = snapshot.data!;
                return ListView.builder(
                  itemCount: cats.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 100,
                        child: Row(
                          children: [
                            Image.network(catsRepo.imageUrlPAth+cats[index].id, width: 100, height: 100, fit: BoxFit.fill),
                            Expanded(child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text( (cats[index].owner == "null" ? "No owner" : cats[index].owner)),
                            )),
                            // button to expand item
                            IconButton(
                              onPressed: () {
                                openCatDetails(cats[index], context);},
                                icon: const Icon(Icons.arrow_forward_ios)
                            ),
                          ],
                        )),
                    );
                    },
                );
              }
            )
          )
        ]
      ),
    );
  }

  void openCatDetails(Cat cat, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CatDetailsScreen(cat: cat, imagePathUrl: catsRepo.imageUrlPAth)),
    );
  }
}
