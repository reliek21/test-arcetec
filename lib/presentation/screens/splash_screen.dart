import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test_arcetec/main.dart';
import 'package:test_arcetec/presentation/routes/routes.dart';

class SplashScreen extends StatefulWidget {
	const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
	@override
	void initState() {
		super.initState();
		_redirect();
	}

	Future<void> _redirect() async {
		await Future<dynamic>.delayed(Duration.zero);

		if (!mounted) return;
		
		final Session? session = supabase.auth.currentSession;

		if (session != null) {
			Navigator.of(context).pushReplacementNamed(MainRoutes.home);
		} else {
			Navigator.of(context).pushReplacementNamed(MainRoutes.login);
		}
	}

	@override
	Widget build(BuildContext context) {
		return const Scaffold(
			body: Center(
				child: CircularProgressIndicator(),
			),
		);
	}
}
