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
    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(value)) {
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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
          onPressed: () => context.go('/login'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person_add,
                          size: 40,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            Strings.signup,
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '새로운 계정을 만들어 포트폴리오를 시작하세요',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: Colors.grey[600]),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildFormField(
                      controller: _idController,
                      labelText: Strings.userIdHint,
                      helperText: Strings.userIdHelper,
                      prefixIcon: Icons.person,
                      validator: _validateId,
                    ),
                    const SizedBox(height: 20),
                    _buildFormField(
                      controller: _passwordController,
                      labelText: Strings.password,
                      helperText: Strings.passwordHelper,
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      validator: _validatePassword,
                    ),
                    const SizedBox(height: 20),
                    _buildFormField(
                      controller: _phoneController,
                      labelText: Strings.phone,
                      helperText: Strings.phoneHelper,
                      prefixIcon: Icons.phone,
                      keyboardType: TextInputType.phone,
                      validator: _validatePhone,
                    ),
                    const SizedBox(height: 20),
                    _buildFormField(
                      controller: _emailController,
                      labelText: Strings.email,
                      helperText: Strings.emailHelper,
                      prefixIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: _validateEmail,
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: authState.maybeWhen(
                          loading: () => null,
                          orElse: () => () async {
                            if (_formKey.currentState!.validate()) {
                              await ref
                                  .read(authNotifierProvider.notifier)
                                  .signup(
                                    userId: _idController.text,
                                    password: _passwordController.text,
                                    email: _emailController.text,
                                    phone: _phoneController.text,
                                  );
                            }
                          },
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
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
                          orElse: () => Text(
                            Strings.signup,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          context.go('/login');
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primaryColor,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 24,
                          ),
                        ),
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                            children: [
                              const TextSpan(text: '이미 계정이 있으신가요? '),
                              TextSpan(
                                text: '로그인',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String labelText,
    required String helperText,
    required IconData prefixIcon,
    required String? Function(String?) validator,
    bool obscureText = false,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        helperText: helperText,
        helperStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.errorColor, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
