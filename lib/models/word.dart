class Word {
  Word(
    this.abbreviation,
    this.thWord,
    this.enWord, {
    this.thVoice,
    this.verbClc,
   this.adjClc,
   this.adjExample,
    this.verbExample
  });
  final String abbreviation;
  final String thWord;
  final String enWord;
  final String? thVoice;
  final List<String>? verbClc;
  final List<String>? adjClc;
  final List<String>? adjExample;
  final List<String>? verbExample;


  @override
  String toString() {
    return 'Word(thWord: $thWord, enWord: $enWord, thVoice: $thVoice)';
  }
}
