@AbapCatalog.sqlViewName: 'ZI_PRODUCT_ITM_V'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product Item Interface view'
define view Zi_Product_Itm
  as select from ZPRODUCT_ITM_TABF
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
      @Semantics.currencyCode: true
      waers,
      @Semantics.amount.currencyCode: 'waers'
      dmbtr,
      last_changed_at
}
