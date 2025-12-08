@AbapCatalog.sqlViewName: 'ZSP_VERFUGBARE'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Verfugbare Tage'
define view ZSP_I_VERFUGBARETAGE as select from zsp_antrag_a

    association [1..1] to ZSP_I_VERPLANTETAGE as _verplantut 
        on $projection.Mitarbeiter = _verplantut.mitarbeiter
        
    association [1..1] to ZSP_I_VERBRAUCHTETAGE as _verbrauchtut 
        on $projection.Mitarbeiter = _verbrauchtut.mitarbeiter

{
    key antragsteller_uuid as Mitarbeiter,
    sum(tage) - coalesce(_verbrauchtut.VerbrauchteTage, 0) 
        - coalesce(_verplantut.VerplanteTage, 0) as VerfugbareTage
}

group by
    antragsteller_uuid,
    tage,
    _verplantut.VerplanteTage,
    _verbrauchtut.VerbrauchteTage
    
//   (Berechnet Restlich Verfügbaren Urlaubstage)
