import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/providers/auth.dart';

import '../../core/app_methods.dart';
import '../shared/custom_button.dart';
import '../shared/custom_text_form_field.dart';

class SignInScreen extends StatefulHookConsumerWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = useTextEditingController();
    final TextEditingController password = useTextEditingController();
    final TextEditingController name = useTextEditingController();

    final ValueNotifier<bool> isLoading = useState(false);
    final ValueNotifier<bool> isGoogleLoading = useState(false);
    final ValueNotifier<bool> isSignIn = useState(true);
    // final ValueNotifier<bool> obscureText = useState(true);
    final auth = ref.read(authProvider.notifier);

    // formKey using hooks and useMemoized
    final GlobalKey<FormState> formKey = useMemoized(
      () => GlobalKey<FormState>(),
      [context],
    );

    Future<void> signInWithGoogle() async {
      isGoogleLoading.value = true;
      await auth.signInWithGoogle(
        onError: (error) {
          AppMethod.showPopUp(
            context: context,
            title: 'Sign In Error',
            content: error,
          );
        },
      );
      if (mounted) isGoogleLoading.value = false;
    }

    Future<void> onFormSubmitted() async {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;
        if (isSignIn.value) {
          await auth.signInWithEmail(
            email: email.text,
            password: password.text,
            onError: (error) {
              AppMethod.showPopUp(
                context: context,
                title: 'Sign In Error',
                content: error,
              );
            },
          );
        } else {
          await auth.signUpWithEmail(
            email: email.text,
            password: password.text,
            name: name.text,
            onError: (error) {
              AppMethod.showPopUp(
                context: context,
                title: 'Sign In Error',
                content: error,
              );
            },
          );
        }
        isLoading.value = false;
      }
    }

    void toggleFormType() {
      formKey.currentState!.reset();
      isSignIn.value = !isSignIn.value;
    }

    final String buttonString = isSignIn.value ? 'Sign In' : 'Sign Up';
    final String toggleString =
        isSignIn.value ? 'Create an account' : 'Sign In';

    final String questionString =
        isSignIn.value ? 'Don\'t have an account?' : 'Already have an account?';

    return Scaffold(
      appBar: AppBar(title: Text(buttonString)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimatedContainer(
                  constraints: BoxConstraints(
                    maxHeight: isSignIn.value ? 0 : 80,
                  ),
                  duration: const Duration(milliseconds: 300),
                  child: CustomTextFormField(
                    controller: name,
                    label: 'Name',
                    validator: isSignIn.value ? AppMethod.nameValidator : null,
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: email,
                  label: 'Email',
                  validator: AppMethod.emailValidator,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: password,
                  label: 'Password',
                  validator: AppMethod.passwordValidator,
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  onPressed: onFormSubmitted,
                  child: isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          buttonString,
                          style: const TextStyle(fontSize: 17),
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(questionString),
                    TextButton(
                      onPressed: toggleFormType,
                      child: Text(
                        toggleString,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('OR'),
              ),
              Expanded(child: Divider()),
            ],
          ),
          const SizedBox(height: 24),
          CustomButton(
            onPressed: signInWithGoogle,
            color: Colors.transparent,
            borderColor: Colors.grey,
            child: isGoogleLoading.value 
                ? const CircularProgressIndicator(color: Colors.white)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.person),
                      SizedBox(width: 8),
                      Text(
                        'Sign In With Google',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
