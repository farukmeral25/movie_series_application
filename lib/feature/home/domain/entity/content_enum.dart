// ignore_for_file: constant_identifier_names

enum ContentEnum { TVSHOW, MOVIE }

extension ContentEnumExtension on ContentEnum {
  String contentTypeText() {
    switch (this) {
      case ContentEnum.TVSHOW:
        return "Tv Show";
      case ContentEnum.MOVIE:
        return "Movie";
    }
  }
}
