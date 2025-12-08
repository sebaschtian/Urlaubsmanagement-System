@EndUserText.label: 'Mitarbeiterdaten'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZSP_R_MITARBEITER
  as select from zsp_ma_a
  
  association [1..1] to ZSP_I_MITARBEITERTEXT as _MitarbeiterText on $projection.MitarbeiterID = _MitarbeiterText.MitarbeiterUuid
  composition [0..*] of ZSP_R_URLAUB as _Urlaub 
  composition [0..*] of ZSP_R_ANTRAG as _Antrag
  association [1..*] to ZSP_R_ANTRAG as _Antragsteller on $projection.MitarbeiterID = _Antragsteller.Antragsteller
  association [1..*] to ZSP_R_ANTRAG as _Genehmigender on $projection.MitarbeiterID = _Genehmigender.Genehmigender
  association [1..1] to ZSP_I_VERBRAUCHTETAGE as _verbrauchteUT on $projection.MitarbeiterID = _verbrauchteUT.mitarbeiter
  association [1..1] to ZSP_I_VERFUGBARETAGE as _verfugbareUT on $projection.MitarbeiterID = _verfugbareUT.Mitarbeiter
  association [1..1] to ZSP_I_VERPLANTETAGE as _verplanteUT on $projection.MitarbeiterID = _verplanteUT.mitarbeiter
  
{
  @ObjectModel.text.element: [ 'MitarbeiterName' ]
  key mitarbeiter_uuid   as MitarbeiterID,
      mitarbeiter_nummer as Mitarbeiternummer,
      vorname            as Vorname,
      nachname           as Nachname,
      eintrittsdatum     as Eintrittsdatum,

      /* Administrative Daten */
      last_changed_by    as LastChangedBy,
      created_by         as CreatedBy,
      created_at         as CreatedAt,
      last_changed_at    as LastChangedAt,
      
      /*Associations*/
      _Urlaub,
      _Antrag,
      _Antragsteller,
      _Genehmigender,
      
      _verbrauchteUT.VerbrauchteTage as VerbrauchteTage,
      _verfugbareUT.VerfugbareTage as VerfugbareTage,
      _verplanteUT.VerplanteTage as VerplanteTage,
      
      _MitarbeiterText.Name as MitarbeiterName
}
