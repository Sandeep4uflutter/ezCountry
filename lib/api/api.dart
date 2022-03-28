import 'package:ezcountry/constant/apiConstants/apiConstant.dart';
import 'package:graphql/client.dart';

final _httpLink = HttpLink(
  ApiConstant.baseUrl,
);

final GraphQLClient client = GraphQLClient(
  link: _httpLink,
  cache: GraphQLCache(),
);