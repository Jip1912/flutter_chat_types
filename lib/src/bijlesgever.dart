import 'package:flutter_chat_types/src/user.dart';
import 'package:meta/meta.dart';

/// A class that represents Bijlesgever.
@immutable
class Bijlesgever extends User {
  /// Creates a Bijlesgever.
  const Bijlesgever(
      {DateTime? aangemaaktOp,
      String? naam,
      int? leeftijd,
      required String id,
      String? telefoonnummer,
      String? fotoUrl,
      DateTime? laatstGezien,
      Map<String, DateTime>? fcm,
      Map<String, dynamic>? metadata,
      this.vakken,
      this.uurloon,
      this.beschrijving,
      this.location,
      this.radius})
      : super(
            aangemaaktOp: aangemaaktOp,
            naam: naam,
            leeftijd: leeftijd,
            id: id,
            telefoonnummer: telefoonnummer,
            fotoUrl: fotoUrl,
            laatstGezien: laatstGezien,
            fcm: fcm,
            metadata: metadata);

  /// Creates Bijlesgever from a map (decoded JSON).
  Bijlesgever.fromJson(Map<String, dynamic> json)
      : vakken = json['vakken'] as List<String>?,
        uurloon = json['uurloon'] as int?,
        beschrijving = json['beschrijving'] as String,
        location = json['location'] as dynamic,
        radius = json['radius'] as double,
        super.fromJson(json);

  /// Converts Bijlesgever to the map representation, encodable to JSON.
  // @override
  Map<String, dynamic> toJson() => {
        'aangemaaktOp': aangemaaktOp,
        'naam': naam,
        'leeftijd': leeftijd,
        'id': id,
        'telefoonnummer': telefoonnummer,
        'fotoUrl': fotoUrl,
        'laatstGezien': laatstGezien,
        'fcm': fcm,
        'vakken': vakken,
        'uurloon': uurloon,
        'beschrijving': beschrijving,
        'location': location,
        'radius': radius,
        'metadata': metadata,
      };

  /// Creates a copy of the Bijlesgever with an updated data.
  /// [firstName], [imageUrl], [lastName], [laatstGezien] and [role] with
  /// null values will nullify existing values.
  /// [metadata] with null value will nullify existing metadata, otherwise
  /// both metadatas will be merged into one Map, where keys from a passed
  /// metadata will overwite keys from the previous one.
  @override
  Bijlesgever copyWith({
    DateTime? aangemaaktOp,
    String? naam,
    int? leeftijd,
    String? telefoonnummer,
    String? fotoUrl,
    DateTime? laatstGezien,
    Map<String, DateTime>? fcm,
    List<String>? vakken,
    int? uurloon,
    String? beschrijving,
    dynamic location,
    double? radius,
    Map<String, dynamic>? metadata,
  }) {
    return Bijlesgever(
      aangemaaktOp: aangemaaktOp,
      naam: naam,
      leeftijd: leeftijd,
      id: id,
      telefoonnummer: telefoonnummer,
      fotoUrl: fotoUrl,
      laatstGezien: laatstGezien,
      fcm: fcm,
      vakken: vakken,
      uurloon: uurloon,
      beschrijving: beschrijving,
      location: location,
      radius: radius,
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
        vakken,
        uurloon,
        beschrijving,
        location,
        radius,
        metadata
      ];

  final List<String>? vakken;

  final int? uurloon;

  final String? beschrijving;

  final dynamic location;

  final double? radius;
}
