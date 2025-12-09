
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mitarbeiter Manager'

define root view entity ZSP_C_MITARBEITER_M provider contract transactional_query
    as projection on ZSP_R_MITARBEITER
{
    key MitarbeiterID,
        Mitarbeiternummer,
        Vorname,
        Nachname,
        Eintrittsdatum,
        LastChangedBy,
        CreatedBy,
        CreatedAt,
        LastChangedAt,
        VerbrauchteTage,
        VerfugbareTage,
        VerplanteTage,
        MitarbeiterName,
        
        /* Associations */
        _Antrag
}
