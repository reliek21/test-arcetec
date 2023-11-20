import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test_arcetec/config/theme/app_theme.dart';
import 'package:test_arcetec/presentation/routes/routes.dart';

Future<void> main() async {
	WidgetsFlutterBinding.ensureInitialized();

	// Todo: improve this with enviroments variables
	await Supabase.initialize(
		url: 'https://qbhccdkxxpffxjlhxhas.supabase.co',
		anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFiaGNjZGt4eHBmZnhqbGh4aGFzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA0NTA3NDAsImV4cCI6MjAxNjAyNjc0MH0.QeFJ0v00SXOkGCXT3vj1Yo3su5JarA_m84sf5aL56D0'
	);

	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Arcetec',
			theme: AppTheme.getTheme(),
      routes: mainRoutes(),
      initialRoute: MainRoutes.home,
    );
  }
}
