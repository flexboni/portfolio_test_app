import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/constants.dart';
import '../providers/auth_notifier.dart';
import '../states/auth_state.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  String? _validateId(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.errorUserIdEmpty;
    }
    
    // 영문 7자 이상
    if (value.length < 7) {
      return Strings.errorUserIdTooShort;
    }
    
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return Strings.errorUserIdEnglishOnly;
    }
    
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.errorPasswordEmpty;
    }
    
    // 총 10자 이상
    if (value.length < 10) {
      return Strings.errorPasswordTooShortSignup;
    }
    
    // 영문 대문자 포함
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return Strings.errorPasswordNoUppercase;
    }
    
    // 영문 소문자 포함
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return Strings.errorPasswordNoLowercase;
    }
    
    // 숫자 포함
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return Strings.errorPasswordNoNumber;
    }
    
    // 특수문자 포함
    if (!RegExp(r'[!@#$%^&*(),.?\":{}|<>]').hasMatch(value)) {
      return Strings.errorPasswordNoSpecial;
    }
    
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.errorPhoneEmpty;
    }
    
    // 한국 핸드폰 번호 형식 (010-0000-0000 또는 01000000000)
    if (!RegExp(r'^010-?[0-9]{4}-?[0-9]{4}$').hasMatch(value)) {
      return Strings.errorPhoneInvalid;
    }
    
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.errorEmailEmpty;
    }
    
    // 이메일 형식
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
      return Strings.errorInvalidEmail;
    }
    
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      next.whenOrNull(
        authenticated: (_) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(Strings.successSignup),
                backgroundColor: Colors.green,
              ),
            );
            context.go('/main');
          }
        },
        error: (failure) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(failure.toString()),
                backgroundColor: AppColors.errorColor,
              ),
            );
          }
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.signup),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  Strings.signup,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _idController,
                  decoration: const InputDecoration(
                    labelText: Strings.userIdHint,
                    border: OutlineInputBorder(),
                    helperText: Strings.userIdHelper,
                  ),
                  validator: _validateId,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: Strings.password,
                    border: OutlineInputBorder(),
                    helperText: Strings.passwordHelper,
                  ),
                  obscureText: true,
                  validator: _validatePassword,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: Strings.phone,
                    border: OutlineInputBorder(),
                    helperText: Strings.phoneHelper,
                  ),
                  keyboardType: TextInputType.phone,
                  validator: _validatePhone,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: Strings.email,
                    border: OutlineInputBorder(),
                    helperText: Strings.emailHelper,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: authState.maybeWhen(
                      loading: () => null,
                      orElse: () => () async {
                        if (_formKey.currentState!.validate()) {
                          await ref.read(authNotifierProvider.notifier).signup(
                            userId: _idController.text,
                            password: _passwordController.text,
                            email: _emailController.text,
                            phone: _phoneController.text,
                          );
                        }
                      },
                    ),
                    child: authState.maybeWhen(
                      loading: () => const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      ),
                      orElse: () => const Text(Strings.signup),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    context.go('/login');
                  },
                  child: const Text(Strings.alreadyHaveAccount),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}