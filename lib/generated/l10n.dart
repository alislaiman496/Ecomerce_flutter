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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Ecommerce`
  String get ecommerce {
    return Intl.message(
      'Ecommerce',
      name: 'ecommerce',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailIsRequired {
    return Intl.message(
      'Email is required',
      name: 'emailIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid Email`
  String get enterValidEmail {
    return Intl.message(
      'Enter valid Email',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password`
  String get pleaseEnterPassword {
    return Intl.message(
      'Please enter password',
      name: 'pleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter a hard password`
  String get enterAHardPassword {
    return Intl.message(
      'Enter a hard password',
      name: 'enterAHardPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get phoneNumberIsRequired {
    return Intl.message(
      'Phone number is required',
      name: 'phoneNumberIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid Phone number`
  String get enterValidPhoneNumber {
    return Intl.message(
      'Enter valid Phone number',
      name: 'enterValidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your first name`
  String get enterYourFirstName {
    return Intl.message(
      'Enter your first name',
      name: 'enterYourFirstName',
      desc: '',
      args: [],
    );
  }

  /// `First Name Should not be Empty`
  String get firstNameShouldNotBeEmpty {
    return Intl.message(
      'First Name Should not be Empty',
      name: 'firstNameShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Last Name Should not be Empty`
  String get lastNameShouldNotBeEmpty {
    return Intl.message(
      'Last Name Should not be Empty',
      name: 'lastNameShouldNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your last name`
  String get enterYourLastName {
    return Intl.message(
      'Enter your last name',
      name: 'enterYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `E-mail address`
  String get e_mailAddress {
    return Intl.message(
      'E-mail address',
      name: 'e_mailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your mobile number`
  String get enterYourMobileNumber {
    return Intl.message(
      'Enter your mobile number',
      name: 'enterYourMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password*`
  String get password {
    return Intl.message(
      'Password*',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password*`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password*',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get confirmYourPassword {
    return Intl.message(
      'Confirm your password',
      name: 'confirmYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please Re-Enter your password`
  String get pleaseRe_EnterYourPassword {
    return Intl.message(
      'Please Re-Enter your password',
      name: 'pleaseRe_EnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please Re-Enter the same password`
  String get pleaseRe_EnterTheSamePassword {
    return Intl.message(
      'Please Re-Enter the same password',
      name: 'pleaseRe_EnterTheSamePassword',
      desc: '',
      args: [],
    );
  }

  /// `I accept all terms and conditions.`
  String get iAcceptAllTermsAndConditions {
    return Intl.message(
      'I accept all terms and conditions.',
      name: 'iAcceptAllTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `You need to accept terms and conditions`
  String get youNeedToAcceptTermsAndConditions {
    return Intl.message(
      'You need to accept terms and conditions',
      name: 'youNeedToAcceptTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `This account is Logged in`
  String get thisAccountIsLoggedIn {
    return Intl.message(
      'This account is Logged in',
      name: 'thisAccountIsLoggedIn',
      desc: '',
      args: [],
    );
  }

  /// `Or create account using social media`
  String get orCreateAccountUsingSocialMedia {
    return Intl.message(
      'Or create account using social media',
      name: 'orCreateAccountUsingSocialMedia',
      desc: '',
      args: [],
    );
  }

  /// `Wrong Email please Enter a valid Email`
  String get wrongEmailPleaseEnterAValidEmail {
    return Intl.message(
      'Wrong Email please Enter a valid Email',
      name: 'wrongEmailPleaseEnterAValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Signing into your account`
  String get signingIntoYourAccount {
    return Intl.message(
      'Signing into your account',
      name: 'signingIntoYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Forget your password?`
  String get forgetYourPassword {
    return Intl.message(
      'Forget your password?',
      name: 'forgetYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Wrong Email You are not Logged in`
  String get wrongEmailYouAreNotLoggedIn {
    return Intl.message(
      'Wrong Email You are not Logged in',
      name: 'wrongEmailYouAreNotLoggedIn',
      desc: '',
      args: [],
    );
  }

  /// `Wrong Password`
  String get wrongPassword {
    return Intl.message(
      'Wrong Password',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don\'t have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\\\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Profile Page`
  String get profilePage {
    return Intl.message(
      'Profile Page',
      name: 'profilePage',
      desc: '',
      args: [],
    );
  }

  /// `Login Page`
  String get loginPage {
    return Intl.message(
      'Login Page',
      name: 'loginPage',
      desc: '',
      args: [],
    );
  }

  /// `Splash Screen`
  String get splashScreen {
    return Intl.message(
      'Splash Screen',
      name: 'splashScreen',
      desc: '',
      args: [],
    );
  }

  /// `Registration Page`
  String get registrationPage {
    return Intl.message(
      'Registration Page',
      name: 'registrationPage',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password Page`
  String get forgetPasswordPage {
    return Intl.message(
      'Forget Password Page',
      name: 'forgetPasswordPage',
      desc: '',
      args: [],
    );
  }

  /// `Verification Page`
  String get verificationPage {
    return Intl.message(
      'Verification Page',
      name: 'verificationPage',
      desc: '',
      args: [],
    );
  }

  /// `LogOut Page`
  String get logOutPage {
    return Intl.message(
      'LogOut Page',
      name: 'logOutPage',
      desc: '',
      args: [],
    );
  }

  /// `Mr.`
  String get mr {
    return Intl.message(
      'Mr.',
      name: 'mr',
      desc: '',
      args: [],
    );
  }

  /// `Engineering`
  String get engineering {
    return Intl.message(
      'Engineering',
      name: 'engineering',
      desc: '',
      args: [],
    );
  }

  /// `User Information`
  String get userInformation {
    return Intl.message(
      'User Information',
      name: 'userInformation',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Syria`
  String get syria {
    return Intl.message(
      'Syria',
      name: 'syria',
      desc: '',
      args: [],
    );
  }

  /// `About Me`
  String get aboutMe {
    return Intl.message(
      'About Me',
      name: 'aboutMe',
      desc: '',
      args: [],
    );
  }

  /// `This is a about me link and you can know about me in this section.`
  String get thisIsAboutMeLink {
    return Intl.message(
      'This is a about me link and you can know about me in this section.',
      name: 'thisIsAboutMeLink',
      desc: '',
      args: [],
    );
  }

  /// `Jewelery`
  String get jewelery {
    return Intl.message(
      'Jewelery',
      name: 'jewelery',
      desc: '',
      args: [],
    );
  }

  /// `Electronics`
  String get electronics {
    return Intl.message(
      'Electronics',
      name: 'electronics',
      desc: '',
      args: [],
    );
  }

  /// `Men\'s Clothing`
  String get mensClothing {
    return Intl.message(
      'Men\\\'s Clothing',
      name: 'mensClothing',
      desc: '',
      args: [],
    );
  }

  /// `Women\'s Clothing`
  String get womensClothing {
    return Intl.message(
      'Women\\\'s Clothing',
      name: 'womensClothing',
      desc: '',
      args: [],
    );
  }

  /// `Product Page`
  String get productPage {
    return Intl.message(
      'Product Page',
      name: 'productPage',
      desc: '',
      args: [],
    );
  }

  /// `This code will expired in  `
  String get thisCodeWillBeExpiredIn {
    return Intl.message(
      'This code will expired in  ',
      name: 'thisCodeWillBeExpiredIn',
      desc: '',
      args: [],
    );
  }

  /// `We sent your code to`
  String get weSentYourCodeTo {
    return Intl.message(
      'We sent your code to',
      name: 'weSentYourCodeTo',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter the PinCode`
  String get pleaseEnterThePinCode {
    return Intl.message(
      'Please Enter the PinCode',
      name: 'pleaseEnterThePinCode',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Pin is incorrect`
  String get pinIsIncorrect {
    return Intl.message(
      'Pin is incorrect',
      name: 'pinIsIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Oops...`
  String get oops {
    return Intl.message(
      'Oops...',
      name: 'oops',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, The PinCode expired, Press ok to resend PinCode`
  String get sorryThePinCodeExpired {
    return Intl.message(
      'Sorry, The PinCode expired, Press ok to resend PinCode',
      name: 'sorryThePinCodeExpired',
      desc: '',
      args: [],
    );
  }

  /// `ResendPinCode`
  String get resendPinCode {
    return Intl.message(
      'ResendPinCode',
      name: 'resendPinCode',
      desc: '',
      args: [],
    );
  }

  /// `Insert a New Password`
  String get insertNewPassword {
    return Intl.message(
      'Insert a New Password',
      name: 'insertNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `NewPassword*`
  String get newPassword {
    return Intl.message(
      'NewPassword*',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your NewPassword`
  String get enterYourNewPassword {
    return Intl.message(
      'Enter your NewPassword',
      name: 'enterYourNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Verification Your Email Address`
  String get verificationYourEmailAddress {
    return Intl.message(
      'Verification Your Email Address',
      name: 'verificationYourEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the E-commerce app`
  String get welcomeToTheE_CommerceApp {
    return Intl.message(
      'Welcome to the E-commerce app',
      name: 'welcomeToTheE_CommerceApp',
      desc: '',
      args: [],
    );
  }

  /// `Signing or Registering into an account`
  String get signingOrRegisteringIntoAnAccount {
    return Intl.message(
      'Signing or Registering into an account',
      name: 'signingOrRegisteringIntoAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
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
