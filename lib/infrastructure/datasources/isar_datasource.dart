
import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;

class IsarDataSource extends LocalStorageDataSource{

  late Future<Isar> db;

  IsarDataSource(){
    db = openDB();
  }

  Future<Isar> openDB() async{
    if(Isar.instanceNames.isEmpty){
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([MovieSchema],inspector: true, directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMovieFavorite(int movieId) {

    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {

    throw UnimplementedError();
  }

  @override
  Future<void> toggleFavorite(Movie movie) {

    throw UnimplementedError();
  }
}