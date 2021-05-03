@EndUserText.label: 'Product Header Consumption'
@AccessControl.authorizationCheck: #CHECK

@UI: {
 headerInfo: {
               typeName: 'Header',
               typeNamePlural: 'Product Header',
               title: { type: #STANDARD, value: 'Itemid' } }
              }

@Search.searchable: true

@ObjectModel.semanticKey: ['Itemid']
@ObjectModel.representativeKey: 'Itemid'

define root view entity ZC_PRODUCT_HDR
  as projection on ZI_PRODUCT_HDR
{

      //ZI_SERV_ORDHRD
      @UI.facet: [
                  {
                  id: 'ProductHeader',
                  type: #COLLECTION,
                  position: 10,
                  label: 'Header Details'
                  },
                  {
                  type: #FIELDGROUP_REFERENCE,
                  position: 10,
                  targetQualifier: 'GeneralData1',
                  parentId: 'ProductHeader',
                  isSummary: true,
                  isPartOfPreview: true
                  },
                  {
                  type: #FIELDGROUP_REFERENCE,
                  position: 20,
                  targetQualifier: 'GeneralData2',
                  parentId: 'ProductHeader',
                  isSummary: true,
                  isPartOfPreview: true
                  },
                  {
                  id: 'itm',
                  purpose: #STANDARD,
                  type: #LINEITEM_REFERENCE,
                  label: 'Item details',
                  position: 10,
                  targetElement: 'itm'
                  }
              ]

      @UI.lineItem: [{position: 10, importance: #HIGH, label: 'Product Id' }]
      @UI.fieldGroup: [{qualifier: 'GeneralData1',position: 10,importance: #HIGH, label: 'Product Id' }]
      @UI.selectionField: [{position: 10 }]
      @EndUserText.quickInfo: 'Product Identification'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.9
      //      @UI.hidden: #(CreateAction)
  key Itemid          as Itemid,

      @UI.lineItem: [{position: 20, importance: #HIGH, label: 'Item Class' }]
      @UI.fieldGroup: [{qualifier: 'GeneralData1',position: 20,importance: #HIGH, label: 'Item Class' }]
      @UI.selectionField: [{position: 20 }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.9
      Itemclass       as ItemClass,

      @UI.lineItem: [{position: 30, importance: #HIGH, label: 'Item Subclass' }]
      @UI.fieldGroup: [{qualifier: 'GeneralData1',position: 30,importance: #HIGH, label: 'Item Subclass' }]
      @UI.selectionField: [{position: 30 }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.9
      Itemsclass      as ItemSubclass,

      @UI.lineItem: [{position: 40, importance: #HIGH, label: 'Manufacturer' }]
      @UI.fieldGroup: [{qualifier: 'GeneralData1',position: 40,importance: #HIGH, label: 'Manufacturer' }]
      Manftr          as Manufacturer,

      @UI.lineItem: [{position: 50, importance: #HIGH,  value: 'ManufacturerAddress' , label: 'Manufacturer"s Address' }]
      @UI.fieldGroup: [{qualifier: 'GeneralData1',position: 50,importance: #HIGH, label: 'Manufacturer"s Address' }]
      Mnfaddr         as ManufacturerAddress,


      @UI.hidden: true
      last_changed_at as LastChangedAt,
      /* Associations */
      itm : redirected to composition child ZC_PRODUCT_ITM
}
