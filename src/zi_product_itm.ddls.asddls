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

      @Semantics.text: true
      case stock_status
         when 'Immediate goods' then 3
         when 'Marginal goods' then 1
         when  'High-value goods' then 5
         else 0 end as stockStatusCriticality,

      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at,

      hdr // Header Association
}
