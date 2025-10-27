@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Protection view urlaub'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSP_C_URLAUB 
    as projection on ZSP_R_URLAUB
{
    key UrlaubUuid,
        Startdatum,
        Enddatum,
        Tage,
        Genehmigender,
        Kommentar,
        Status,
  
    /*AD DATA*/
    LastChangedBy,
    CreatedBy,
    CreatedAt,
    LastChangedAt
}
