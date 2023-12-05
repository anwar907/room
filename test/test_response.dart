import 'package:flutter_test/flutter_test.dart';
import 'package:house/src/data/provider/providers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('sample data response', () async {
    final dataProviders = DataProviders();

    var data = await dataProviders.fetchData();

    print(data.entries![0].hotelName);
  });
}
