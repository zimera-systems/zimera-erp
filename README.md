# Zimera ERP

![Zimera ERP Logo](images/zerp-logo.jpg)

Zimera ERP is a customized instance of [Tryton](https://tryton.org) ERP software. It is not a fork of Tryton, instead it is Tryton instance which should be executed from source (no need to install Zimera ERP using **pip**). 

## Get Zimera ERP

Zimera ERP follows Tryton release in a specific branch. The curent version for Tryton would be the default branch (see [Zimera ERP branches](https://github.com/zimera-systems/zimera-erp/branches)). Therefore, you may use Zimera ERP for specific Tryton version using this Git command:

```
$ git clone --branch <tryton-version> https://github.com/zimera-systems/zimera-erp
```

For example, if you want to use version 6.6, then use this command:

```
$ git clone --branch 6.6 https://github.com/zimera-systems/zimera-erp
```

## Features

Zimera ERP is not a fork of Tryton, therefore it is very much the same with Tryton. See Tryton website for more information about Tryton features.

## Why?

Previously, we usually use **pip** to install Tryton (`trytond`, `all trytond modules`, `proteus`, `relatorio`, and `tryton`) and `sao` (web client for Tryton - JavaScript, should be installed using `npm` from Node.js). Using those approaches, all components of Tryton will be installed into Python's site-packages (for trytond and all Tryton's modules) and wherever we want to put `sao`. The problem is, when we want to develop and test Tryton's module(s), we have to put the module into `trytond/modules` directory. That way, we have to create a package first so that the package can be installed into Tryton's modules directory.

Other thing is, localization can be problematic if we want to use language file (.po): we have to edit the file and then put that file inside `locale` directory, create the package, and the install them using **pip**. It is easier, if we just copy `.po` into `trytond/modules/modulename/locale`.

## Tryton and Modules

All of **Tryton** modules are in inside `trytond/modules`. As of this tag release, we use **Tryton** 6.6. Version **6.6** for Tryton now is **6.6.3** (see [trytond package](https://pypi.org/project/trytond/)). Some modules still in version 6.6.0 or 6.6.1 or 6.6.2 but that's fine as long as they are still at **6.6.x**.

We track latest **Tryton** version (including all **Tryton**'s modules and **sao**). Whenever a new release available, we make some adjustment into Zimera ERP. 

Zimera ERP consists of **Tryton** and all of **Tryton**'s modules. The modules can be downloaded from [Tryton official download](https://downloads.tryton.org/current/) - current version. As of this 6.6 release tag, it goes to [6.6 version](https://downloads-cdn.tryton.org/6.6/).


### List of Official Modules

**Last update: January 15, 2023**

| **No** | **Module Name**                              | **Version** |
|-------:|----------------------------------------------|-------------|
|   1.   | account                                      | 6.6.0       |
|   2.   | account_asset                                | 6.6.0       |
|   3.   | account_be                                   | 6.6.0       |
|   4.   | account_budget                               | 6.6.0       |
|   5.   | account_cash_rounding                        | 6.6.0       |
|   6.   | account_consolidation                        | 6.6.0       |
|   7.   | account_credit_limit                         | 6.6.0       |
|   8.   | account_deposit                              | 6.6.0       |
|   9.   | account_de_skr03                             | 6.6.0       |
|  10.   | account_dunning                              | 6.6.0       |
|  11.   | account_dunning_email                        | 6.6.0       |
|  12.   | account_dunning_fee                          | 6.6.0       |
|  13.   | account_dunning_letter                       | 6.6.0       |
|  14.   | account_es                                   | 6.6.0       |
|  15.   | account_es_sii                               | 6.6.1       |
|  16.   | account_eu                                   | 6.6.0       |
|  17.   | account_fr                                   | 6.6.0       |
|  18.   | account_fr_chorus                            | 6.6.0       |
|  19.   | account_invoice                              | 6.6.1       |
|  20.   | account_invoice_correction                   | 6.6.0       |
|  21.   | account_invoice_defer                        | 6.6.0       |
|  22.   | account_invoice_history                      | 6.6.0       |
|  23.   | account_invoice_line_standalone              | 6.6.0       |
|  24.   | account_invoice_secondary_unit               | 6.6.0       |
|  25.   | account_invoice_stock                        | 6.6.0       |
|  26.   | account_invoice_watermark                    | 6.6.1       |
|  27.   | account_move_line_grouping                   | 6.6.0       |
|  28.   | account_payment                              | 6.6.0       |
|  29.   | account_payment_braintree                    | 6.6.0       |
|  30.   | account_payment_clearing                     | 6.6.0       |
|  31.   | account_payment_sepa                         | 6.6.0       |
|  32.   | account_payment_sepa_cfonb                   | 6.6.0       |
|  33.   | account_payment_stripe                       | 6.6.0       |
|  34.   | account_product                              | 6.6.0       |
|  35.   | account_receivable_rule                      | 6.6.0       |
|  36.   | account_rule                                 | 6.6.0       |
|  37.   | account_statement                            | 6.6.0       |
|  38.   | account_statement_aeb43                      | 6.6.0       |
|  39.   | account_statement_coda                       | 6.6.0       |
|  40.   | account_statement_ofx                        | 6.6.0       |
|  41.   | account_statement_sepa                       | 6.6.1       |
|  42.   | account_stock_anglo_saxon                    | 6.6.0       |
|  43.   | account_stock_continental                    | 6.6.0       |
|  44.   | account_stock_landed_cost                    | 6.6.0       |
|  45.   | account_stock_landed_cost_weight             | 6.6.0       |
|  46.   | account_stock_shipment_cost                  | 6.6.0       |
|  47.   | account_stock_shipment_cost_weight           | 6.6.0       |
|  48.   | account_tax_cash                             | 6.6.0       |
|  49.   | account_tax_non_deductible                   | 6.6.0       |
|  50.   | account_tax_rule_country                     | 6.6.0       |
|  51.   | analytic_account                             | 6.6.0       |
|  52.   | analytic_budget                              | 6.6.0       |
|  53.   | analytic_invoice                             | 6.6.0       |
|  54.   | analytic_purchase                            | 6.6.0       |
|  55.   | analytic_sale                                | 6.6.0       |
|  56.   | attendance                                   | 6.6.0       |
|  57.   | authentication_saml                          | 6.6.0       |
|  58.   | authentication_sms                           | 6.6.0       |
|  59.   | bank                                         | 6.6.1       |
|  60.   | carrier                                      | 6.6.0       |
|  61.   | carrier_carriage                             | 6.6.0       |
|  62.   | carrier_percentage                           | 6.6.0       |
|  63.   | carrier_subdivision                          | 6.6.0       |
|  64.   | carrier_weight                               | 6.6.0       |
|  65.   | commission                                   | 6.6.0       |
|  66.   | commission_waiting                           | 6.6.0       |
|  67.   | company                                      | 6.6.0       |
|  68.   | company_work_time                            | 6.6.0       |
|  69.   | country                                      | 6.6.0       |
|  70.   | currency                                     | 6.6.1       |
|  71.   | currency_ro                                  | 6.6.0       |
|  72.   | currency_rs                                  | 6.6.0       |
|  73.   | customs                                      | 6.6.0       |
|  74.   | dashboard                                    | 6.6.0       |
|  75.   | edocument_uncefact                           | 6.6.0       |
|  76.   | edocument_unece                              | 6.6.0       |
|  77.   | gis (**EXCLUDED**)                           | 6.6.0       |
|  78.   | google_maps                                  | 6.6.0       |
|  79.   | incoterm                                     | 6.6.0       |
|  80.   | ldap_authentication                          | 6.6.0       |
|  81.   | marketing                                    | 6.6.0       |
|  82.   | marketing_automation                         | 6.6.1       |
|  83.   | marketing_campaign                           | 6.6.0       |
|  84.   | marketing_email                              | 6.6.0       |
|  85.   | notification_email                           | 6.6.0       |
|  86.   | party                                        | 6.6.0       |
|  87.   | party_avatar                                 | 6.6.0       |
|  88.   | party_relationship                           | 6.6.0       |
|  89.   | party_siret                                  | 6.6.0       |
|  90.   | product                                      | 6.6.0       |
|  91.   | product_attribute                            | 6.6.0       |
|  92.   | product_classification                       | 6.6.0       |
|  93.   | product_classification_taxonomic             | 6.6.0       |
|  94.   | product_cost_fifo                            | 6.6.0       |
|  95.   | product_cost_history                         | 6.6.0       |
|  96.   | product_cost_warehouse                       | 6.6.0       |
|  97.   | product_image                                | 6.6.0       |
|  98.   | product_image_attribute                      | 6.6.0       |
|  99.   | production                                   | 6.6.0       |
| 100.   | production_outsourcing                       | 6.6.0       |
| 101.   | production_routing                           | 6.6.0       |
| 102.   | production_split                             | 6.6.0       |
| 103.   | production_work                              | 6.6.1       |
| 104.   | production_work_timesheet                    | 6.6.0       |
| 105.   | product_kit                                  | 6.6.3       |
| 106.   | product_measurements                         | 6.6.0       |
| 107.   | product_price_list                           | 6.6.0       |
| 108.   | product_price_list_dates                     | 6.6.0       |
| 109.   | product_price_list_parent                    | 6.6.0       |
| 110.   | project                                      | 6.6.0       |
| 111.   | project_invoice                              | 6.6.0       |
| 112.   | project_plan                                 | 6.6.0       |
| 113.   | project_revenue                              | 6.6.0       |
| 114.   | purchase                                     | 6.6.1       |
| 115.   | purchase_amendment                           | 6.6.0       |
| 116.   | purchase_blanket_agreement                   | 6.6.0       |
| 117.   | purchase_history                             | 6.6.0       |
| 118.   | purchase_invoice_line_standalone             | 6.6.0       |
| 119.   | purchase_price_list                          | 6.6.0       |
| 120.   | purchase_request                             | 6.6.1       |
| 121.   | purchase_request_quotation                   | 6.6.1       |
| 122.   | purchase_requisition                         | 6.6.0       |
| 123.   | purchase_secondary_unit                      | 6.6.0       |
| 124.   | purchase_shipment_cost                       | 6.6.0       |
| 125.   | sale                                         | 6.6.0       |
| 126.   | sale_advance_payment                         | 6.6.0       |
| 127.   | sale_amendment                               | 6.6.0       |
| 128.   | sale_blanket_agreement                       | 6.6.0       |
| 129.   | sale_complaint                               | 6.6.0       |
| 130.   | sale_credit_limit                            | 6.6.0       |
| 131.   | sale_discount                                | 6.6.0       |
| 132.   | sale_extra                                   | 6.6.0       |
| 133.   | sale_gift_card                               | 6.6.0       |
| 134.   | sale_history                                 | 6.6.0       |
| 135.   | sale_invoice_date                            | 6.6.0       |
| 136.   | sale_invoice_grouping                        | 6.6.0       |
| 137.   | sale_opportunity                             | 6.6.0       |
| 138.   | sale_payment                                 | 6.6.0       |
| 139.   | sale_point                                   | 6.6.0       |
| 140.   | sale_price_list                              | 6.6.0       |
| 141.   | sale_product_customer                        | 6.6.0       |
| 142.   | sale_product_quantity                        | 6.6.0       |
| 143.   | sale_product_recommendation                  | 6.6.0       |
| 144.   | sale_product_recommendation_association_rule | 6.6.0       |
| 145.   | sale_promotion                               | 6.6.0       |
| 146.   | sale_promotion_coupon                        | 6.6.0       |
| 147.   | sale_promotion_coupon_payment                | 6.6.0       |
| 148.   | sale_secondary_unit                          | 6.6.0       |
| 149.   | sale_shipment_cost                           | 6.6.0       |
| 150.   | sale_shipment_grouping                       | 6.6.0       |
| 151.   | sale_shipment_tolerance                      | 6.6.0       |
| 152.   | sale_stock_quantity                          | 6.6.1       |
| 153.   | sale_subscription                            | 6.6.0       |
| 154.   | sale_subscription_asset                      | 6.6.0       |
| 155.   | sale_supply                                  | 6.6.1       |
| 156.   | sale_supply_drop_shipment                    | 6.6.1       |
| 157.   | sale_supply_production                       | 6.6.0       |
| 158.   | stock                                        | 6.6.2       |
| 159.   | stock_assign_manual                          | 6.6.0       |
| 160.   | stock_consignment                            | 6.6.0       |
| 161.   | stock_forecast                               | 6.6.0       |
| 162.   | stock_inventory_location                     | 6.6.0       |
| 163.   | stock_location_move                          | 6.6.0       |
| 164.   | stock_location_sequence                      | 6.6.0       |
| 165.   | stock_lot                                    | 6.6.0       |
| 166.   | stock_lot_sled                               | 6.6.0       |
| 167.   | stock_lot_unit                               | 6.6.0       |
| 168.   | stock_package                                | 6.6.0       |
| 169.   | stock_package_shipping                       | 6.6.0       |
| 170.   | stock_package_shipping_dpd                   | 6.6.1       |
| 171.   | stock_package_shipping_mygls                 | 6.6.1       |
| 172.   | stock_package_shipping_sendcloud             | 6.6.0       |
| 173.   | stock_package_shipping_ups                   | 6.6.0       |
| 174.   | stock_product_location                       | 6.6.0       |
| 175.   | stock_quantity_early_planning                | 6.6.0       |
| 176.   | stock_quantity_issue                         | 6.6.0       |
| 177.   | stock_secondary_unit                         | 6.6.0       |
| 178.   | stock_shipment_cost                          | 6.6.0       |
| 179.   | stock_shipment_cost_weight                   | 6.6.0       |
| 180.   | stock_shipment_measurements                  | 6.6.0       |
| 181.   | stock_split                                  | 6.6.0       |
| 182.   | stock_supply                                 | 6.6.0       |
| 183.   | stock_supply_day                             | 6.6.0       |
| 184.   | stock_supply_forecast                        | 6.6.0       |
| 185.   | stock_supply_production                      | 6.6.0       |
| 186.   | timesheet                                    | 6.6.0       |
| 187.   | timesheet_cost                               | 6.6.0       |
| 188.   | user_role                                    | 6.6.0       |
| 189.   | web_shop                                     | 6.6.0       |
| 190.   | web_shop_shopify                             | 6.6.0       |
| 191.   | web_shop_vue_storefront                      | 6.6.0       |
| 192.   | web_shop_vue_storefront_stripe               | 6.6.0       |
| 193.   | web_shortener                                | 6.6.0       |
| 194.   | web_user                                     | 6.6.0       |

Other libs from Tryton:

| **No** | **Library Name**                             | **Version** |
|-------:|----------------------------------------------|-------------|
|   1.   | proteus                                      | 6.6.1       |
|   2.   | relatorio (shoud be installed using pip)     | 0.10.1      |
|   3.   | sao (shoud be installed using `npm`)         | 6.6.3       |

### Excluded Module(s)

| **No** | **Module Name**                              | **Version** |
|-------:|----------------------------------------------|-------------|
|   1.   | gis                                          | 6.6.1       |

## Localization

The primary documentation for localization is available at  https://docs.tryton.org/projects/server/en/latest/topics/translation.html. If you want to create / edit .po file, just create / edit and then copy that file (.po) into `trytond/modules/modulename/locale`.

## Documentation

For documentation - specific to Zimera ERP, have a look at [Zimera ERP documentation](doc-zerp). Eventhough you come from pure Tryton background, some documentation for Zimera ERP might be enlightening.

