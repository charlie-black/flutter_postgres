

import 'package:postgres/postgres.dart';

void main(List<String> arguments) async {
  final conn = PostgreSQLConnection(
    'localhost',
    5432,
    'StudentData',
    username: 'postgres',
    password: 'baraza',
  );
  await conn.open();

  print('Connected to Postgres database...');




  // Create data
  await conn.query('''
    INSERT INTO student_info (student_name,reg_no,major,grade, average)
    VALUES ('ROMAN HAWI','ROM154','SOFTWARE ENGINEERING','{"Computer Graphics":"70","Boolean Algebra":"77"}','73.5')
  ''');

  // Read data
  var results = await conn.query('SELECT * from student_info');
  print(results);

  for (var row in results) {
    print('''
    ===
    student_name: ${row[0]}
    reg_no: ${row[1]}
    major: ${row[2]}
    grade: ${row[3]}
    average: ${row[4]}
    ===
    ''');
  }

await conn.close();
// }
}