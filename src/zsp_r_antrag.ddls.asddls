@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Antrags-daten'
define view entity ZSP_R_ANTRAG
  as select from zsp_antrag_a
  
  association to parent ZSP_R_MITARBEITER 
    as _Mitarbeiter on $projection.Antrag_ID
    = _Mitarbeiter.MitarbeiterID
{
  key antrag_uuid     as Antrag_ID,
      antragsteller   as Antragsteller,
      genehmigender   as Genehmigender,
      startdatum      as Startdatum,
      enddatum        as Enddatum,
      tage            as Urlaubstage,
      kommentar       as Kommentar,
      status          as Status,
      /* Administrative Daten */
      last_changed_by as LastChangedBy,
      created_by      as CreatedBy,
      created_at      as CreatedAt,
      last_changed_at as LastChangedAt,
      
      /*Association*/
      _Mitarbeiter
}
