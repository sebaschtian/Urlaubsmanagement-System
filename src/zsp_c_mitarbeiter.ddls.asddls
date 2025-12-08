@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view Mitarbeiter'
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZSP_C_MITARBEITER
provider contract transactional_query
  as projection on ZSP_R_MITARBEITER
{
  key MitarbeiterID,
  
      
      Mitarbeiternummer,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Vorname,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Nachname,
      
      Eintrittsdatum,

      
      /*AD DATA*/
      LastChangedBy,
      CreatedBy,
      CreatedAt,
      LastChangedAt,
      
      MitarbeiterName,
      
      VerbrauchteTage,
      VerfugbareTage,
      VerplanteTage,
      
      
      /*Associations*/
      _Urlaub : redirected to composition child ZSP_C_URLAUB,
      _Antrag : redirected to composition child ZSP_C_ANTRAG
}
