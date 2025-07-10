import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/presentation/screens/navigation_view.dart';
import 'package:construct/presentation/screens/sign_up/sign_up_builder.dart';
import 'package:construct/services/api/auth_service.dart';
import 'package:construct/services/api/user_service.dart';
import 'package:construct/services/token/token_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  static const routeName = '/sign_up';

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  Future<String?> createUser(UserCreate createUser) async {
    final authService = ref.read(authServiceProvider);
    final tokenService = ref.read(tokenStorageServiceProvider);
    try {
      await ref.read(userServiceProvider).createUser(createUser);
      final token =
          await authService.login(createUser.phone, createUser.password);
      tokenService.saveTokens(token["access_token"], token["refresh_token"]);
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SignUpBuilder(
              onSubmit: (user) {
                createUser(user).then((value) {
                  if (value != null) return value;
                  if (context.mounted) {
                    Navigator.of(context)
                        .pushReplacementNamed(NavigationView.routeName);
                  }
                });
                return null;
              },
            ),
          ),
        ),
      ),
    );
  }
}
