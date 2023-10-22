import '../../../utils/constans/nums.dart';
import '../../../utils/constans/string.dart';

class BreakingNewsRequest {
  final String apiKey;
  final String country;
  final String category;
  final int page;
  final int pageSize;

  BreakingNewsRequest({
    this.apiKey = defaultApiKey,
    this.country = 'us',
    this.category = 'general',
    this.page = 1,
    this.pageSize = defaultPageSize,
  });
}
