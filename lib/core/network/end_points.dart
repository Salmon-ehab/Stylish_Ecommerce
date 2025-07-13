abstract class EndPoints {
  static const String baseUrl =
      'https://nti-ecommerce-api-production-43d8.up.railway.app/api/';
  static const String login = 'login';
  static const String register = 'register';
  static const String getUserData = 'get_user_data';
  static const String updateProfile = 'update_profile';
  static const String refreshToken = 'refresh_token';
  static const String deleteUser = 'delete_user';
  static const String getCategories = 'categories';
  static const String getSliders = 'sliders';
  static const String getBestSeller = 'best_seller_products';
  static const String addToFavorite = 'add_to_favorite';
  static const String getProducts = 'products';
  static const String placeOrder = 'place_order';
  static const String getOrders = 'orders';
  static const String cancelOrder = 'orders/cancel/';
  static const String completeOrder = 'orders/complete/';
  static const String searchItem = 'products/search?q=';
}
