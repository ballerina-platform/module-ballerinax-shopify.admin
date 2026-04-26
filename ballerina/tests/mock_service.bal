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

    resource function post admin/api/'2026\-01/customers\.json(@http:Payload json payload) returns CustomerResponse|error {
        return check payload.cloneWithType(CustomerResponse);
    }

    resource function get admin/api/'2026\-01/customers\.json() returns Customers {
        Customers customers = {
            customers: [
                {
                    id: 8821698462001,
                    createdAt: "2025-02-05T13:14:38+05:30",
                    updatedAt: "2025-02-05T13:14:38+05:30",
                    ordersCount: 0,
                    state: "disabled",
                    totalSpent: "0.00",
                    lastOrderId: null,
                    note: null,
                    verifiedEmail: true,
                    multipassIdentifier: null,
                    taxExempt: false,
                    tags: "newsletter",
                    lastOrderName: null,
                    currency: "LKR",
                    addresses: [
                        {
                            id: 10628167827761,
                            customerId: 8821698462001,
                            company: null,
                            province: null,
                            country: "Sri Lanka",
                            provinceCode: null,
                            countryCode: "LK",
                            countryName: "Sri Lanka",
                            default: true
                        }
                    ],
                    taxExemptions: [],
                    emailMarketingConsent: {
                        state: "subscribed",
                        optInLevel: "single_opt_in",
                        consentUpdatedAt: "2025-02-05T13:14:38+05:30"
                    },
                    smsMarketingConsent: null,
                    adminGraphqlApiId: "gid://shopify/Customer/8821698462001",
                    defaultAddress: {
                        id: 10628167827761,
                        customerId: 8821698462001,
                        company: null,
                        province: null,
                        country: "Sri Lanka",
                        provinceCode: null,
                        countryCode: "LK",
                        countryName: "Sri Lanka",
                        default: true
                    }
                }
            ]
        };
        return customers;
    }

    resource function get admin/api/'2026\-01/events\.json() returns EventsList {
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

    resource function get admin/api/'2026\-01/gift_cards\.json() returns GiftCardsList {
        GiftCardsList giftCards = {
            giftCards: [
                {
                    id: 648138555697,
                    balance: "10.00",
                    createdAt: "2025-02-05T14:45:14+05:30",
                    updatedAt: "2025-02-05T14:45:14+05:30",
                    currency: "LKR",
                    initialValue: "10.00",
                    disabledAt: null,
                    lineItemId: null,
                    apiClientId: 1830279,
                    userId: 116900266289,
                    customerId: null,
                    note: "Test",
                    expiresOn: null,
                    templateSuffix: null,
                    lastCharacters: "tfp7",
                    orderId: null
                }
            ]
        };
        return giftCards;
    }

    resource function get admin/api/'2026\-01/locations\.json() returns LocationList {
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
                    countryCode: "CA",
                    provinceCode: "ON",
                    active: true,
                    legacy: false,
                    adminGraphqlApiId: "gid://shopify/Location/487838322"
                }
            ]
        };
        return locations;
    }

    resource function get admin/api/'2026\-01/locations/count\.json() returns StoreLocationCount {
        StoreLocationCount count = {
            count: 1
        };
        return count;
    }

    resource function get admin/api/'2026\-01/products\.json() returns ProductsResponse {
        ProductsResponse products = {
            products: [{
                id: 12345,
                title: "Test Product"
            }]
        };
        return products;
    }

    resource function get admin/api/'2026\-01/products/count\.json() returns ObjectCount {
        ObjectCount count = {
            count: 1
        };
        return count;
    }

    resource function get admin/api/'2026\-01/draft_orders\.json() returns DraftOrders {
        DraftOrders orders = {
            draftOrders: [{
                id: 12345,
                email: ""
            }]
        };
        return orders;
    }

    resource function get admin/api/'2026\-01/draft_orders/count\.json() returns StoreLocationCount {
        StoreLocationCount count = {
            count: 1
        };
        return count;
    }

    resource function get admin/api/'2026\-01/draft_orders/[string draftOrderId]() returns SingleDraftOrder|error {
        SingleDraftOrder draftOrder = {
            draftOrder: {
                id: 12345,
                name: "Draft #1",
                email: ""
            }
        };
        return draftOrder;
    }

    resource function get admin/api/'2026\-01/countries\.json() returns CountriesList {
        CountriesList countries = {
            countries: [
                {
                    id: 105331983,
                    name: "Sri Lanka",
                    tax: 0.0,
                    code: "LK",
                    taxName: "VAT",
                    provinces: []
                }
            ]
        };
        return countries;
    }

    resource function get admin/api/'2026\-01/countries/count\.json() returns EventsCount {
        EventsCount count = {
            count: 1
        };
        return count;
    }

    resource function get admin/api/'2026\-01/shipping_zones\.json() returns ShippingZonesList {
        ShippingZonesList shippingZones = {
            shippingZones: [{
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

    resource function get admin/api/'2026\-01/price_rules\.json() returns PriceRules {
        PriceRules priceRules = {
            priceRules: [
                {
                    id: 123456789,
                    title: "10% off",
                    targetType: "line_item",
                    targetSelection: "all",
                    allocationMethod: "across",
                    valueType: "percentage",
                    value: "-10.0",
                    oncePerCustomer: false,
                    usageLimit: 1,
                    customerSelection: "all",
                    startsAt: "2025-02-05T14:45:14+05:30",
                    endsAt: null,
                    createdAt: "2025-02-05T14:45:14+05:30",
                    updatedAt: "2025-02-05T14:45:14+05:30",
                    adminGraphqlApiId: "gid://shopify/PriceRule/123456789"
                }
            ]
        };
        return priceRules;
    }

    resource function get admin/api/'2026\-01/events/count\.json() returns EventsCount {
        EventsCount count = {
            count: 1
        };
        return count;
    }

    resource function post admin/api/'2026\-01/gift_cards\.json(@http:Payload json payload) returns GiftCard|error {
        return {
            giftCard: {
                initialValue: "100.00"
            }
        };
    }

    resource function get admin/api/'2026\-01/gift_cards/count\.json() returns EventsCount {
        EventsCount count = {
            count: 1
        };
        return count;
    }

    resource function get admin/api/'2026\-01/comments\.json() returns ArticleComments {
        ArticleComments comments = {
            comments: [
                {
                    articleId: 123456789,
                    body: "This is a comment"
                }
            ]
        };
        return comments;
    }

    resource function get admin/api/'2026\-01/smart_collections\.json() returns SmartCollectionList {
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
                    sortOrder: "manual",
                    adminGraphqlApiId: "gid://shopify/SmartCollection/123456789"
                }
            ]
        };
        return smartCollections;
    }

    resource function get admin/api/'2026\-01/products/[string productId]/images/count\.json() returns BlogsCount {
        BlogsCount count = {
            count: 1
        };
        return count;
    }
}
