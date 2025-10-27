@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Urlaubs-daten'
define root view  entity ZSP_R_URLAUB
  as select from zsp_urlaub_a

{
  key urlaub_uuid as UrlaubUuid,
  startdatum      as Startdatum,
  enddatum        as Enddatum,
  tage            as Tage,
  genehmigender   as Genehmigender,
  kommentar       as Kommentar,
  status          as Status,
  
  /* Administrative Daten */
  last_changed_by as LastChangedBy,
  created_by      as CreatedBy,
  created_at      as CreatedAt,
  last_changed_at as LastChangedAt
  
}
