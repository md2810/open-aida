import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/aida_client.dart';
import '../api/aida_api.dart';
import '../models/ship_config.dart';
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
import 'package:intl/intl.dart';

// ─── Infrastructure ──────────────────────────────────────────────────────────

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final secureStorageProvider = Provider<FlutterSecureStorage>(
  (ref) => const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  ),
);

final aidaClientProvider = Provider<AidaClient>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  final storage = ref.watch(secureStorageProvider);
  return AidaClient(storage, prefs);
});

final aidaApiProvider = Provider<AidaApi>((ref) {
  return AidaApi(ref.watch(aidaClientProvider));
});

// ─── Ship Detection ──────────────────────────────────────────────────────────

final shipNameProvider = StateProvider<String?>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return prefs.getString(ShipConfig.prefKey);
});

// ─── Auth ─────────────────────────────────────────────────────────────────────

final authStateProvider = StateProvider<Guest?>((ref) => null);

final isLoggedInProvider = Provider<bool>((ref) {
  return ref.watch(authStateProvider) != null;
});

// ─── Ship Data (auto-refresh 60s) ─────────────────────────────────────────────

final shipDataProvider =
    FutureProvider.autoDispose<ShipDataResponse>((ref) async {
  final api = ref.watch(aidaApiProvider);
  return api.getShipData();
});

// ─── Board Time ───────────────────────────────────────────────────────────────

final boardTimeProvider =
    FutureProvider.autoDispose<Map<String, dynamic>>((ref) async {
  final api = ref.watch(aidaApiProvider);
  return api.getBoardTime();
});

// ─── Daily Events ─────────────────────────────────────────────────────────────

final selectedDateProvider = StateProvider<DateTime>((ref) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
});

final dailyEventsProvider =
    FutureProvider.autoDispose<DailyEventsResponse>((ref) async {
  final api = ref.watch(aidaApiProvider);
  final date = ref.watch(selectedDateProvider);
  final fmt = DateFormat('yyyyMMddHHmmss');
  return api.getDailyEvents(date: fmt.format(date));
});

final openingHoursProvider =
    FutureProvider.autoDispose<OpeningHoursResponse>((ref) async {
  final api = ref.watch(aidaApiProvider);
  final date = ref.watch(selectedDateProvider);
  final fmt = DateFormat('yyyyMMdd000000');
  return api.getEventOpeningHours(date: fmt.format(date));
});

// ─── My Vacation ──────────────────────────────────────────────────────────────

final timetableProvider =
    FutureProvider.autoDispose<TimetableResponse>((ref) async {
  final api = ref.watch(aidaApiProvider);
  final guest = ref.watch(authStateProvider);
  if (guest?.folio == null) throw Exception('Not logged in');
  return api.getTimetable(folio: guest!.folio!);
});

final itineraryProvider =
    FutureProvider.autoDispose<ItineraryResponse>((ref) async {
  final api = ref.watch(aidaApiProvider);
  final guest = ref.watch(authStateProvider);
  if (guest?.folio == null || guest?.cabin == null) {
    throw Exception('Not logged in');
  }
  return api.getItinerary(folio: guest!.folio!, cabin: guest.cabin!);
});

final excursionsProvider =
    FutureProvider.autoDispose<ExcursionResponse>((ref) async {
  final api = ref.watch(aidaApiProvider);
  final guest = ref.watch(authStateProvider);
  if (guest?.folio == null) throw Exception('Not logged in');
  final fmt = DateFormat('yyyyMMdd');
  return api.getExcursions(
    folio: guest!.folio!,
    date: fmt.format(DateTime.now()),
  );
});

// ─── Discover ─────────────────────────────────────────────────────────────────

final restaurantsProvider =
    FutureProvider.autoDispose<RestaurantsResponse>((ref) async {
  final api = ref.watch(aidaApiProvider);
  return api.getRestaurantsAndBars();
});

final poiListProvider =
    FutureProvider.autoDispose<PoiListResponse>((ref) async {
  final api = ref.watch(aidaApiProvider);
  return api.getPoiList();
});

final spaItemsProvider =
    FutureProvider.autoDispose<SpaListResponse>((ref) async {
  final api = ref.watch(aidaApiProvider);
  return api.getSpaItems();
});

// ─── Account ──────────────────────────────────────────────────────────────────

final balanceProvider =
    FutureProvider.autoDispose<BalanceResponse>((ref) async {
  final api = ref.watch(aidaApiProvider);
  final guest = ref.watch(authStateProvider);
  if (guest?.folio == null) throw Exception('Not logged in');
  return api.getBalance(folio: guest!.folio!);
});

final emailListProvider =
    FutureProvider.autoDispose<EmailListResponse>((ref) async {
  final api = ref.watch(aidaApiProvider);
  final guest = ref.watch(authStateProvider);
  if (guest?.folio == null || guest?.cabin == null) {
    throw Exception('Not logged in');
  }
  return api.getEmailList(folio: guest!.folio!, cabin: guest.cabin!);
});

final guestListProvider =
    FutureProvider.autoDispose<GuestListResponse>((ref) async {
  final api = ref.watch(aidaApiProvider);
  final guest = ref.watch(authStateProvider);
  if (guest?.folio == null || guest?.cabin == null) {
    throw Exception('Not logged in');
  }
  return api.getGuestList(folio: guest!.folio!, cabin: guest.cabin!);
});
