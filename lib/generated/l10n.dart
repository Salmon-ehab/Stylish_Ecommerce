// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Choose Products`
  String get titleOnBoarding1 {
    return Intl.message(
      'Choose Products',
      name: 'titleOnBoarding1',
      desc: '',
      args: [],
    );
  }

  /// `Make Payment`
  String get titleOnBoarding2 {
    return Intl.message(
      'Make Payment',
      name: 'titleOnBoarding2',
      desc: '',
      args: [],
    );
  }

  /// `Get Your Order`
  String get titleOnBoarding3 {
    return Intl.message(
      'Get Your Order',
      name: 'titleOnBoarding3',
      desc: '',
      args: [],
    );
  }

  /// `Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.`
  String get subTitleOnboarding1 {
    return Intl.message(
      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      name: 'subTitleOnboarding1',
      desc: '',
      args: [],
    );
  }

  /// `Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.`
  String get subTitleOnboarding2 {
    return Intl.message(
      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      name: 'subTitleOnboarding2',
      desc: '',
      args: [],
    );
  }

  /// `Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.`
  String get subTitleOnboarding3 {
    return Intl.message(
      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      name: 'subTitleOnboarding3',
      desc: '',
      args: [],
    );
  }

  /// `skip`
  String get skip {
    return Intl.message('skip', name: 'skip', desc: '', args: []);
  }

  /// `Prev`
  String get prev {
    return Intl.message('Prev', name: 'prev', desc: '', args: []);
  }

  /// `Next`
  String get Next {
    return Intl.message('Next', name: 'Next', desc: '', args: []);
  }

  /// `Get Started`
  String get GetStarted {
    return Intl.message('Get Started', name: 'GetStarted', desc: '', args: []);
  }

  /// `You want Authentic, here you go!`
  String get getStartTitle1 {
    return Intl.message(
      'You want Authentic, here you go!',
      name: 'getStartTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Find it here, buy it now!`
  String get getStartTitle2 {
    return Intl.message(
      'Find it here, buy it now!',
      name: 'getStartTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Create Account `
  String get createAccount {
    return Intl.message(
      'Create Account ',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password `
  String get password {
    return Intl.message('Password ', name: 'password', desc: '', args: []);
  }

  /// `Welcome Back!`
  String get signInWelcomText {
    return Intl.message(
      'Welcome Back!',
      name: 'signInWelcomText',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get signUpWelcomeText {
    return Intl.message(
      'Create an account',
      name: 'signUpWelcomeText',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// ` By clicking the `
  String get Byclickingthe {
    return Intl.message(
      ' By clicking the ',
      name: 'Byclickingthe',
      desc: '',
      args: [],
    );
  }

  /// ` button, you agree to the public offer`
  String get youAgreeto {
    return Intl.message(
      ' button, you agree to the public offer',
      name: 'youAgreeto',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter user name!`
  String get validateName {
    return Intl.message(
      'Please Enter user name!',
      name: 'validateName',
      desc: '',
      args: [],
    );
  }

  /// `User name must be at least 4 characters.`
  String get validateName2 {
    return Intl.message(
      'User name must be at least 4 characters.',
      name: 'validateName2',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter password!`
  String get validatePassword {
    return Intl.message(
      'Please Enter password!',
      name: 'validatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 5 characters.`
  String get validatePassword2 {
    return Intl.message(
      'Password must be at least 5 characters.',
      name: 'validatePassword2',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter confirm password!`
  String get validateConfirmPassword {
    return Intl.message(
      'Please Enter confirm password!',
      name: 'validateConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password must be at least 5 characters.`
  String get validateConfirmPawword2 {
    return Intl.message(
      'Confirm Password must be at least 5 characters.',
      name: 'validateConfirmPawword2',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Title!`
  String get validateTitle {
    return Intl.message(
      'Please Enter Title!',
      name: 'validateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Title must be at least 5 characters.`
  String get validateTitle2 {
    return Intl.message(
      'Title must be at least 5 characters.',
      name: 'validateTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Description!`
  String get ValidateDesc {
    return Intl.message(
      'Please Enter Description!',
      name: 'ValidateDesc',
      desc: '',
      args: [],
    );
  }

  /// `Description must be at least 5 characters.`
  String get ValidateDesc2 {
    return Intl.message(
      'Description must be at least 5 characters.',
      name: 'ValidateDesc2',
      desc: '',
      args: [],
    );
  }

  /// `Email cannot be empty.`
  String get validateEmailEmpty {
    return Intl.message(
      'Email cannot be empty.',
      name: 'validateEmailEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address.`
  String get validateEmailInvalid {
    return Intl.message(
      'Please enter a valid email address.',
      name: 'validateEmailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Phone number cannot be empty.`
  String get validatePhoneEmpty {
    return Intl.message(
      'Phone number cannot be empty.',
      name: 'validatePhoneEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must contain digits only.`
  String get validatePhoneDigitsOnly {
    return Intl.message(
      'Phone number must contain digits only.',
      name: 'validatePhoneDigitsOnly',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number length.`
  String get validatePhoneLength {
    return Intl.message(
      'Please enter a valid phone number length.',
      name: 'validatePhoneLength',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
