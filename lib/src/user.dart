import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// A class that represents User.
@immutable
class User extends Equatable {
  /// Creates a User.
  const User({
    this.aangemaaktOp,
    this.naam,
    this.leeftijd,
    required this.id,
    this.telefoonnummer,
    this.fotoUrl,
    this.laatstGezien,
    this.fcm,
    this.metadata,
  });

  /// Creates User from a map (decoded JSON).
  User.fromJson(Map<String, dynamic> json)
      : aangemaaktOp = json['aangemaaktOp'] as DateTime?,
        naam = json['naam'] as String?,
        leeftijd = json['leeftijd'] as int?,
        id = json['id'] as String,
        telefoonnummer = json['telefoonnummer'] as String,
        fotoUrl = json['fotoUrl'] as String?,
        laatstGezien = json['laatstGezien'] as DateTime?,
        fcm = json['fcm'] as Set<dynamic>?,
        metadata = json['metadata'] as Map<String, dynamic>?;

  /// Converts User to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => {
        'aangemaaktOp': aangemaaktOp,
        'naam': naam,
        'leeftijd': leeftijd,
        'id': id,
        'telefoonnummer': telefoonnummer,
        'fotoUrl': fotoUrl,
        'laatstGezien': laatstGezien,
        'fcm': fcm,
        'metadata': metadata,
      };

  /// Creates a copy of the User with an updated data.
  /// [firstName], [imageUrl], [lastName], [laatstGezien] and [role] with
  /// null values will nullify existing values.
  /// [metadata] with null value will nullify existing metadata, otherwise
  /// both metadatas will be merged into one Map, where keys from a passed
  /// metadata will overwite keys from the previous one.
  User copyWith({
    DateTime? aangemaaktOp,
    String? naam,
    int? leeftijd,
    String? telefoonnummer,
    String? fotoUrl,
    DateTime? laatstGezien,
    Set<dynamic>? fcm,
    Map<String, dynamic>? metadata,
  }) {
    return User(
      aangemaaktOp: aangemaaktOp,
      naam: naam,
      leeftijd: leeftijd,
      id: id,
      telefoonnummer: telefoonnummer,
      fotoUrl: fotoUrl,
      laatstGezien: laatstGezien,
      fcm: fcm,
      metadata: metadata == null
          ? null
          : {
              ...this.metadata ?? {},
              ...metadata,
            },
    );
  }

  /// Equatable props
  @override
  List<Object?> get props => [
        aangemaaktOp,
        naam,
        leeftijd,
        id,
        telefoonnummer,
        fotoUrl,
        laatstGezien,
        fcm,
        metadata
      ];

  /// Created User timestamp, in ms
  final DateTime? aangemaaktOp;

  /// First name of the User
  final String? naam;

  final int? leeftijd;

  /// Unique ID of the User
  final String id;

  final String? telefoonnummer;

  /// Remote image URL representing User's avatar
  final String? fotoUrl;

  /// Timestamp when User was last visible, in ms
  final DateTime? laatstGezien;

  //Firebase Cloud Messaging information
  final Set<dynamic>? fcm;

  /// Additional custom metadata or attributes related to the User
  final Map<String, dynamic>? metadata;
}
