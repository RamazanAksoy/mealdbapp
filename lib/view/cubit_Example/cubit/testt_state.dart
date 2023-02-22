// ignore_for_file: public_member_api_docs, sort_constructors_first

class TestState {
  final bool? isLoading;
  final int? sayac;

  TestState({this.isLoading = false, this.sayac = 0});

  TestState copyWith({
    bool? isLoading,
    int? sayac,
  }) {
    return TestState(
      isLoading: isLoading ?? this.isLoading,
      sayac: sayac ?? this.sayac,
    );
  }
}
