import 'aida_client.dart';
import '../models/guest.dart';
import '../models/ship_data.dart';
import '../models/event.dart';
import '../models/timetable.dart';
import '../models/itinerary.dart';
import '../models/excursion.dart';
import '../models/restaurant.dart';
import '../models/poi.dart';
import '../models/spa.dart';
import '../models/account.dart';

/// All AIDA API calls in one place.
class AidaApi {
  final AidaClient _client;

  AidaApi(this._client);

  // ─── Auth ─────────────────────────────────────────────────────────────────

  Future<AuthResponse> authGuest({
    required String cabin,
    required String surname,
    required String pin,
  }) async {
    final resp = await _client.extApi.get(
      '/api/ext/Aida.aidajsonwebservice/auth-guest'
      '/cabinnr/$cabin/name/$surname/pin/$pin',
    );
    return AuthResponse.fromJson(resp.data as Map<String, dynamic>);
  }

  Future<AuthResponse> getUserData({
    required String cabin,
    required String folio,
  }) async {
    final resp = await _client.extApi.get(
      '/api/ext/Aida.aidajsonwebservice/get-user-data'
      '/cabin/$cabin/account/$folio',
    );
    return AuthResponse.fromJson(resp.data as Map<String, dynamic>);
  }

  // ─── Home / Ship ──────────────────────────────────────────────────────────

  Future<ShipDataResponse> getShipData({String locale = 'de_DE'}) async {
    final resp = await _client.extApi.get(
      '/api/ext/Aida.aidajsonwebservice/get-ship-data/locale/$locale',
    );
    return ShipDataResponse.fromJson(resp.data as Map<String, dynamic>);
  }

  Future<Map<String, dynamic>> getBoardTime({String locale = 'de_DE'}) async {
    final resp = await _client.bordPortal.get(
      '/api/ext/Aida.aidajsonwebservice/get-board-time/locale/$locale',
    );
    return resp.data as Map<String, dynamic>;
  }

  // ─── Program ──────────────────────────────────────────────────────────────

  Future<DailyEventsResponse> getDailyEvents({
    required String date,
    String locale = 'de_DE',
  }) async {
    final resp = await _client.bordPortal.get(
      '/api/ext/Aida.aidajsonwebservice/get-daily-events'
      '/locale/$locale/date/$date/-categories',
    );
    return DailyEventsResponse.fromJson(resp.data as Map<String, dynamic>);
  }

  Future<OpeningHoursResponse> getEventOpeningHours({
    required String date,
    String locale = 'de_DE',
  }) async {
    final resp = await _client.bordPortal.get(
      '/api/ext/Aida.aidajsonwebservice/get-event-opening-hours'
      '/locale/$locale/date/$date',
    );
    return OpeningHoursResponse.fromJson(resp.data as Map<String, dynamic>);
  }

  // ─── My Vacation ──────────────────────────────────────────────────────────

  Future<TimetableResponse> getTimetable({
    required String folio,
    String locale = 'de_DE',
  }) async {
    final resp = await _client.extApi.get(
      '/api/ext/Aida.aidajsonwebservice/get-timetable'
      '/locale/$locale/account/$folio/-cabin',
    );
    return TimetableResponse.fromJson(resp.data as Map<String, dynamic>);
  }

  Future<ItineraryResponse> getItinerary({
    required String folio,
    required String cabin,
    String locale = 'de_DE',
  }) async {
    final resp = await _client.extApi.get(
      '/api/ext/Aida.aidajsonwebservice/get-itinerary'
      '/locale/$locale/account/$folio/cabin/$cabin',
    );
    return ItineraryResponse.fromJson(resp.data as Map<String, dynamic>);
  }

  Future<ExcursionResponse> getExcursions({
    required String folio,
    required String date,
    String locale = 'de_DE',
  }) async {
    final resp = await _client.extApi.get(
      '/api/ext/Aida.aidajsonwebservice/get-excursion'
      '/locale/$locale/folio-id/$folio/-port/date/$date',
    );
    return ExcursionResponse.fromJson(resp.data as Map<String, dynamic>);
  }

  // ─── Discover ─────────────────────────────────────────────────────────────

  Future<RestaurantsResponse> getRestaurantsAndBars({
    String locale = 'de_DE',
  }) async {
    final resp = await _client.extApi.get(
      '/api/ext/Aida.aidajsonwebservice/get-restaurants-and-bars/locale/$locale',
    );
    return RestaurantsResponse.fromJson(resp.data as Map<String, dynamic>);
  }

  Future<Map<String, dynamic>> getRestaurantDetail({
    required String venueCode,
    String locale = 'de_DE',
  }) async {
    final resp = await _client.extApi.get(
      '/api/ext/Aida.aidajsonwebservice/get-restaurant-detail'
      '/locale/$locale/venue-code/$venueCode',
    );
    return resp.data as Map<String, dynamic>;
  }

  Future<PoiListResponse> getPoiList({String locale = 'de_DE'}) async {
    final resp = await _client.extApi.get(
      '/api/ext/Aida.aidajsonwebservice/get-poi-list/locale/$locale/-categories',
    );
    return PoiListResponse.fromJson(resp.data as Map<String, dynamic>);
  }

  Future<PoiDetailResponse> getPoiDetail({
    required String code,
    String locale = 'de_DE',
  }) async {
    final resp = await _client.extApi.get(
      '/api/ext/Aida.aidajsonwebservice/get-poi-detail/locale/$locale/code/$code',
    );
    return PoiDetailResponse.fromJson(resp.data as Map<String, dynamic>);
  }

  Future<SpaListResponse> getSpaItems({String locale = 'de_DE'}) async {
    final resp = await _client.extApi.get(
      '/api/ext/CompeopleSpa.compeoplejsonwebservice/get-spa-items-list'
      '/locale/$locale/types/WELLNESS_OASE/-duration-groups/account/-cabin',
    );
    return SpaListResponse.fromJson(resp.data as Map<String, dynamic>);
  }

  Future<SpaDetailResponse> getSpaItemDetail({
    required String code,
    String locale = 'de_DE',
  }) async {
    final resp = await _client.extApi.get(
      '/api/ext/Aida.aidajsonwebservice/get-spaitem-detail'
      '/locale/$locale/code/$code/start-date/-/end-date/-',
    );
    return SpaDetailResponse.fromJson(resp.data as Map<String, dynamic>);
  }

  // ─── Account ──────────────────────────────────────────────────────────────

  Future<BalanceResponse> getBalance({
    required String folio,
    String locale = 'de_DE',
  }) async {
    final resp = await _client.extApi.get(
      '/api/ext/Aida.aidajsonwebservice/get-balance'
      '/locale/$locale/account/$folio/-descending',
    );
    return BalanceResponse.fromJson(resp.data as Map<String, dynamic>);
  }

  Future<EmailListResponse> getEmailList({
    required String cabin,
    required String folio,
  }) async {
    final resp = await _client.bordPortal.get(
      '/api/ext/Aida.aidajsonwebservice/get-email-list/user/$cabin/account/$folio',
    );
    return EmailListResponse.fromJson(resp.data as Map<String, dynamic>);
  }

  Future<GuestListResponse> getGuestList({
    required String folio,
    required String cabin,
    String locale = 'de_DE',
  }) async {
    final resp = await _client.bordPortal.get(
      '/api/ext/Aida.aidajsonwebservice/get-guest-list'
      '/locale/$locale/account/$folio/cabin/$cabin',
    );
    return GuestListResponse.fromJson(resp.data as Map<String, dynamic>);
  }

  Future<ChatConfigResponse> getChatConfig({required String folio}) async {
    const appId = 'f92a8c9b-0bcc-4f81-a122-aee9687b7840';
    final resp = await _client.chat.post(
      '/api/apps/public/$appId/api/v1/user/config',
    );
    return ChatConfigResponse.fromJson(resp.data as Map<String, dynamic>);
  }
}
