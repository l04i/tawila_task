import 'package:tawila_task/models/adress.dart';
import 'package:tawila_task/models/menu.dart';
import 'package:tawila_task/models/time.dart';

class Restaurant {
  final String id;
  final Address? address;
  final Menu? menu;
  final String? logoUrl;
  final String? photoUrl;
  final String? heroPhotoUrl;
  final String? locationMapUrl;
  final int? hygineRating;
  final String? rating;
  final int? affordability;
  final bool? hasReservation;
  final bool? hasOrder;
  final String? commissionRate;
  final int? baseDeliveryFee;
  final int? extraDeliveryFee;
  final int? adminFee;
  final String? averageDiningTime;
  final int? maxPeoplePerReservation;
  final int? reservationTimeInterval;
  final int? minOrderPrice;
  final bool? hasDelivery;
  final bool? hasCollection;
  final String slug;
  final String name;
  final String phoneNumber;
  final String email;
  final String description;
  final Hours? hours;
  final String? stripeAccountId;
  final bool? isActive;
  final int? manager;
  final List<int>? tags;

  Restaurant({
    required this.id,
    required this.slug,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.description,
    this.address,
    this.menu,
    this.logoUrl,
    this.photoUrl,
    this.heroPhotoUrl,
    this.locationMapUrl,
    this.hygineRating,
    this.rating,
    this.affordability,
    this.hasReservation,
    this.hasOrder,
    this.commissionRate,
    this.baseDeliveryFee,
    this.extraDeliveryFee,
    this.adminFee,
    this.averageDiningTime,
    this.maxPeoplePerReservation,
    this.reservationTimeInterval,
    this.minOrderPrice,
    this.hasDelivery,
    this.hasCollection,
    this.hours,
    this.stripeAccountId,
    this.isActive,
    this.manager,
    this.tags,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json['id'] as String,
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, dynamic>),
        menu: json['menu'] == null
            ? null
            : Menu.fromJson(json['menu'] as Map<String, dynamic>),
        logoUrl: json['logo_url'] as String?,
        photoUrl: json['photo_url'] as String?,
        heroPhotoUrl: json['hero_photo_url'] as String?,
        locationMapUrl: json['location_map_url'] as String?,
        hygineRating: json['hygine_rating'] as int?,
        rating: json['rating'] as String?,
        affordability: json['affordability'] as int?,
        hasReservation: json['has_reservation'] as bool?,
        hasOrder: json['has_order'] as bool?,
        commissionRate: json['commission_rate'] as String?,
        baseDeliveryFee: json['base_delivery_fee'] as int?,
        extraDeliveryFee: json['extra_delivery_fee'] as int?,
        adminFee: json['admin_fee'] as int?,
        averageDiningTime: json['average_dining_time'] as String?,
        maxPeoplePerReservation: json['max_people_per_reservation'] as int?,
        reservationTimeInterval: json['reservation_time_interval'] as int?,
        minOrderPrice: json['min_order_price'] as int?,
        hasDelivery: json['has_delivery'] as bool?,
        hasCollection: json['has_collection'] as bool?,
        slug: json['slug'] as String,
        name: json['name'] as String,
        phoneNumber: json['phone_number'] as String,
        email: json['email'] as String,
        description: json['description'] as String,
        hours: json['hours'] == null
            ? null
            : Hours.fromJson(json['hours'] as Map<String, dynamic>),
        stripeAccountId: json['stripe_account_id'] as String?,
        isActive: json['is_active'] as bool?,
        manager: json['manager'] as int?,
        tags:
            (json['tags'] as List<dynamic>?)?.map((tag) => tag as int).toList(),
      );
}
