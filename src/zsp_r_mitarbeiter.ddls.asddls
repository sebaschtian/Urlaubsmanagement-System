@EndUserText.label: 'Mitarbeiterdaten'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZSP_R_MITARBEITER
  as select from zsp_ma_a
{
  key mitarbeiter_uuid   as MitarbeiterID,
      mitarbeiter_nummer as Mitarbeiternummer,
      vorname            as Vorname,
      nachname           as Nachname,
      eintrittsdatum     as Eintrittsdatum,

      /* Administrative Daten */
      last_changed_by    as LastChangedBy,
      created_by         as CreatedBy,
      created_at         as CreatedAt,
      last_changed_at    as LastChangedAt
}
