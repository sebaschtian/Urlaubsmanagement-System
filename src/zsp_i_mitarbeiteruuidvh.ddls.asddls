@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VH Mitarbeiter uuid'
define view entity ZSP_I_MITARBEITERUUIDVH 
    as select from zsp_ma_a
{
    @EndUserText: {label: 'Mitarebiter uuid', quickInfo: 'Mitarbeiter uuid'}
    key mitarbeiter_uuid as MitarbeiterID,
    
    @EndUserText: {label: 'Mitarbeiter ID', quickInfo: 'Mitarbeiter ID'}
    mitarbeiter_nummer as Mitarbeiternummer,
    
    @EndUserText: {label: 'Vorname', quickInfo: 'Vorname'}
    vorname as Vorname,
    
    @EndUserText: {label: 'Nachname', quickInfo: 'Nachname'}
    nachname as Nachname    
}
