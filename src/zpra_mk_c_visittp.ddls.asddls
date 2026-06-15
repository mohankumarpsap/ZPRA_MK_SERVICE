@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZPRA_MK_R_VISIT'
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZPRA_MK_C_VISITTP
  as projection on ZPRA_MK_R_VISIT
{
          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 0.90
  key     Uuid,
          ParentUuid,
          @ObjectModel.text.element: ['VisitorName']
          @Search.defaultSearchElement: true
          @Consumption.valueHelpDefinition: [
            { entity: {
                name: 'ZPRA_MK_I_Visitor',
                element: 'VisitorId' },
              additionalBinding: [ {
                localElement: 'VisitorEmail',
                element: 'VisitorEmail',
                usage: #FILTER_AND_RESULT }],
              useForValidation: true }]
          VisitorUuid,
          _VisitorVH.VisitorName          as VisitorName,
          _VisitorVH.VisitorEmail         as VisitorEmail,

          _MusicFestival.Title         as MusicFestivalTitle,
          _MusicFestival.EventDateTime as MusicFestivalEventDateTime,

          ArtistIndicator,

          @ObjectModel.text.element: ['StatusText']
          @Consumption.valueHelpDefinition: [{entity: {name: 'ZPRA_MK_I_Visit_Status_VH', element: 'Value' }}]
          Status,
          _Status.Description             as StatusText,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_PRA_MK_CALC_VISIT_ELEMENTS'
  virtual StatusCriticality : abap.int4,

          LocalLastChangedAt,

          /* Associations */
          _MusicFestival : redirected to parent ZPRA_Mk_C_MusicFestivalTP,
          _Visitor          : redirected to ZPRA_Mk_C_VisitorTP,
          _VisitorVH
}
