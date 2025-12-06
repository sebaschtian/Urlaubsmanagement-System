@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view ANTRAG'
@Metadata.allowExtensions: true
define view entity ZSP_C_ANTRAG
  as projection on ZSP_R_ANTRAG
{
  key Antrag_ID,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'ZSP_I_MitarbeiterUuidVH', element: 'MitarbeiterID'}  }]
      Antragsteller,
      AntragstellerName,
      Genehmigender,
      GenehmigenderName,
      Startdatum,
      Enddatum,
      Urlaubstage,
      Kommentar,
      @ObjectModel.text.element: [ 'status' ]
      Status,
      StatusText,

      /*AD DATA*/
      LastChangedBy,
      CreatedBy,
      CreatedAt,
      LastChangedAt,
      
      /*Associations*/
      _Antragsteller : redirected to parent ZSP_C_MITARBEITER,
      _Genehmigender : redirected to ZSP_C_MITARBEITER

}
