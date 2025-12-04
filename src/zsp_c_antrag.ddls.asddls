@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view ANTRAG'
@Metadata.allowExtensions: true
define view entity ZSP_C_ANTRAG
  as projection on ZSP_R_ANTRAG
{
  key Antrag_ID,
      Antragsteller,
      Genehmigender,
      Startdatum,
      Enddatum,
      Urlaubstage,
      Kommentar,
      Status,

      /*AD DATA*/
      LastChangedBy,
      CreatedBy,
      CreatedAt,
      LastChangedAt,
      
      /*Associations*/
      _Mitarbeiter : redirected to parent ZSP_C_MITARBEITER

}
