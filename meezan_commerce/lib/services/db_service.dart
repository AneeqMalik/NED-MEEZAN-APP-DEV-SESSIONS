import 'package:meezan_commerce/models/dogs_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Define a function that initializes the database
Future<Database> get database async {
  // Open the database and store the reference.
  return openDatabase(
    join(await getDatabasesPath(), 'dogs_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
}

// Define a function that inserts dogs into the database
Future<void> insertDog(Dog dog) async {
  // Get a reference to the database.
  final db = await database;

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'dogs',
    dog.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
