// ignore_for_file: constant_identifier_names

enum DomainResourceEnum {
  GOOGLEMAP,
}

extension DomainResourceEnumExtension on DomainResourceEnum {
  String getUrlByState() {
    switch (this) {
      case DomainResourceEnum.GOOGLEMAP:
        return "https://www.mockachino.com/5b106bbd-988d-4a/";
    }
  }
}
