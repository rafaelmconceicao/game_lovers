class Querys {

  static String gamesByPlatform(int platform) =>
      ''' SELECT * FROM GAMES WHERE platform = $platform''';

  static String genreByGame(int idGame) =>
      ''' SELECT * FROM GENRES WHERE game = $idGame''';

}