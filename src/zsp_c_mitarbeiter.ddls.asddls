@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view Mitarbeiter'
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZSP_C_MITARBEITER
  as projection on ZSP_R_MITARBEITER
{
  key MitarbeiterID,
      Mitarbeiternummer,
      Vorname,
      Nachname,
      Eintrittsdatum,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      
      /*AD DATA*/
      LastChangedBy,
      CreatedBy,
      CreatedAt,
      LastChangedAt
}
