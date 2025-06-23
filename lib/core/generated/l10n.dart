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

class Lang {
  Lang();

  static Lang? _current;

  static Lang get current {
    assert(
      _current != null,
      'No instance of Lang was loaded. Try to initialize the Lang delegate before accessing Lang.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Lang> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Lang();
      Lang._current = instance;

      return instance;
    });
  }

  static Lang of(BuildContext context) {
    final instance = Lang.maybeOf(context);
    assert(
      instance != null,
      'No instance of Lang present in the widget tree. Did you add Lang.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static Lang? maybeOf(BuildContext context) {
    return Localizations.of<Lang>(context, Lang);
  }

  /// `Dream Vila`
  String get lbl_app_name {
    return Intl.message('Dream Vila', name: 'lbl_app_name', desc: '', args: []);
  }

  /// `Sign In`
  String get lbl_sign_in {
    return Intl.message('Sign In', name: 'lbl_sign_in', desc: '', args: []);
  }

  /// `Sign Up`
  String get lbl_sign_up {
    return Intl.message('Sign Up', name: 'lbl_sign_up', desc: '', args: []);
  }

  /// `First Name`
  String get lbl_first_name {
    return Intl.message(
      'First Name',
      name: 'lbl_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lbl_last_name {
    return Intl.message('Last Name', name: 'lbl_last_name', desc: '', args: []);
  }

  /// `Email`
  String get lbl_email {
    return Intl.message('Email', name: 'lbl_email', desc: '', args: []);
  }

  /// `Mobil`
  String get lbl_mobil {
    return Intl.message('Mobil', name: 'lbl_mobil', desc: '', args: []);
  }

  /// `Gender`
  String get lbl_gender {
    return Intl.message('Gender', name: 'lbl_gender', desc: '', args: []);
  }

  /// `Upload User Profile`
  String get lbl_upload_user_profile {
    return Intl.message(
      'Upload User Profile',
      name: 'lbl_upload_user_profile',
      desc: '',
      args: [],
    );
  }

  /// `Select Image`
  String get lbl_select_image {
    return Intl.message(
      'Select Image',
      name: 'lbl_select_image',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get lbl_password {
    return Intl.message('Password', name: 'lbl_password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get lbl_confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'lbl_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Hobby`
  String get lbl_hobby {
    return Intl.message('Hobby', name: 'lbl_hobby', desc: '', args: []);
  }

  /// `Reading`
  String get lbl_reading {
    return Intl.message('Reading', name: 'lbl_reading', desc: '', args: []);
  }

  /// `Drawing`
  String get lbl_drawing {
    return Intl.message('Drawing', name: 'lbl_drawing', desc: '', args: []);
  }

  /// `Writing`
  String get lbl_writing {
    return Intl.message('Writing', name: 'lbl_writing', desc: '', args: []);
  }

  /// `Photography`
  String get lbl_photography {
    return Intl.message(
      'Photography',
      name: 'lbl_photography',
      desc: '',
      args: [],
    );
  }

  /// `Hello!`
  String get lbl_hello {
    return Intl.message('Hello!', name: 'lbl_hello', desc: '', args: []);
  }

  /// `House`
  String get lbl_house {
    return Intl.message('House', name: 'lbl_house', desc: '', args: []);
  }

  /// `Apartment`
  String get lbl_apartment {
    return Intl.message('Apartment', name: 'lbl_apartment', desc: '', args: []);
  }

  /// `Office`
  String get lbl_office {
    return Intl.message('Office', name: 'lbl_office', desc: '', args: []);
  }

  /// `Land`
  String get lbl_land {
    return Intl.message('Land', name: 'lbl_land', desc: '', args: []);
  }

  /// `Plots`
  String get lbl_plots {
    return Intl.message('Plots', name: 'lbl_plots', desc: '', args: []);
  }

  /// ` % Discount`
  String get lbl_discount {
    return Intl.message(
      ' % Discount',
      name: 'lbl_discount',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get lbl_title {
    return Intl.message('Title', name: 'lbl_title', desc: '', args: []);
  }

  /// `Description`
  String get lbl_description {
    return Intl.message(
      'Description',
      name: 'lbl_description',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get lbl_address {
    return Intl.message('Address', name: 'lbl_address', desc: '', args: []);
  }

  /// `Price`
  String get lbl_price {
    return Intl.message('Price', name: 'lbl_price', desc: '', args: []);
  }

  /// `Discount Percentage`
  String get lbl_discount_percentage {
    return Intl.message(
      'Discount Percentage',
      name: 'lbl_discount_percentage',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get lbl_rating {
    return Intl.message('Rating', name: 'lbl_rating', desc: '', args: []);
  }

  /// `Plot`
  String get lbl_plot {
    return Intl.message('Plot', name: 'lbl_plot', desc: '', args: []);
  }

  /// `Type`
  String get lbl_type {
    return Intl.message('Type', name: 'lbl_type', desc: '', args: []);
  }

  /// `Bad Room`
  String get lbl_bedroom {
    return Intl.message('Bad Room', name: 'lbl_bedroom', desc: '', args: []);
  }

  /// `Hall`
  String get lbl_hall {
    return Intl.message('Hall', name: 'lbl_hall', desc: '', args: []);
  }

  /// `Kitchen`
  String get lbl_kitchen {
    return Intl.message('Kitchen', name: 'lbl_kitchen', desc: '', args: []);
  }

  /// `Washroom`
  String get lbl_washroom {
    return Intl.message('Washroom', name: 'lbl_washroom', desc: '', args: []);
  }

  /// `+Add Product`
  String get lbl_add_product {
    return Intl.message(
      '+Add Product',
      name: 'lbl_add_product',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account? `
  String get lbl_do_not_have_an_account {
    return Intl.message(
      'Don’t have an account? ',
      name: 'lbl_do_not_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get lbl_already_have_an_account {
    return Intl.message(
      'Already have an account? ',
      name: 'lbl_already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `* * * * * *`
  String get lbl_password_hint {
    return Intl.message(
      '* * * * * *',
      name: 'lbl_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get lbl_forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'lbl_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get lbl_male {
    return Intl.message('Male', name: 'lbl_male', desc: '', args: []);
  }

  /// `Female`
  String get lbl_female {
    return Intl.message('Female', name: 'lbl_female', desc: '', args: []);
  }

  /// `+91`
  String get lbl_mobil_hint {
    return Intl.message('+91', name: 'lbl_mobil_hint', desc: '', args: []);
  }

  /// `abc@gmail.com`
  String get lbl_email_hint {
    return Intl.message(
      'abc@gmail.com',
      name: 'lbl_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Upload Images`
  String get lbl_upload_images {
    return Intl.message(
      'Upload Images',
      name: 'lbl_upload_images',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Lang> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Lang> load(Locale locale) => Lang.load(locale);
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
