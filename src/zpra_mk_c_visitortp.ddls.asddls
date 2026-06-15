@Metadata.allowExtensions: true
@EndUserText.label: 'Manage Visitor App'
@AccessControl.authorizationCheck: #NOT_REQUIRED //#CHECK
//@ObjectModel.sapObjectNodeType.name: 'ZPRA_MK_A_VSTR'
//@ObjectModel.semanticKey: [ 'Name' ]
define root view entity ZPRA_MK_C_VISITORTP
  provider contract transactional_query
  as projection on ZPRA_MK_R_VISITOR
{
  key Uuid,
  Name,
  Email,
  CreatedBy,
  CreatedAt,
  LastChangedAt,
  LastChangedBy,
  LocalLastChangedAt,
  _Visits : redirected to ZPRA_MK_C_VISITTP
  
}
