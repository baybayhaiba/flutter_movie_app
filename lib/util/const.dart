const BASE_URL = 'https://api.themoviedb.org/3/movie/';

enum MovieType {
  popular,
  upcoming,
}

const KEY = '25f4e34706c1c7811234b0b223403e24';
const LANGUAGES = 'en-US';

String movieUrl({required MovieType type, required int page}) {
  return '${BASE_URL + type.name}?api_key=${KEY}&language=${LANGUAGES}&page=$page';
}
