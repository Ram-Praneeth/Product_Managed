@AbapCatalog.sqlViewName: 'ZI_PROD_HDR_V'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product Header'
define view ZI_PROD_HDR
  as select from zprod_hdr
{
  key itemid     as Itemid,
      itemclass  as Itemclass,
      itemsclass as Itemsclass,
      manftr     as Manftr,
      mnfaddr    as Mnfaddr
}
