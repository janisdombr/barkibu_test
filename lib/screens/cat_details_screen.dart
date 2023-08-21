import 'package:flutter/material.dart';
import 'package:barkibu_test/models/cat_model.dart';

class CatDetailsScreen extends StatelessWidget {
  const CatDetailsScreen({super.key, required this.cat, required this.imagePathUrl});
  final String imagePathUrl;
  final Cat cat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Cat details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.center,
                //width: double.infinity,
                constraints: BoxConstraints(
                  //maxHeight: 500,
                ),
                child: Image.network('$imagePathUrl/${cat.id}', fit: BoxFit.fitWidth,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator(backgroundColor: Colors.deepPurple));
                },)),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Owner: ${cat.owner}', textAlign: TextAlign.start,),
                Text('Tags: ${cat.tags.join(', ')}', textAlign: TextAlign.start),
                Text('Created at: ${cat.createdAt}', textAlign: TextAlign.start),
                Text('Updated at: ${cat.updatedAt}', textAlign: TextAlign.start),
              ],
            )),
          ],
        ),
      ),
    );
  }
}