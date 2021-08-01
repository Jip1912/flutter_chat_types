import 'package:equatable/equatable.dart';
import 'package:flutter_chat_types/src/user.dart';
import 'package:meta/meta.dart';


/// A class that represents Bijleszoeker.
@immutable
class Bijleszoeker extends User {
  /// Creates a Bijleszoeker.
  const Bijleszoeker({
    DateTime? aangemaaktOp,
    String? naam,
    int? leeftijd,
    required String id,
    String? telefoonnummer,
    String? fotoUrl,
    DateTime? laatstGezien,
    Map<String, dynamic>? metadata,
    this.schoolniveau
  }) : super(aangemaaktOp: aangemaaktOp, naam: naam, leeftijd: leeftijd, id: id, telefoonnummer: telefoonnummer, 
              fotoUrl: fotoUrl, laatstGezien: laatstGezien, metadata: metadata);

  /// Creates Bijleszoeker from a map (decoded JSON).
  Bijleszoeker.fromJson(Map<String, dynamic> json)
      : schoolniveau = json['schoolniveau'] as String?,
        super.fromJson(json);

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
    DateTime? aangemaaktOp,
    String? naam,
    int? leeftijd,
    String? telefoonnummer,
    String? fotoUrl,
    DateTime? laatstGezien,
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

  final String? schoolniveau;
}
