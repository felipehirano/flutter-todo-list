import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list/src/repositories/todo_repository.dart';

class MockDio extends Mock implements Dio{}

void main() {
  group('TodoRepository', () {
    late TodoRepository repository;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      repository = TodoRepository(mockDio);
    });

    test('fetchTodos should return a list of TodoModel', () async {
      // Arrange
      const url = '';

      when(() => mockDio.get('https://jsonplaceholder.typicode.com/todos')).thenAnswer(
        (_) async => Response(
          data: jsonDecode(jsonData),
          statusCode: 200,
          requestOptions: RequestOptions(path: url), 
        ),
      );

      // Act
      final todos = await repository.fetchTodos();

      // Assert
      expect(todos.length, 10);
      expect(todos[0].title, 'delectus aut autem');
    });
  });
}

String jsonData = '''
  [
    {
      "userId": 1,
      "id": 1,
      "title": "delectus aut autem",
      "completed": false
    },
    {
      "userId": 1,
      "id": 2,
      "title": "quis ut nam facilis et officia qui",
      "completed": false
    },
    {
      "userId": 1,
      "id": 3,
      "title": "fugiat veniam minus",
      "completed": false
    },
    {
      "userId": 1,
      "id": 4,
      "title": "et porro tempora",
      "completed": true
    },
    {
      "userId": 1,
      "id": 5,
      "title": "laboriosam mollitia et enim quasi adipisci quia provident illum",
      "completed": false
    },
    {
      "userId": 1,
      "id": 6,
      "title": "qui ullam ratione quibusdam voluptatem quia omnis",
      "completed": false
    },
    {
      "userId": 1,
      "id": 7,
      "title": "illo expedita consequatur quia in",
      "completed": false
    },
    {
      "userId": 1,
      "id": 8,
      "title": "quo adipisci enim quam ut ab",
      "completed": true
    },
    {
      "userId": 1,
      "id": 9,
      "title": "molestiae perspiciatis ipsa",
      "completed": false
    },
    {
      "userId": 1,
      "id": 10,
      "title": "illo est ratione doloremque quia maiores aut",
      "completed": true
    }
  ]
''';