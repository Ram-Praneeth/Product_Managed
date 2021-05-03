@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product Header Interface view'
define root view entity ZI_PRODUCT_HDR
  as select from zproduct_hdr
  composition [0..1] of Zi_Product_Itm as itm
{
  key itemid     as Itemid,
      itemclass  as Itemclass,
      itemsclass as Itemsclass,
      manftr     as Manftr,
      mnfaddr    as Mnfaddr,

      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at,

      itm // Item Association
}
