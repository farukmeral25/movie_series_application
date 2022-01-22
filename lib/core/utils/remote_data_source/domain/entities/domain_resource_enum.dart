// ignore_for_file: constant_identifier_names

enum DomainResourceEnum {
  MOVIEDB,
}

extension DomainResourceEnumExtension on DomainResourceEnum {
  String getUrlByState() {
    switch (this) {
      case DomainResourceEnum.MOVIEDB:
        return "https://api.themoviedb.org/";
    }
  }
}
