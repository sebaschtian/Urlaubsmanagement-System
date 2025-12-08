@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Protection view urlaub'
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZSP_C_URLAUB
  as projection on ZSP_R_URLAUB
{
  key UrlaubID,
      Mitarbeiter,
      Jahr,
      Urlaubstage,

      /*AD DATA*/
      LastChangedBy,
      CreatedBy,
      CreatedAt,
      LastChangedAt,
      
      MitarbeiterName,
      
      /*Associations*/
      _Mitarbeiter : redirected to parent ZSP_C_MITARBEITER
}
