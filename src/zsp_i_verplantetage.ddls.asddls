@AbapCatalog.sqlViewName: 'ZSP_I_VERPLANTE'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface der Verplanten Tage'
define view ZSP_I_VERPLANTETAGE as select from zsp_antrag_a
{
    antragsteller_uuid as mitarbeiter,
    
    sum(
        case when startdatum > $session.user_date
             then tage
             else 0
        end) as VerplanteTage
}
where status <> 'A'
group by antragsteller_uuid;
