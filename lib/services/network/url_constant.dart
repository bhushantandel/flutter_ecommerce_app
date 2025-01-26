class UrlConstants {
  static final urlConstants = UrlConstants();

  static String baseurl = "http://stagingauth.desidime.com/v4/home/";

  static String topDealsUrl(String pageNo) {
    return "new?per_page=10&page=$pageNo&fields=id, created_at,created_at_in_millis,image_medium,comments_count,store{name}";
  }

  static String popularDealsUrl(String pageNo) {
    return "discussed?per_page=10&page=$pageNo&fields=id,created_at,created_at_in_millis,image_medium,comments_count,store%7Bname";
  }

  static String featuredDealsUrl(String pageNo) {
    return "discussed?per_page=10&page=$pageNo&fields=id,created_at.created_at_in_millis,image_medium,comments_count,store{name}";
  }

  //http://stagingauth.desidime.com/v4/home/
  //http://stagingauth.desidime.com/v4/home/
  //http://stagingauth.desidime.com/v4/home/
}
