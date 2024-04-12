
class Word {
  Word(
         this.abbreviation,
        this.thWord,
      this.enWord,
      {
      this.thVoice,
      this.meaning,
      this.verbClc,
       this.adjClc,
      });
  final String abbreviation;
  final String thWord;
  final String enWord;
  final String? thVoice;
  final String? meaning;
  final List<String>? verbClc;
  final List<String>? adjClc;


  @override
  String toString() {
    return 'Word(thWord: $thWord, enWord: $enWord, thVoice: $thVoice, meaning: $meaning)';
  }
}
