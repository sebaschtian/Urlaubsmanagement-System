@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help Status'

define view entity ZSP_I_STATUSVH 
    as select from zsp_antrag_a
{
    key antrag_uuid,
        status,
    
    case
        when status = 'B' then 'Beantragt'
        when status = 'A' then 'Abgelehnt'
        when status = 'G' then 'Genehmigt'
        else ''
    end as StatusText
}
