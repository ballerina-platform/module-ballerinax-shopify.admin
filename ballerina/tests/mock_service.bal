// Copyright (c) 2025, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

service /shopify on new http:Listener(8080) {

    resource function get admin/oauth/access_scopes\.json() returns AccessScopes {
        AccessScopes payload = {
            accessScopes: [
                {
                    'handle: "read_content"
                }
            ]
        };
        return payload;
    }

    resource function post admin/api/'2025\-01/customers\.json(@http:Payload json payload) returns CustomerResponse|error {
        return check payload.cloneWithType(CustomerResponse);
    }

    resource function get admin/api/'2025\-01/customers\.json() returns Customers {
        Customers customers = {
            customers: [
                {
                    id: 8821698462001,
                    created_at: "2025-02-05T13:14:38+05:30",
                    updated_at: "2025-02-05T13:14:38+05:30",
                    orders_count: 0,
                    state: "disabled",
                    total_spent: "0.00",
                    last_order_id: null,
                    note: null,
                    verified_email: true,
                    multipass_identifier: null,
                    tax_exempt: false,
                    tags: "newsletter",
                    last_order_name: null,
                    currency: "LKR",
                    addresses: [
                        {
                            id: 10628167827761,
                            customer_id: 8821698462001,
                            company: null,
                            province: null,
                            country: "Sri Lanka",
                            province_code: null,
                            country_code: "LK",
                            country_name: "Sri Lanka",
                            default: true
                        }
                    ],
                    tax_exemptions: [],
                    email_marketing_consent: {
                        state: "subscribed",
                        opt_in_level: "single_opt_in",
                        consent_updated_at: "2025-02-05T13:14:38+05:30"
                    },
                    sms_marketing_consent: null,
                    admin_graphql_api_id: "gid://shopify/Customer/8821698462001",
                    default_address: {
                        id: 10628167827761,
                        customer_id: 8821698462001,
                        company: null,
                        province: null,
                        country: "Sri Lanka",
                        province_code: null,
                        country_code: "LK",
                        country_name: "Sri Lanka",
                        default: true
                    }
                }
            ]
        };
        return customers;
    }

    resource function get admin/api/'2025\-01/events\.json() returns EventsList {
        EventsList events = {
            events: [
                {
                    id: 148194630271281,
                    subject_id: 114973475121,
                    created_at: "2025-02-05T12:50:52+05:30",
                    subject_type: "Blog",
                    verb: "create",
                    arguments: ["News"],
                    message: "Blog was created: <a href=\"https://admin.shopify.com/store/chf1m3-ar/admin/blogs/114973475121\">News</a>."
                }
            ]
        };
        return events;
    }

    resource function get admin/api/'2025\-01/gift_cards\.json() returns GiftCardsList {
        GiftCardsList giftCards = {
            giftCards: [
                {
                    id: 648138555697,
                    balance: "10.00",
                    created_at: "2025-02-05T14:45:14+05:30",
                    updated_at: "2025-02-05T14:45:14+05:30",
                    currency: "LKR",
                    initial_value: "10.00",
                    disabled_at: null,
                    line_item_id: null,
                    api_client_id: 1830279,
                    user_id: 116900266289,
                    customer_id: null,
                    note: "Test",
                    expires_on: null,
                    template_suffix: null,
                    last_characters: "tfp7",
                    order_id: null
                }
            ]
        };
        return giftCards;
    }

    resource function get admin/api/'2025\-01/locations\.json() returns LocationList {
        LocationList locations = {
            locations: [
                {
                    id: 487838322,
                    name: "Main Location",
                    address1: "123 Oak St",
                    address2: null,
                    city: "Ottawa",
                    zip: "123 ABC",
                    province: "ON",
                    country: "CA",
                    phone: "555-1212",
                    country_code: "CA",
                    province_code: "ON",
                    active: true,
                    legacy: false,
                    admin_graphql_api_id: "gid://shopify/Location/487838322"
                }
            ]
        };
        return locations;
    }

    resource function get admin/api/'2025\-01/locations/count\.json() returns StoreLocationCount {
        StoreLocationCount count = {
            count: 1.0
        };
        return count;
    }

    resource function get admin/api/'2025\-01/products/count\.json() returns ObjectCount {
        ObjectCount count = {
            count: 1.0
        };
        return count;
    }

    resource function get admin/api/'2025\-01/draft_orders\.json() returns DraftOrders {
        DraftOrders orders = {
            draftOrders: [{
                email: "" 
            }]
        };
        return orders;
    }

    resource function get admin/api/'2025\-01/draft_orders/count\.json() returns StoreLocationCount {
        StoreLocationCount count = {
            count: 1.0
        };
        return count;
    }

    resource function get admin/api/'2025\-01/draft_orders/[string draftOrderId]() returns SingleDraftOrder|error {
        SingleDraftOrder draftOrder = {
            draft_order: {
                id: 12345,
                name: "Draft #1",
                email: ""
            }
        };
        return draftOrder;
    }

    resource function get admin/api/'2025\-01/countries\.json() returns CountriesList {
        CountriesList countries = {
            countries: [
                {
                    id: 105331983,
                    name: "Sri Lanka",
                    tax: 0.0,
                    code: "LK",
                    tax_name: "VAT",
                    provinces: []
                }
            ]
        };
        return countries;
    }

    resource function get admin/api/'2025\-01/countries/count\.json() returns EventsCount {
        EventsCount count = {
            count: 1
        };
        return count;
    }

    resource function get admin/api/'2025\-01/shipping_zones\.json() returns ShippingZonesList {
        ShippingZonesList shippingZones = {
            shipping_zones: [{
                id: 548275650865,
                name: "Domestic",
                countries: [
                    {
                        id: 1160719925553,
                        name: "Sri Lanka",
                        tax: 0.08,
                        code: "LK",
                        provinces: []
                    }
                ]
            }]
        };
        return shippingZones;
    }

    resource function get admin/api/'2025\-01/price_rules\.json() returns PriceRules {
        PriceRules priceRules = {
            priceRules: [
                {
                    id: 123456789,
                    title: "10% off",
                    target_type: "line_item",
                    target_selection: "all",
                    allocation_method: "across",
                    value_type: "percentage",
                    value: "-10.0",
                    once_per_customer: false,
                    usage_limit: 1,
                    customer_selection: "all",
                    starts_at: "2025-02-05T14:45:14+05:30",
                    ends_at: null,
                    created_at: "2025-02-05T14:45:14+05:30",
                    updated_at: "2025-02-05T14:45:14+05:30",
                    admin_graphql_api_id: "gid://shopify/PriceRule/123456789"
                }
            ]
        };
        return priceRules;
    }

    resource function get admin/api/'2025\-01/events/count\.json() returns EventsCount {
        EventsCount count = {
            count: 1.0
        };
        return count;
    }

    resource function post admin/api/'2025\-01/gift_cards\.json(@http:Payload json payload) returns GiftCard|error {
        return {
            gift_card: {
                initial_value: "100.0"
            }
        };
    }

    resource function get admin/api/'2025\-01/gift_cards/count\.json() returns EventsCount {
        EventsCount count = {
            count: 1.0
        };
        return count;
    }

    resource function get admin/api/'2025\-01/comments\.json() returns ArticleComments {
        ArticleComments comments = {
            comments: [
                {
                    article_id: 123456789,
                    body: "This is a comment"
                }
            ]
        };
        return comments;
    }

    resource function get admin/api/'2025\-01/smart_collections\.json() returns SmartCollectionList {
        SmartCollectionList smartCollections = {
            smartCollections: [
                {
                    id: 123456789,
                    title: "Smart Collection",
                    rules: [
                        {
                            column: "tag",
                            relation: "equals",
                            condition: "new"
                        }
                    ],
                    disjunctive: false,
                    sort_order: "manual",
                    admin_graphql_api_id: "gid://shopify/SmartCollection/123456789"
                }
            ]
        };
        return smartCollections;
    }

    resource function get admin/api/'2025\-01/products/[string productId]/images/count\.json() returns BlogsCount {
        BlogsCount count = {
            count: 1.0
        };
        return count;
    }
}
