import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'id', 'ms'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? idText = '',
    String? msText = '',
  }) =>
      [enText, idText, msText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    '3p97u62u': {
      'en': 'Welcome Back!',
      'id': 'Selamat Datang kembali!',
      'ms': 'Selamat kembali!',
    },
    'k9u5spqi': {
      'en': 'Username',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'f4xxyrqv': {
      'en': 'Enter your username here...',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'lfzvgi5q': {
      'en': 'Password',
      'id': 'Kata sandi',
      'ms': 'Kata laluan',
    },
    'wt8sx5du': {
      'en': 'Enter your password here...',
      'id': 'Masukkan kata sandi Anda di sini...',
      'ms': 'Masukkan kata laluan anda di sini...',
    },
    'm9klj9ah': {
      'en': 'Login',
      'id': 'Gabung',
      'ms': 'Log masuk',
    },
    'iha5socs': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // Home
  {
    '3bi54x5g': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'nnv46x35': {
      'en': 'Below is a summary of user traffic',
      'id': 'Di bawah ini adalah ringkasan aktivitas tim Anda.',
      'ms': 'Di bawah ialah ringkasan aktiviti pasukan anda.',
    },
    'jqevo63s': {
      'en': 'New Accounts',
      'id': 'pelanggan baru',
      'ms': 'pelanggan baru',
    },
    'd0r4w3cc': {
      'en': '24',
      'id': '24',
      'ms': '24',
    },
    'b7ix00y7': {
      'en': 'Active Accounts',
      'id': 'pelanggan baru',
      'ms': 'pelanggan baru',
    },
    'z1clcw2l': {
      'en': '240',
      'id': '24',
      'ms': '24',
    },
    '8vot9bzj': {
      'en': 'Total Helpers',
      'id': 'Kontrak Baru',
      'ms': 'Kontrak Baru',
    },
    '463rfkem': {
      'en': '320',
      'id': '3.200',
      'ms': '3,200',
    },
    'saxskj92': {
      'en': 'Total Shoppers',
      'id': 'Kontrak Kedaluwarsa',
      'ms': 'Kontrak Tamat',
    },
    '2wlrr5lg': {
      'en': '200',
      'id': '4300',
      'ms': '4300',
    },
    'kphqz3hi': {
      'en': 'Charts',
      'id': 'Proyek',
      'ms': 'Projek',
    },
    'uj7jsxmo': {
      'en': 'Contract Activity',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
    },
    'hkk2zmjw': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'jkgae0vc': {
      'en': 'Customer Activity',
      'id': 'Aktivitas Pelanggan',
      'ms': 'Aktiviti Pelanggan',
    },
    'g4os7kcp': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'y24lcr13': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'xdxbdj20': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // verifyUser
  {
    'qrxn5crt': {
      'en': 'Verify User',
      'id': 'Profil saya',
      'ms': 'Profil saya',
    },
    'yj2g6q7m': {
      'en': 'Alexander Müller',
      'id': '',
      'ms': '',
    },
    'sh7q15l6': {
      'en': 'Switch to Light Mode',
      'id': 'Beralih ke Mode Cahaya',
      'ms': 'Tukar kepada Mod Cahaya',
    },
    'fyxsf6vn': {
      'en': 'Account Information',
      'id': 'Pengaturan akun',
      'ms': 'Tetapan Akaun',
    },
    'dwvwvr8x': {
      'en': 'Birth Date',
      'id': 'Pengaturan akun',
      'ms': 'Tetapan Akaun',
    },
    'h43llaan': {
      'en': '19/02/1987',
      'id': 'Ganti kata sandi',
      'ms': 'Tukar kata laluan',
    },
    '3jhg1oxz': {
      'en': 'Phone Number',
      'id': 'Pengaturan akun',
      'ms': 'Tetapan Akaun',
    },
    'b1lw0hfu': {
      'en': '+49 1578 1234567',
      'id': 'Sunting profil',
      'ms': 'Sunting profil',
    },
    '57v9ctbm': {
      'en': 'Gender',
      'id': 'Pengaturan akun',
      'ms': 'Tetapan Akaun',
    },
    '5dbz9wsh': {
      'en': 'Male',
      'id': 'Sunting profil',
      'ms': 'Sunting profil',
    },
    'hzm9ne7j': {
      'en': 'LGBTQ+ ',
      'id': 'Pengaturan akun',
      'ms': 'Tetapan Akaun',
    },
    'jcvrvlkk': {
      'en': 'True',
      'id': 'Sunting profil',
      'ms': 'Sunting profil',
    },
    'zuud9w5c': {
      'en': 'Category',
      'id': 'Pengaturan akun',
      'ms': 'Tetapan Akaun',
    },
    '8zdw8dl9': {
      'en': 'Helper',
      'id': 'Sunting profil',
      'ms': 'Sunting profil',
    },
    'abqf147c': {
      'en': 'Cancel',
      'id': 'Keluar',
      'ms': 'Log keluar',
    },
    'ltiyk83v': {
      'en': 'Verify',
      'id': 'Keluar',
      'ms': 'Log keluar',
    },
    'o3dp9tss': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // userDetails
  {
    '00sam6zz': {
      'en': 'Alexander Müller',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
    },
    '79thn4an': {
      'en': '40 points',
      'id': '',
      'ms': '',
    },
    'nxuoeukv': {
      'en': 'Helper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'ecbeopja': {
      'en': 'Birth Date',
      'id': 'Judul',
      'ms': 'Tajuk',
    },
    '4qddi0ut': {
      'en': '19/02/1987',
      'id': 'Kepala Pengadaan',
      'ms': 'Ketua Perolehan',
    },
    '6vufjbms': {
      'en': 'Phone Number',
      'id': 'Perusahaan',
      'ms': 'Syarikat',
    },
    'nh9bkr5i': {
      'en': '+49 1578 1234567',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'kl55bl1c': {
      'en': 'Gender',
      'id': 'Perusahaan',
      'ms': 'Syarikat',
    },
    'xf6clrz6': {
      'en': 'Male',
      'id': 'Kepala Pengadaan',
      'ms': 'Ketua Perolehan',
    },
    '95928ofh': {
      'en': 'LGBTQ+ Supporte',
      'id': 'Perusahaan',
      'ms': 'Syarikat',
    },
    '2at9e2e9': {
      'en': 'True',
      'id': 'Kepala Pengadaan',
      'ms': 'Ketua Perolehan',
    },
    'dkyygm1d': {
      'en': 'Ratings / Total Rating: 5.0',
      'id': 'Catatan',
      'ms': 'Nota',
    },
    '1eg4buj0': {
      'en': 'Julia Collins',
      'id': '',
      'ms': '',
    },
    '2s53b50t': {
      'en': '2 days ago',
      'id': '1 menit yang lalu',
      'ms': '1m lalu',
    },
    'rnaiavvh': {
      'en':
          'Alexander is amazing! He even showed me how to recognize good-quality fruits!! :)',
      'id':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'ms':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut laboure et dolore magna aliqua. Untuk meminimumkan veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    },
    'zg2vjg0k': {
      'en': 'Marious Brown',
      'id': '',
      'ms': '',
    },
    'ljd5q982': {
      'en': '14 days ago',
      'id': '1 menit yang lalu',
      'ms': '1m lalu',
    },
    'e13u3lm1': {
      'en':
          'Really happy that I met this person! Can\'t wait to go shopping again!!',
      'id':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'ms':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut laboure et dolore magna aliqua. Untuk meminimumkan veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    },
    '9t913b44': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // MainUserList
  {
    'bb5a98fc': {
      'en': 'Users',
      'id': '',
      'ms': '',
    },
    '0283qtog': {
      'en': 'Search user...',
      'id': 'Cari anggota...',
      'ms': 'Cari ahli...',
    },
    'fgy5ze5t': {
      'en': 'Option 1',
      'id': 'Pilihan 1',
      'ms': 'Pilihan 1',
    },
    '1ka1c9op': {
      'en': 'All',
      'id': '',
      'ms': '',
    },
    'm2tlrl9q': {
      'en': 'Helper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'eysavw6m': {
      'en': 'Alexander Müller',
      'id': 'James Wiseman',
      'ms': 'James Wiseman',
    },
    'ae16uvln': {
      'en': '+49 1578 1234567',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    '276he7ef': {
      'en': 'Helper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'gqvclgbo': {
      'en': 'Carl Wagner',
      'id': 'James Wiseman',
      'ms': 'James Wiseman',
    },
    '28ezvgwd': {
      'en': '+49 1769 9876543',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'sv3p9053': {
      'en': 'Shopper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'kwujmplx': {
      'en': 'Florian Schmidt',
      'id': 'Rodriguez yang kejam',
      'ms': 'Ignacious Rodriguez',
    },
    'w27n1v4q': {
      'en': '+49 1512 3456789',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'edfk0rcx': {
      'en': 'Shopper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    '0dm6qipa': {
      'en': 'Julia Collins',
      'id': 'Elena Williams',
      'ms': 'Elena Williams',
    },
    '029hdz1a': {
      'en': '+49 1590 8765432',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    '6vn45vxg': {
      'en': 'Shopper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    '498fa82g': {
      'en': 'Marious Brown',
      'id': 'Greg Brown',
      'ms': 'Greg Brown',
    },
    'nz1wscqj': {
      'en': '+49 1701 2345678',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'z9lxp5e2': {
      'en': 'Helper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'tql2gw8g': {
      'en': 'Nina Williamson',
      'id': 'Juni Williamson',
      'ms': 'June Williamson',
    },
    'lua3neiy': {
      'en': '+49 1623 4567890',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    't3a19g6g': {
      'en': 'Shoppers',
      'id': '',
      'ms': '',
    },
    'bxv5st13': {
      'en': 'Shopper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'f893b87z': {
      'en': 'Florian Schmidt',
      'id': 'Rodriguez yang kejam',
      'ms': 'Ignacious Rodriguez',
    },
    'uinz9ln1': {
      'en': '+49 1512 3456789',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'tp8ndjlo': {
      'en': 'Shopper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    '1k0040uz': {
      'en': 'Julia Collins',
      'id': 'Elena Williams',
      'ms': 'Elena Williams',
    },
    'b8581cim': {
      'en': '+49 1590 8765432',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    '0xqkmquk': {
      'en': 'Shopper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'sz80ao0j': {
      'en': 'Marious Brown',
      'id': 'Greg Brown',
      'ms': 'Greg Brown',
    },
    'xi5jqjeu': {
      'en': '+49 1701 2345678',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'ulc51eo0': {
      'en': 'Helpers',
      'id': '',
      'ms': '',
    },
    '6afk29ol': {
      'en': 'Helper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    '3p25xiah': {
      'en': 'Alexander Müller',
      'id': 'James Wiseman',
      'ms': 'James Wiseman',
    },
    'xxw7hia6': {
      'en': '+49 1578 1234567',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'x4q97yyv': {
      'en': 'Helper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'i7da3som': {
      'en': 'Carl Wagner',
      'id': 'James Wiseman',
      'ms': 'James Wiseman',
    },
    'iq0i368k': {
      'en': '+49 1769 9876543',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'i775hvuo': {
      'en': 'Helper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    '1aqe50ek': {
      'en': 'Nina Williamson',
      'id': 'Juni Williamson',
      'ms': 'June Williamson',
    },
    '11bl2r26': {
      'en': '+49 1623 4567890',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    'jnp5talw': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    'qo1j8ujh': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    'btgh5n2u': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // userEdit
  {
    '6ypag65d': {
      'en': 'Edit User Information',
      'id': '',
      'ms': '',
    },
    'xny7i8c4': {
      'en': 'Alexander Müller',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
    },
    'dhmwibqn': {
      'en': '40 points',
      'id': '',
      'ms': '',
    },
    'xp9cqs0p': {
      'en': 'Helper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'elucv6av': {
      'en': 'Username',
      'id': '',
      'ms': '',
    },
    'vokrku6b': {
      'en': 'Alexander Müller',
      'id': '',
      'ms': '',
    },
    'siuugbct': {
      'en': 'Birth Date',
      'id': '',
      'ms': '',
    },
    'xb8gp82u': {
      'en': '19/02/1972',
      'id': '',
      'ms': '',
    },
    'wa3yje5k': {
      'en': 'Phone Number',
      'id': '',
      'ms': '',
    },
    'i4ez65h1': {
      'en': '+49 1578 1234567',
      'id': '',
      'ms': '',
    },
    'yis4uts1': {
      'en': 'Gender',
      'id': '',
      'ms': '',
    },
    '37j28e05': {
      'en': 'Male',
      'id': '',
      'ms': '',
    },
    'qfqih0s9': {
      'en': 'LGBTQ+ Supporter',
      'id': '',
      'ms': '',
    },
    'wo726eg8': {
      'en': 'True',
      'id': '',
      'ms': '',
    },
    'q7d1can5': {
      'en': 'Save',
      'id': '',
      'ms': '',
    },
    '2n0vesqp': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // AfterSearch
  {
    'eyfminfu': {
      'en': 'Users',
      'id': '',
      'ms': '',
    },
    'xrail7y7': {
      'en': 'Search user...',
      'id': 'Cari anggota...',
      'ms': 'Cari ahli...',
    },
    'nstougk4': {
      'en': 'Alexander Müller',
      'id': '',
      'ms': '',
    },
    'nfkygj4c': {
      'en': 'All',
      'id': '',
      'ms': '',
    },
    '84tynide': {
      'en': 'Helper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'pl61x0ot': {
      'en': 'Alexander Müller',
      'id': 'James Wiseman',
      'ms': 'James Wiseman',
    },
    'v65abijs': {
      'en': '+49 1578 1234567',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'f29ekebt': {
      'en': 'Shoppers',
      'id': '',
      'ms': '',
    },
    '78nrnuwr': {
      'en': 'Helpers',
      'id': '',
      'ms': '',
    },
    '4bhytms2': {
      'en': 'Helper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    '7tix6kr6': {
      'en': 'Alexander Müller',
      'id': 'James Wiseman',
      'ms': 'James Wiseman',
    },
    'mexjd9e5': {
      'en': '+49 1578 1234567',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'htd1uycs': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    '6qqwy8og': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    'cwd32jvw': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // afterDelete
  {
    'hysm3945': {
      'en': 'Users',
      'id': '',
      'ms': '',
    },
    'e9s9s2al': {
      'en': 'Search user...',
      'id': 'Cari anggota...',
      'ms': 'Cari ahli...',
    },
    'ok19arjw': {
      'en': 'Option 1',
      'id': 'Pilihan 1',
      'ms': 'Pilihan 1',
    },
    'cevad9e3': {
      'en': 'All',
      'id': '',
      'ms': '',
    },
    'fx90vhwz': {
      'en': 'Helper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    '1kiqjpgu': {
      'en': 'Alexander Müller',
      'id': 'James Wiseman',
      'ms': 'James Wiseman',
    },
    'rncksc84': {
      'en': '+49 1578 1234567',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'jg1kadi1': {
      'en': 'Helper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'ea3du452': {
      'en': 'Carl Wagner',
      'id': 'James Wiseman',
      'ms': 'James Wiseman',
    },
    'ycss0rus': {
      'en': '+49 1769 9876543',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'kxs9o2uj': {
      'en': 'Shopper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    '1o96m1xr': {
      'en': 'Florian Schmidt',
      'id': 'Rodriguez yang kejam',
      'ms': 'Ignacious Rodriguez',
    },
    '49qvjrxw': {
      'en': '+49 1512 3456789',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    '9wv12l2a': {
      'en': 'Shopper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    '1bw9mcq3': {
      'en': 'Julia Collins',
      'id': 'Elena Williams',
      'ms': 'Elena Williams',
    },
    'nqiqfomz': {
      'en': '+49 1590 8765432',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    '1ecgtc2m': {
      'en': 'Shopper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'oa7foyte': {
      'en': 'Marious Brown',
      'id': 'Greg Brown',
      'ms': 'Greg Brown',
    },
    'hipjs1ui': {
      'en': '+49 1701 2345678',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'cdyykzki': {
      'en': 'Shoppers',
      'id': '',
      'ms': '',
    },
    'pl9yqwfa': {
      'en': 'Shopper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'prxur4um': {
      'en': 'Florian Schmidt',
      'id': 'Rodriguez yang kejam',
      'ms': 'Ignacious Rodriguez',
    },
    'lt0au2o7': {
      'en': '+49 1512 3456789',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'ngors82e': {
      'en': 'Shopper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'g4wp4wm5': {
      'en': 'Julia Collins',
      'id': 'Elena Williams',
      'ms': 'Elena Williams',
    },
    'kpbrmw7e': {
      'en': '+49 1590 8765432',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'txy8f4vc': {
      'en': 'Shopper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'tmgqxjps': {
      'en': 'Marious Brown',
      'id': 'Greg Brown',
      'ms': 'Greg Brown',
    },
    'djfofhql': {
      'en': '+49 1701 2345678',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'xakl695s': {
      'en': 'Helpers',
      'id': '',
      'ms': '',
    },
    'z03jh1pz': {
      'en': 'Helper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'r0i6aabj': {
      'en': 'Alexander Müller',
      'id': 'James Wiseman',
      'ms': 'James Wiseman',
    },
    'n10vdd9u': {
      'en': '+49 1578 1234567',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'f2gdfi1y': {
      'en': 'Helper Account',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'rfdwf8cp': {
      'en': 'Carl Wagner',
      'id': 'James Wiseman',
      'ms': 'James Wiseman',
    },
    'aiufzj7y': {
      'en': '+49 1769 9876543',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'peznqq1v': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    'daldadct': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    'g56kr39c': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // webNav
  {
    'xai8ocja': {
      'en': 'Search',
      'id': 'Mencari',
      'ms': 'Cari',
    },
    'yg07zi4c': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'lbojdpxg': {
      'en': 'Users',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    '01nu9cy0': {
      'en': 'Verify User',
      'id': 'Profil',
      'ms': 'Profil',
    },
  },
  // Miscellaneous
  {
    '65e2tfs2': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ddazihx4': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'db03cpjj': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'fdb9078p': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '80ouzj9q': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '6rzhptp9': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ce8c4ty0': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'kcvqa08x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dqrzd6sq': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dpqtohyf': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'v01vf71s': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'gcv6def1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'um9es99m': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'o4enbz4j': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '8z4tvfh7': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2ybzla8x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'd1wdf5i1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2py80kgi': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'p6lsrh2a': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ne8cclp9': {
      'en': '',
      'id': '',
      'ms': '',
    },
  },
].reduce((a, b) => a..addAll(b));
