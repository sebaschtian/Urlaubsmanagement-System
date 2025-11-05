@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Protection view urlaub'
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZSP_C_URLAUB
  as projection on ZSP_R_URLAUB
{
  key UrlaubID,
      Mitarbeiter,
      Jahr,
      Urlaubstage,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7

      /*AD DATA*/
      LastChangedBy,
      CreatedBy,
      CreatedAt,
      LastChangedAt
}
