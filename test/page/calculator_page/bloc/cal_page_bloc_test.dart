import 'package:test/test.dart';

void main() {
  group("Sample Calculator Bloc Test", () {
    late CalPageBloc bloc;
    
    // Before each test
    setup(() {});
    
    // After each test
    tearDown(() {});

    test("Simple login", () {});

    blocTest<CalPageBloc, CalPageState>(
      "".
      build: () => bloc,
      act: (bloc) {

      },
      expect: () {

      },
    )
  })
}