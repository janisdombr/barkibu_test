import 'package:barkibu_test/models/cat_model.dart';
import 'package:barkibu_test/repositories/cat_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Cats tests', () {
    /// Test for Cat model
    test('Cat model test', () async {
      const String now = 'Fri Sep 02 2022 20:19:48 GMT+0000 (Coordinated Universal Time)';
      Cat cat = const Cat(
        id: 'id',
        tags: ['tag1', 'tag2'],
        owner: 'owner',
        createdAt: now,
        updatedAt: now,
      );
      expect(cat.id, 'id');
      expect(cat.tags, ['tag1', 'tag2']);
      expect(cat.owner, 'owner');
      expect(cat.createdAt, now);
      expect(cat.updatedAt, now);
    });
    /// Test for CatRepository class
    test('CatRepository test', () async {
      CatRepository catRepository = CatRepository();
      List<Cat> cats = await catRepository.getCats();
      expect(cats.length, 10);
    });
  });
}