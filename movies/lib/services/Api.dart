import 'package:http/http.dart' as http;


class Api {




  Future<http.Response> getMoviesList() {
    return http.get(Uri.parse('https://yts.mx/api/v2/list_movies.json'));
  }
  Future<http.Response> getMovieDetails(String id) {
    return http.get(Uri.parse('https://yts.mx/api/v2/movie_details.json?movie_id='+id));
  }

  

  Future<http.Response> getMoviesListQuery(String query_term) {
    return http.get(Uri.parse('https://yts.mx/api/v2/list_movies.json?query_term='+query_term));
  }
  

  
}