CLASS zcl_product_tabf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES : if_amdp_marker_hdb.
    CLASS-METHODS : get_item_data FOR TABLE FUNCTION zproduct_itm_tabf.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_product_tabf IMPLEMENTATION.
  METHOD get_item_data BY DATABASE
  FUNCTION FOR HDB LANGUAGE SQLSCRIPT
  OPTIONS READ-ONLY USING zproduct_itm.

    itab1 =  select  itemid, itemname, warnum, mfdate, prdate,
                    warbeg, warend, werks, lgort, waers,
                    dmbtr, last_changed_at
        FROM zproduct_itm;

    itab2 =  SELECT   itemid, itemname, warnum, mfdate, prdate,
                    dats_days_between(mfdate,prdate) AS stock_validity,
                    warbeg, warend,
                    (( dats_days_between(warbeg, warend)) / 365) AS warranty_yrs,
                    werks, lgort, waers,
                    dmbtr, last_changed_at
                    FROM :itab1;

     RETURN SELECT itemid, itemname, warnum, mfdate, prdate,stock_validity,
                    case
                     WHEN Stock_validity <= 50 then 'Immediate goods'
                     WHEN Stock_validity > 51 and Stock_validity <= 150  then 'Marginal goods'
                     WHEN Stock_validity >= 151 then 'High-value goods'
                     ELSE ''
                    END as stock_status,
                     warbeg, warend, warranty_yrs,werks, lgort, waers,dmbtr, last_changed_at
                    from :itab2;


  ENDMETHOD.

ENDCLASS.
