@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view ANTRAG'
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZSP_C_ANTRAG
  as projection on ZSP_R_ANTRAG
{
  key Antrag_ID,
      Genehmigender,
      Startdatum,
      Enddatum,
      Urlaubstage,
      Kommentar,
      Status,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7

      /*AD DATA*/
      LastChangedBy,
      CreatedBy,
      CreatedAt,
      LastChangedAt

}
