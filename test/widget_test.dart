import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/app/app.dart';

void main(){
  testWidgets("Hello world test", (WidgetTester tester) async{

    await tester.pumpWidget(const MyApp());
    
    expect(find.byType(Container), findsOneWidget);
    expect(find.text("Hello World"), findsOneWidget);

  });
}