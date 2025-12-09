@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Antrags-daten'
define view entity ZSP_R_ANTRAG
  as select from zsp_antrag_a
  
  association to parent ZSP_R_MITARBEITER as _Antragsteller on $projection.Antragsteller = _Antragsteller.MitarbeiterID
  association [1..1] to ZSP_R_MITARBEITER as _Genehmigender on $projection.Genehmigender = _Genehmigender.MitarbeiterID
  association [1..1] to ZSP_I_MITARBEITERTEXT as _NameAntragsteller on $projection.Antragsteller = _NameAntragsteller.MitarbeiterUuid
  association [1..1] to ZSP_I_MITARBEITERTEXT as _NameGenehmigender on $projection.Genehmigender = _NameGenehmigender.MitarbeiterUuid
  association to ZSP_I_STATUSVH as _StatusText on $projection.Antrag_ID = _StatusText.antrag_uuid
{
  key antrag_uuid     as Antrag_ID,
      antragsteller_uuid   as Antragsteller,
      genehmigender_uuid   as Genehmigender,
      startdatum      as Startdatum,
      enddatum        as Enddatum,
      tage            as Urlaubstage,
      kommentar       as Kommentar,
      status          as Status,
      
      /* Administrative Daten */
      last_changed_by as LastChangedBy,
      created_by      as CreatedBy,
      created_at      as CreatedAt,
      last_changed_at as LastChangedAt,
      
      /*Association*/
      _Antragsteller,
      _Genehmigender,
      
      _NameAntragsteller.Name as AntragstellerName,
      _NameGenehmigender.Name as GenehmigenderName,
      _StatusText.status as TextStatus
}
