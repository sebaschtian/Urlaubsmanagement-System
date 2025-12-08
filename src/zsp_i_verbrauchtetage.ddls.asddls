@AbapCatalog.sqlViewName: 'ZSP_I_VERBRAUCHT'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Verbrauchte Tage'
define view ZSP_I_VERBRAUCHTETAGE as select from zsp_antrag_a
{
    antragsteller_uuid as mitarbeiter,
    
    sum(
        case when enddatum > $session.user_date and startdatum < $session.user_date
            then
                dats_days_between(startdatum, enddatum)
            when enddatum < $session.user_date and startdatum < $session.user_date
              then tage
              
           else 0
    end)
    as VerbrauchteTage
}

where status = 'G'
group by antragsteller_uuid;
