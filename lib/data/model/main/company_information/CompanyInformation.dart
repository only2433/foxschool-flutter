
import 'package:freezed_annotation/freezed_annotation.dart';
part 'CompanyInformation.freezed.dart';
part 'CompanyInformation.g.dart';

@freezed
class CompanyInformation with _$CompanyInformation
{
  factory CompanyInformation({

    @Default("")
    String ceo,

    @Default("")
    String address,

    @JsonKey(name: 'brn')
    @Default("")
    String companyRegistrationNumber,

    @JsonKey(name: 'mosrn')
    @Default("")
    String salesRegistration,

    @JsonKey(name: 'ecn_number')
    @Default("")
    String electronicPublication,

    @Default("")
    String phone,

    @Default("")
    String fax,

  }) = _CompanyInformation;

  factory CompanyInformation.fromJson(Map<String, dynamic> data) => _$CompanyInformationFromJson(data);
}