@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product Item Interface view'
define view entity Zi_Product_Itm
  as select from ZPRODUCT_ITM_TABF
  association to parent ZI_PRODUCT_HDR as hdr on $projection.itemid = hdr.Itemid
{
  key itemid,
      itemname,
      warnum,
      mfdate,
      prdate,
      stock_validity,
      stock_status,
      warbeg,
      warend,
      warranty_yrs,
      werks,
      lgort,
      waers,
      @Semantics.amount.currencyCode: 'waers'
      dmbtr,
      last_changed_at,

      hdr // Header Association
}
