@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for ZPRA_MK_A_VST'
/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define view entity ZPRA_MK_R_VISIT
  as select from zpra_mk_a_vst
  association        to parent ZPRA_MK_R_MUSICFESTIVAL as _MusicFestival on $projection.ParentUuid = _MusicFestival.Uuid
  association [0..1] to ZPRA_MK_R_VISITOR                 as _Visitor          on $projection.VisitorUuid = _Visitor.Uuid
  association [1..1] to ZPRA_MK_I_VISITOR                 as _VisitorVH        on $projection.VisitorUuid = _VisitorVH.VisitorId
  association [1..1] to ZPRA_MK_I_VISIT_STATUS_VH         as _Status           on $projection.Status = _Status.Value
{
  key uuid                  as Uuid,
      parent_uuid           as ParentUuid,
      visitor_uuid          as VisitorUuid,
      artist_indicator      as ArtistIndicator,
      status                as Status,
      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      //Associations
      _Visitor,
      _MusicFestival,
      _VisitorVH,
      _Status
}
