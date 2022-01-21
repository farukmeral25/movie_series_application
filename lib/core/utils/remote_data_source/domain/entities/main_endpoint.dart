// ignore_for_file: constant_identifier_names

enum MainEndpoints { FETCH_LOCATION }
enum MainEndpointsType {
  POST,
  GET,
  MULTI_PART_FORM_DATA,
}

extension MainEndPointExtension on MainEndpoints {
  String stateToEndpoint() {
    switch (this) {
      case MainEndpoints.FETCH_LOCATION:
        return "fetch_locations";
    }
  }

  MainEndpointsType stateToMethodType() {
    switch (this) {
      case MainEndpoints.FETCH_LOCATION:
        return MainEndpointsType.GET;

      // return MainEndpointsType.POST;

      // return MainEndpointsType.MULTI_PART_FORM_DATA;

    }
  }
}
