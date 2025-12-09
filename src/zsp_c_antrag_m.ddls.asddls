

@Search.searchable: true
@Metadata.allowExtensions: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Antrag Manager'

define view entity ZSP_C_ANTRAG_M 
    as projection on ZSP_R_ANTRAG
{
    key Antrag_ID,
        Antragsteller,
      
        Genehmigender,
    
        Startdatum,
        Enddatum,
        Urlaubstage,
        @Search.defaultSearchElement: true
        @Search.fuzzinessThreshold: 0.7
        Kommentar,
        @ObjectModel.text.element: [ 'TextStatus' ]
        Status,
        TextStatus,
        
        LastChangedBy,
        CreatedBy,
        CreatedAt,
        LastChangedAt,
    
    /* Associations */
    @Consumption.valueHelpDefinition: [{ entity: {name: 'zsp_i_mitarbeitertext', element: 'Name'} }]
    AntragstellerName,
    GenehmigenderName,
    
    
    _Antragsteller : redirected to parent ZSP_C_MITARBEITER_M,
    _Genehmigender : redirected to ZSP_C_MITARBEITER_M 
    
}
