class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "🇧🇮", "Kirundi", "ko"),
      Language(2, "🇨🇳", " Mandarin", "zh"),
      Language(3, "🇬🇧", "English", "en"),
      Language(4, "🇪🇸", "Spanish", "es"),
      Language(5, "🇫🇷", "French", "fr"),
      Language(6, "🇳🇪", "Haussa", "sv"),
      Language(7, "🇮🇳", "Hindi", "hi"),
      Language(8, "🇨🇩", "Lingala", "fa"),
      Language(9, "🇵🇰", "Panjabi", "pa"),
      Language(10, "🇵🇹", "Portuguese", "pt"),
      Language(11, "🇷🇺", "Russian", "ru"),
      Language(12, "🇹🇿", "Swahili", "sw"),
      Language(13, "🇳🇬", "Yoruba", "ar"),
      Language(14, "🇨🇳", "Cantonese", "ja"),
    ];
  }
}
