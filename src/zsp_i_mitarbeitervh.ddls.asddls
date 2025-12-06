@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VH Mitarbeiter'
@AbapCatalog.sqlViewName: 'ZSP_I_MITARBEIT'
define view ZSP_I_MitarbeiterVH 
    as select from zsp_ma_a
{
    key mitarbeiter_uuid as MitarbeiterUuid,
    mitarbeiter_nummer as MitarbeiterNummer,
    vorname as Vorname,
    nachname as Nachname,
    
    concat_with_space(vorname, nachname, 1) as Name
}
