import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


/// A class that represents Bijleszoeker.
@immutable
class Bijleszoeker extends Equatable {
  /// Creates a Bijleszoeker.
  const Bijleszoeker({
    this.aangemaaktOp,
    this.naam,
    this.leeftijd,
    required this.id,
    this.telefoonnummer,
    this.fotoUrl,
    this.laatstGezien,
    this.schoolniveau,
    this.metadata,
  });

  /// Creates Bijleszoeker from a map (decoded JSON).
  Bijleszoeker.fromJson(Map<String, dynamic> json)
      : aangemaaktOp = json['aangemaaktOp'] as int?,
        naam = json['naam'] as String?,
        leeftijd = json['leeftijd'] as int?,
        id = json['id'] as String,
        telefoonnummer = json['telefoonnummer'] as String,
        fotoUrl = json['fotoUrl'] as String?,
        laatstGezien = json['laatstGezien'] as int?,
        schoolniveau = json['schoolniveau'] as String?,
        metadata = json['metadata'] as Map<String, dynamic>?;

  /// Converts Bijleszoeker to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => {
        'aangemaaktOp': aangemaaktOp,
        'naam': naam,
        'leeftijd': leeftijd,
        'id': id,
        'telefoonnummer': telefoonnummer,
        'fotoUrl': fotoUrl,
        'laatstGezien': laatstGezien,
        'schoolniveau': schoolniveau,
        'metadata': metadata,
      };

  /// Creates a copy of the Bijleszoeker with an updated data.
  /// [firstName], [imageUrl], [lastName], [laatstGezien] and [role] with
  /// null values will nullify existing values.
  /// [metadata] with null value will nullify existing metadata, otherwise
  /// both metadatas will be merged into one Map, where keys from a passed
  /// metadata will overwite keys from the previous one.
  Bijleszoeker copyWith({
    int? aangemaaktOp,
    String? naam,
    int? leeftijd,
    String? telefoonnummer,
    String? fotoUrl,
    int? laatstGezien,
    String? schoolniveau,
    Map<String, dynamic>? metadata,
  }) {
    return Bijleszoeker(
      aangemaaktOp: aangemaaktOp,
      naam: naam,
      leeftijd: leeftijd,
      id: id,
      telefoonnummer: telefoonnummer,
      fotoUrl: fotoUrl,
      laatstGezien: laatstGezien,
      schoolniveau: schoolniveau,
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
  List<Object?> get props =>
      [aangemaaktOp, naam, leeftijd, id, telefoonnummer, fotoUrl, laatstGezien, schoolniveau, metadata];

  /// Created Bijleszoeker timestamp, in ms
  final int? aangemaaktOp;

  /// First name of the Bijleszoeker
  final String? naam;

  final int? leeftijd;

  /// Unique ID of the Bijleszoeker
  final String id;

  final String? telefoonnummer;

  /// Remote image URL representing Bijleszoeker's avatar
  final String? fotoUrl;

  /// Timestamp when Bijleszoeker was last visible, in ms
  final int? laatstGezien;
  
  final String? schoolniveau;

  /// Additional custom metadata or attributes related to the Bijleszoeker
  final Map<String, dynamic>? metadata;
}
