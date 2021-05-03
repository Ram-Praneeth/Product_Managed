@EndUserText.label: 'Product Item Consumption'
@AccessControl.authorizationCheck: #CHECK

@UI.headerInfo: {
                  typeName: 'Service Order Item',
                  typeNamePlural: 'Service Order Items',
                  title: { type: #STANDARD, value: 'ItemID' }
                }

@ObjectModel.semanticKey: ['ItemID']

define view entity ZC_PRODUCT_ITM
  as projection on Zi_Product_Itm
{

      @UI.facet: [
                       {type: #COLLECTION, position: 10, id: 'itm', label: 'Item details'},
                       {type: #FIELDGROUP_REFERENCE, position: 10, targetQualifier: 'Item1',parentId: 'itm', isSummary: true, isPartOfPreview: true},
                       {type: #FIELDGROUP_REFERENCE, position: 20, targetQualifier: 'Item2',parentId: 'itm', isSummary: true, isPartOfPreview: true}
                      ]

      @UI.lineItem: [{position:10,importance: #HIGH, label:'Product Id' }]
      @UI.fieldGroup: [{qualifier: 'Item1', label:'Product Id', position:10,importance: #HIGH}]
  key itemid         as ItemID,

      @UI.lineItem: [{position: 20, importance: #HIGH, label: 'Item name' }]
      @UI.fieldGroup: [{qualifier: 'GeneralData1',position: 20,importance: #HIGH, label: 'Item name' }]
      itemname       as Itemname,

      @UI.lineItem: [{position:30,importance: #MEDIUM , label: 'Warranty Number'}]
      @UI.fieldGroup: [{qualifier: 'Item1', position:30, label: 'Warranty Number',importance: #HIGH}]
      warnum         as Warnum,

      @UI.lineItem: [{position:40,importance: #MEDIUM , label: 'Manufacturing date'}]
      @UI.fieldGroup: [{qualifier: 'Item1', position:40, label: 'Manufacturing date',importance: #HIGH}]
      mfdate         as Mfdate,

      @UI.lineItem: [{position:50,importance: #MEDIUM , label: 'Purchased Date'}]
      @UI.fieldGroup: [{qualifier: 'Item1', position:50, label: 'Purchased Date',importance: #HIGH}]
      prdate         as Prdate,

      @UI.lineItem: [{position:60,importance: #MEDIUM , label: 'Stock Vaildity'}]
      @UI.fieldGroup: [{qualifier: 'Item1', position:60, label: 'Stock Vaildity',importance: #HIGH}]
      stock_validity as Stock_validity,

      @UI.lineItem: [{position:70,importance: #MEDIUM , label: 'Stock status'}]
      @UI.fieldGroup: [{qualifier: 'Item1', position:70, label: 'Stock status',importance: #HIGH}]
      stock_status   as Stock_status,

      @UI.lineItem: [{position:80,importance: #MEDIUM , label: 'Warranty Begins on'}]
      @UI.fieldGroup: [{qualifier: 'Item1', position:80, label: 'Warranty Begins on',importance: #HIGH}]
      warbeg         as Warbeg,

      @UI.lineItem: [{position:90,importance: #MEDIUM , label: 'Warranty End on'}]
      @UI.fieldGroup: [{qualifier: 'Item1', position:90, label: 'Warranty End on',importance: #HIGH}]
      warend         as Warend,

      @UI.lineItem: [{position:100,importance: #MEDIUM , label: 'Years of Warranty'}]
      @UI.fieldGroup: [{qualifier: 'Item1', position:100, label: 'Years of Warranty',importance: #HIGH}]
      warranty_yrs   as Waryrs,

      @UI.lineItem: [{position:110,importance: #MEDIUM , label: 'Plant'}]
      @UI.fieldGroup: [{qualifier: 'Item1', position:110, label: 'Plant',importance: #HIGH}]
      werks          as Werks,

      @UI.lineItem: [{position:120,importance: #MEDIUM , label: 'Storage Location'}]
      @UI.fieldGroup: [{qualifier: 'Item1', position:120, label: 'Storage Location',importance: #HIGH}]
      lgort          as Lgort,

      @UI.lineItem: [{position:130,importance: #MEDIUM , label: 'Product Price'}]
      @UI.fieldGroup: [{qualifier: 'Item1', position:130, label: 'Product Price',importance: #HIGH}]
      @Semantics.amount.currencyCode: 'waers'
      dmbtr          as Dmbtr,

      @Consumption.valueHelpDefinition:
                          [{
                             entity:{ name: 'I_Currency',
                                      element: 'Currency' }
                          }]
      waers,

      @UI.hidden: true
      last_changed_at,

      /* Associations */
      hdr : redirected to parent ZC_PRODUCT_HDR
}
