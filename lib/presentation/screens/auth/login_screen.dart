import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test_arcetec/common/colors/colors_common.dart';
import 'package:test_arcetec/common/typography/typography_common.dart';
import 'package:test_arcetec/main.dart';
import 'package:test_arcetec/presentation/routes/routes.dart';
import 'package:test_arcetec/presentation/widgets/custom_text_form_field_widget.dart';
import 'package:test_arcetec/presentation/widgets/outline_button_widget.dart';

class LoginScreen extends StatefulWidget {
	const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
	late bool isLoading = false;
	late bool redirecting = false;

	final TextEditingController emailController = TextEditingController();
	final TextEditingController passwordController = TextEditingController();

	late final StreamSubscription<AuthState> authStateSubscription;

	Future<void> signIn() async {
		try {
		  setState(() => isLoading = true);

			await supabase.auth.signInWithOtp(
				email: emailController.text.trim(),
				emailRedirectTo: 'io.supabase.flutterquickstart://login-callback/'
			);

			if (mounted) {
				ScaffoldMessenger.of(context).showSnackBar(
					const SnackBar(content: Text('Verifica tu email para el iniciar por el link!'))
				);

				emailController.clear();
			}
		} on AuthException catch (error) {
			SnackBar(
				content: Text(error.message),
				backgroundColor: Theme.of(context).colorScheme.error,
			);
		} catch (error) {
			SnackBar(
				content: const Text('Unexpected error ocurred'),
				backgroundColor: Theme.of(context).colorScheme.error,
			);
		} finally {
			if (mounted) setState(() => isLoading = false);
		}
	}

	@override
	void initState() {
		authStateSubscription = supabase.auth.onAuthStateChange.listen((AuthState data) {
			if (redirecting) return;

			final Session? session = data.session;

			if (session != null) {
				redirecting = true;
				Navigator.of(context).pushReplacementNamed(MainRoutes.home);
			}
		});
		super.initState();
	}

	@override
	void dispose() {
		emailController.dispose();
		passwordController.dispose();
		authStateSubscription.cancel();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: ArcetecColors.secondaryColor,
			body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: true),
        child: SingleChildScrollView(
          child: Container(
						margin: const EdgeInsets.symmetric(horizontal: 16.0),
						height: MediaQuery.of(context).size.height,
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							crossAxisAlignment: CrossAxisAlignment.center,
							children: <Widget>[
								Text('Iniciar Sesion', style: ArcetecTypography.extraHeading(
									color: ArcetecColors.primaryColor
								)),
								const SizedBox(height: 20.0),
								Text(
									'Inicia sesión para',
									style: ArcetecTypography.semiExtraHeading(
										color: ArcetecColors.primaryColor
									),
								),
								Text(
									'registrar un producto',
									style: ArcetecTypography.semiExtraHeading(
										color: ArcetecColors.primaryColor
									),
								),

								const SizedBox(height: 44.0),
								CustomTextFormFieldWidget(
									hintText: 'Correo',
									controller: emailController
								),
								const SizedBox(height: 26.0),
								CustomTextFormFieldWidget(
									hintText: 'Contraseña',
									controller: passwordController
								),
								const SizedBox(height: 44.0),
								OutlineButtonWidget(
									fillButton: true,
									text: isLoading ? 'Cargando' : 'Iniciar Sesión',
									onPressed: isLoading ? null : signIn
								)
							],
						),
					)
				)
			)
		);
	}
}
