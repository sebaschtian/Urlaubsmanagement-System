@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Urlaubs-daten'
define view entity ZSP_R_URLAUB
  as select from zsp_urlaub_a
  
  association to ZSP_R_MITARBEITER 
    as _Mitarbeiter on $projection.Mitarbeiter = _Mitarbeiter.MitarbeiterID

{
  key urlaub_uuid     as UrlaubID,
      mitarbeiter     as Mitarbeiter,
      jahr            as Jahr,
      urlaubstage     as Urlaubstage,

      /* Administrative Daten */
      last_changed_by as LastChangedBy,
      created_by      as CreatedBy,
      created_at      as CreatedAt,
      last_changed_at as LastChangedAt,
    
      /*Association*/
      _Mitarbeiter
}
