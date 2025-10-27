@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Antrags-daten'
define root view  entity ZSP_R_ANTRAG
  as select from zsp_antrag_a

{
    key antrag_uuid as Antrag_ID,
    /*key client as Mitarbeiter,*/
        antrag_date as Antrag_Datum,
        urlaub_uuid as Urlaub_ID
}
