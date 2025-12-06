@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help Antrag'
@AbapCatalog.sqlViewName: 'ZSP_I_ANTRAG'
define view ZSP_I_ANTRAGVH
  as select from zsp_antrag_a /*Irgendwo Einfügen*/
{
  key antrag_uuid        as AntragUuid,
      antragsteller_uuid as AntragstellerUuid,
      genehmigender_uuid as GenehmigenderUuid,
      startdatum         as Startdatum,
      enddatum           as Enddatum,
      tage               as Tage,
      kommentar          as Kommentar,
      status             as Status,
      last_changed_by    as LastChangedBy,
      created_by         as CreatedBy,
      created_at         as CreatedAt,
      last_changed_at    as LastChangedAt
}
