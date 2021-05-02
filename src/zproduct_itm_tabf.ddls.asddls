@EndUserText.label: 'Product Item Table Function'
@ClientHandling.type: #CLIENT_INDEPENDENT
define table function ZPRODUCT_ITM_TABF
returns
{
  key itemid          : zitemid;
      itemname        : abap.char(50);
      warnum          : abap.char(20);
      mfdate          : abap.dats;
      prdate          : abap.dats;
      stock_validity  : abap.char(3);
      stock_status    : abap.char(30);
      warbeg          : abap.dats;
      warend          : abap.dats;
      warranty_yrs    : abap.int2;
      werks           : abap.char(4);
      lgort           : abap.char(4);
      waers           : abap.cuky;
      dmbtr           : abap.curr(23,2);
      last_changed_at : timestampl;

}
implemented by method
  zcl_product_tabf=>get_item_data;