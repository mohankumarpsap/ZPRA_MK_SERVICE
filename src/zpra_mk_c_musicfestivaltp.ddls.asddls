@Metadata.allowExtensions: true
@EndUserText.label: 'Music Fest Manage App'
@AccessControl.authorizationCheck: #NOT_REQUIRED //#CHECK
//@ObjectModel.sapObjectNodeType.name: 'ZPRA_MK_A_MF'
//@ObjectModel.semanticKey: ['Title']
define root view entity ZPRA_MK_C_MUSICFESTIVALTP
  provider contract transactional_query
  as projection on ZPRA_MK_R_MUSICFESTIVAL as _music
  association to ZPRA_MK_AE_REMOTE_PROJ as _proj on _proj.ProjectID = _music.project_id
{
  key     Uuid,
          Title,
          Description,
          EventDateTime,
          MaxVisitorsNumber,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_PRA_MK_CALC_MF_ELEMENTS'
  virtual BookedSeats       : abap.int4,
          FreeVisitorSeats,
          VisitorsFeeAmount,
          @Semantics.currencyCode: true
          VisitorsFeeCurrency,

          @ObjectModel.text.element: ['StatusText']
          @Consumption.valueHelpDefinition: [{entity: {name: 'ZPRA_MK_I_Music_Fest_Status_VH', element: 'Value' }, useForValidation: true}]
          Status,
          _Status.Description as StatusText,

          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_PRA_MK_CALC_MF_ELEMENTS'
  virtual StatusCriticality : abap.int4,

          CreatedBy,
          CreatedAt,
          LastChangedAt,
          LastChangedBy,
          LocalLastChangedAt,

          project_id,
          @UI.hidden: false
          @ObjectModel.filter.enabled: false
          @ObjectModel.sort.enabled: false
          _proj,
          _Visits : redirected to composition child ZPRA_MK_C_VISITTP

}
