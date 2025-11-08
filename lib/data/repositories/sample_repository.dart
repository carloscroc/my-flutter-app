class SampleRepository {
  Future<String> fetchGreeting() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return 'Hello from repository';
  }
}
