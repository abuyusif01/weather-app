class Strings {
  // <Language, <Tag, Value>>
  static final _container = {
    'ENG': {
      'KUL': 'Kuala Lumpur',
      'SH': 'Sabah',
      'JR': 'Johor',
      'NOW': 'Now',
      'NXTW': 'Next week',
      'MON': 'MON',
      'TUE': 'TUE',
      'WED': 'WED',
      'THU': 'THU',
      'FRI': 'FRI',
      'SAT': 'SAT',
      'SUN': 'SUN',
      'TOD': 'Today',
      'TOMR': 'Tomorrow',
      'MOND': 'Monday',
      'TUES': 'Tuesday',
      'WEDN': 'Wednesday',
      'THUR': 'Thursday',
      'FRID': 'Friday',
      'SATU': 'Saturday',
      'SUND': 'Sunday',
      'CLOUDY': 'Cloudy',
      'RAINY': 'Rainy',
      'SUNNY': 'Sunny',
      'SELECTCITY': 'Select a city',
      'RECENT': 'Recent',
      'CANTFNDLOC': 'Can\'t find location',
      'WEATHER': 'Weather',
      'SEARCH_CITY': 'Search a city',
      'SETTINGS': 'Settings',
      'GENERAL': 'General',
      'TEMPERATURE': 'Temperature',
      'LANGUAGE': 'Language',
      'ENG': 'English',
      'RUS': 'Русский',
      'CHOOSELANG': 'Choose language',
      'CANCEL': 'CANCEL'
    },
    'MAL': {
      'KUL': 'Kuala Lumpur',
      'SH': 'Sabah',
      'JR': 'Johor',
      'NOW': 'Sekerang',
      'NXTW': 'Minggu Dapan',
      'MON': 'MON',
      'TUE': 'TUE',
      'WED': 'WED',
      'THU': 'THU',
      'FRI': 'FRI',
      'SAT': 'SAT',
      'SUN': 'SUN',
      'TOD': 'Hari ini',
      'TOMR': 'Esok',
      'MOND': 'Isnin',
      'TUES': 'Selasa',
      'WEDN': 'Rabu',
      'THUR': 'Khamis',
      'FRID': 'Jumaat',
      'SATU': 'Sabtu',
      'SUND': 'Ahad',
      'CLOUDY': 'Mendung',
      'RAINY': 'Hujan',
      'SUNNY': 'Cerah',
      'SELECTCITY': 'Pileh Siti',
      'RECENT': 'Sekerang',
      'CANTFNDLOC': 'Tidak dapat mencari lokasi',
      'WEATHER': 'Cuaca',
      'SEARCH_CITY': 'Cari bandar',
      'SETTINGS': 'tetapan',
      'GENERAL': 'Umum',
      'TEMPERATURE': 'Suhu',
      'LANGUAGE': 'Bahasa',
      'ENG': 'Ingris',
      'MAL': 'Malay',
      'CHOOSELANG': 'Pileh Bahasa',
      'CANCEL': 'BATAL'
    }
  };

  static String curLang = "ENG";

  static String getValue(tag) {

    return _container[curLang]![tag].toString();
  }

  static List<String> getLanguages() => ['ENG', 'MAL'];
}
