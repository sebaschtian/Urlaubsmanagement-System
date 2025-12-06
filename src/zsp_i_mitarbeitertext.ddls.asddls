@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mitarbeiter Name'
@AbapCatalog.sqlViewName: 'ZSP_MATEXT'
define view ZSP_I_MITARBEITERTEXT 
    as select from zsp_ma_a /*Sollte Datenbank sein*/
{
    key mitarbeiter_uuid    as MitarbeiterUuid,
        vorname             as Vorname,
        nachname            as Nachname,
    
    concat_with_space(vorname, nachname, 1) as Name    
}
