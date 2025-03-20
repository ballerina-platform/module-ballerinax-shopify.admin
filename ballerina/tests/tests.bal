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

import ballerina/os;
import ballerina/test;

configurable boolean isTestOnLiveServer = os:getEnv("IS_TEST_ON_LIVE_SERVER") == "true";
configurable string apiVersion = "2025";
configurable string accessToken = "mock-access-token";
configurable string shopifyLiveServer = "mock-access-token";

string serviceUrl = isTestOnLiveServer ? shopifyLiveServer : "http://localhost:8080/shopify";
Client shopify = check new (
    accessToken,
    apiVersion,
    {
        followRedirects: {
            enabled: true
        }
    },
    serviceUrl
);

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetAccessScopes() returns error? {
    AccessScopes accessScopes = check shopify->getAListOfAccessScopes();
    test:assertNotEquals(accessScopes.access_scopes, ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetCustomerLists() returns error? {
    Customers customers = check shopify->retrievesAListOfCustomers();
    test:assertNotEquals(customers.customers, ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testCreateCustomer() returns error? {
    CreateCustomer payload = {
        customer: {
            first_name: "Steve",
            last_name: "Lastnameson",
            email: "steve.lastnameson@example.com"
        }
    };
    CustomerResponse result = check shopify->createsACustomer(payload);
    test:assertNotEquals(result.customer, ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetEventLists() returns error? {
    EventsList events = check shopify->retrievesAListOfEvents();
    test:assertNotEquals(events.events, ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGiftCardList() returns error? {
    GiftCardsList giftCardList = check shopify->retrievesAListOfGiftCards();
    test:assertNotEquals(giftCardList.gift_cards, ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetListOfLocations() returns error? {
    LocationList locationList = check shopify->retrievesAListOfLocations();
    test:assertNotEquals(locationList.locations, ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetCountOfLocations() returns error? {
    decimal count = 1.0;
    StoreLocationCount countOfLocations = check shopify->retrievesACountOfLocations();
    test:assertEquals(countOfLocations.count, count);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetACountOfProducts() returns error? {
    decimal count = 1.0;
    ObjectCount productCount = check shopify->retrievesACountOfProducts();
    test:assertEquals(productCount.count, count);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetListOfDraftOrders() returns error? {
    DraftOrders draftOrders = check shopify->retrievesAListOfDraftOrders();
    test:assertNotEquals(draftOrders?.draft_orders, ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetDraftOrder() returns error? {
    string draftOrderId = "1179937177905";
    SingleDraftOrder draftOrder = check shopify->receiveASingleDraftorder(draftOrderId);
    test:assertNotEquals(draftOrder.draft_order, ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetCountOfAllDraftOrders() returns error? {
    decimal count = 1.0;
    StoreLocationCount draftOrderCount = check shopify->receiveACountOfAllDraftorders();
    test:assertEquals(draftOrderCount.count, count);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetCountriesList() returns error? {
    CountriesList countries = check shopify->receiveAListOfAllCountries();
    test:assertNotEquals(countries.countries, ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetCountOfCountries() returns error? {
    EventsCount countryCount = check shopify->retrievesACountOfCountries();
    test:assertNotEquals(countryCount.count, 0);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetListOfAllShippingZones() returns error? {
    ShippingZonesList shippingZones = check shopify->receiveAListOfAllShippingzones();
    test:assertNotEquals(shippingZones.shipping_zones, ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetListOfPriceRules() returns error? {
    PriceRules priceRules = check shopify->retrievesAListOfPriceRules();
    test:assertNotEquals(priceRules.price_rules, ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetCountOfEvents() returns error? {
    decimal count = 1.0;
    EventsCount eventCount = check shopify->retrievesACountOfEvents();
    test:assertEquals(eventCount.count, count);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetListOfAllOrders() returns error? {
    ApiVersionGiftCardsJsonBody payload = {
        gift_card: {
            initial_value: "100.0",
            send_on: "2021-07-01",
            message: "Happy Birthday!"
        }
    };
    GiftCard giftCard = check shopify->createsAGiftCard(payload);
    test:assertNotEquals(giftCard.gift_card, ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetCountOfGiftCards() returns error? {
    EventsCount count = check shopify->retrievesACountOfGiftCards();
    test:assertNotEquals(count, ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetListOfComments() returns error? {
    ArticleComments comments = check shopify->retrievesAListOfComments();
    test:assertNotEquals(comments.comments, ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetListOfSmartCollections() returns error? {
    SmartCollectionList smartCollections = check shopify->retrievesAListOfSmartCollections();
    test:assertNotEquals(smartCollections.smart_collections, ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetCountOfAllProductImages() returns error? {
    string productId = "prodcut-id";
    decimal count = 1.0;
    BlogsCount productImageCount = check shopify->receiveACountOfAllProductImages(productId);
    test:assertEquals(productImageCount.count, count);
}
