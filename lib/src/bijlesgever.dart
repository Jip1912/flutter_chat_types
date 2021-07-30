import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


/// A class that represents Bijlesgever.
@immutable
class Bijlesgever extends Equatable {
  /// Creates a Bijlesgever.
  const Bijlesgever({
    this.aangemaaktOp,
    this.naam,
    this.leeftijd,
    required this.id,
    this.telefoonnummer,
    this.fotoUrl,
    this.laatstGezien,
    this.vakken,
    this.uurloon,
    this.beschrijving,
    this.metadata,
  });

  /// Creates Bijlesgever from a map (decoded JSON).
  Bijlesgever.fromJson(Map<String, dynamic> json)
      : aangemaaktOp = json['aangemaaktOp'] as int?,
        naam = json['naam'] as String?,
        leeftijd = json['leeftijd'] as int?,
        id = json['id'] as String,
        telefoonnummer = json['telefoonnummer'] as String,
        fotoUrl = json['fotoUrl'] as String?,
        laatstGezien = json['laatstGezien'] as int?,
        vakken = json['vakken'] as List<String>?,
        uurloon = json['uurloon'] as int?,
        beschrijving = json['beschrijving'] as String,
        metadata = json['metadata'] as Map<String, dynamic>?;

  /// Converts Bijlesgever to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => {
        'aangemaaktOp': aangemaaktOp,
        'naam': naam,
        'leeftijd': leeftijd,
        'id': id,
        'telefoonnummer': telefoonnummer,
        'fotoUrl': fotoUrl,
        'laatstGezien': laatstGezien,
        'vakken': vakken,
        'uurloon': uurloon,
        'beschrijving': beschrijving,
        'metadata': metadata,
      };

  /// Creates a copy of the Bijlesgever with an updated data.
  /// [firstName], [imageUrl], [lastName], [laatstGezien] and [role] with
  /// null values will nullify existing values.
  /// [metadata] with null value will nullify existing metadata, otherwise
  /// both metadatas will be merged into one Map, where keys from a passed
  /// metadata will overwite keys from the previous one.
  Bijlesgever copyWith({
    int? aangemaaktOp,
    String? naam,
    int? leeftijd,
    String? telefoonnummer,
    String? fotoUrl,
    int? laatstGezien,
    List<String>? vakken,
    int? uurloon,
    String? beschrijving,
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
      vakken: vakken,
      uurloon: uurloon,
      beschrijving: beschrijving,
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
      [aangemaaktOp, naam, leeftijd, id, telefoonnummer, fotoUrl, laatstGezien, vakken, uurloon, beschrijving, metadata];

  /// Created Bijlesgever timestamp, in ms
  final int? aangemaaktOp;

  /// First name of the Bijlesgever
  final String? naam;

  final int? leeftijd;

  /// Unique ID of the Bijlesgever
  final String id;

  final String? telefoonnummer;

  /// Remote image URL representing Bijlesgever's avatar
  final String? fotoUrl;

  /// Timestamp when Bijlesgever was last visible, in ms
  final int? laatstGezien;
  
  final List<String>? vakken;

  final int? uurloon;

  final String? beschrijving;

  /// Additional custom metadata or attributes related to the Bijlesgever
  final Map<String, dynamic>? metadata;
}
