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
configurable string accessToken = "mock-access-token";
configurable string serviceUrl = "http://localhost:8080/shopify";
configurable decimal draftOrderId = 12345.0;
configurable string productId = "prodcut-id";

Client shopify = check new (
    {
        accessToken
    },
    serviceUrl,
    {
        followRedirects: {
            enabled: true
        }
    }
);

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetAccessScopes() returns error? {
    AccessScopes accessScopes = check shopify->getAListOfAccessScopes();
    AccessScopesAccessScopes[]? scopes = accessScopes.accessScopes;
    if scopes !is () {
        test:assertTrue(scopes.length() > 0);
    } else {
        test:assertFail("No access scopes were found.");
    }
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetCustomerLists() returns error? {
    Customers customers = check shopify->retrievesAListOfCustomers();
    Customer[]? customerList = customers.customers;
    if customerList !is () {
        test:assertTrue(customerList.length() > 0);
    } else {
        test:assertFail("No customers were found.");
    }
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testCreateCustomer() returns error? {
    CreateCustomer payload = {
        customer: {
            first_name: "Sung",
            last_name: "Jin-woo",
            email: "sung@solo.leveling.com"
        }
    };
    CustomerResponse result = check shopify->createsACustomer(payload);
    Customer? customer = result.customer;
    if customer !is () {
        test:assertEquals(customer?.email, payload.customer?.email);
    } else {
        test:assertFail("No customer response is found.");
    }
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetEventLists() returns error? {
    EventsList events = check shopify->retrievesAListOfEvents();
    anydata[]? eventsResult = events.events;
    if eventsResult !is () {
        test:assertTrue(eventsResult.length() > 0);
    } else {
        test:assertFail("No events were found.");
    }
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGiftCardList() returns error? {
    GiftCardsList giftCardList = check shopify->retrievesAListOfGiftCards();
    GiftCardsListGiftCards[]? giftCards = giftCardList.giftCards;
    if giftCards !is () {
        test:assertTrue(giftCards.length() > 0);
    } else {
        test:assertFail("No gift cards were found.");
    }
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetListOfLocations() returns error? {
    LocationList locationList = check shopify->retrievesAListOfLocations();
    LocationListLocations[]? locations = locationList.locations;
    if locations !is () {
        test:assertTrue(locations.length() > 0);
    } else {
        test:assertFail("No locations were found.");
    }
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
    DraftOrdersDraftOrders[]? orders = draftOrders?.draftOrders;
    if orders !is () {
        test:assertTrue(orders.length() > 0);
    } else {
        test:assertFail("No orders were found.");
    }
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetDraftOrder() returns error? {
    SingleDraftOrder draftOrder = check shopify->receiveASingleDraftorder(draftOrderId.toString());
    test:assertEquals(draftOrder.draft_order?.id, draftOrderId);
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
    CountriesListCountries[]? countriesResult = countries.countries;
    if countriesResult !is () {
        test:assertTrue(countriesResult.length() > 0);
    } else {
        test:assertFail("No countries were found.");
    }
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetCountOfCountries() returns error? {
    EventsCount countryCount = check shopify->retrievesACountOfCountries();
    test:assertTrue(countryCount.count == <decimal>1);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetListOfAllShippingZones() returns error? {
    ShippingZonesList shippingZones = check shopify->receiveAListOfAllShippingzones();
    DeliveryZone[]? shippingZonesResult = shippingZones.shippingZones;
    if shippingZonesResult !is () {
        test:assertTrue(shippingZonesResult.length() > 0);
    } else {
        test:assertFail("No shipping zones were found.");
    }
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetListOfPriceRules() returns error? {
    PriceRules priceRules = check shopify->retrievesAListOfPriceRules();
    SinglePriceRulePriceRule[]? priceRulesResult = priceRules.priceRules;
    if priceRulesResult !is () {
        test:assertTrue(priceRulesResult.length() > 0);
    } else {
        test:assertFail("No price rules were found.");
    }
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
        giftCard: {
            initialValue: "100.0",
            sendOn: "2021-07-01",
            message: "Happy Birthday!"
        }
    };
    GiftCard giftCard = check shopify->createsAGiftCard(payload);
    GiftCardGiftCard? giftCardResult = giftCard.gift_card;
    if giftCardResult !is () {
        test:assertEquals(giftCardResult?.initial_value, payload.giftCard?.initialValue);
    } else {
        test:assertFail("No gift cards were found.");
    }
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetCountOfGiftCards() returns error? {
    EventsCount count = check shopify->retrievesACountOfGiftCards();
    test:assertTrue(count?.count > <decimal>0);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetListOfComments() returns error? {
    ArticleComments comments = check shopify->retrievesAListOfComments();
    ArticleCommentsComments[]? commentsResult = comments.comments;
    if commentsResult !is () {
        test:assertTrue(commentsResult.length() > 0);
    } else {
        test:assertFail("No comments were found.");
    }
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetListOfSmartCollections() returns error? {
    SmartCollectionList smartCollections = check shopify->retrievesAListOfSmartCollections();
    SmartCollectionListSmartCollections[]? smartCollectionsResult = smartCollections.smartCollections;
    if smartCollectionsResult !is () {
        test:assertTrue(smartCollectionsResult.length() > 0);
    } else {
        test:assertFail("No smart collections were found.");
    }
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetCountOfAllProductImages() returns error? {
    decimal count = 1.0;
    BlogsCount productImageCount = check shopify->receiveACountOfAllProductImages(productId);
    test:assertEquals(productImageCount.count, count);
}
