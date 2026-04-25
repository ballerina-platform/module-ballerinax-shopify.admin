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
import ballerina/time;

configurable boolean isTestOnLiveServer = os:getEnv("IS_TEST_ON_LIVE_SERVER") == "true";
configurable string accessToken = "mock-access-token";
configurable string serviceUrl = "http://localhost:8080/shopify";
configurable decimal draftOrderId = 12345.0;
configurable string productId = "prodcut-id";

Client shopify = check new (
    {
        xShopifyAccessToken: accessToken
    },
    serviceUrl
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
    Customers customers = check shopify->retrieveAListOfCustomers();
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
    time:Utc utc = time:utcNow();
    string uniqueEmail = string `sungjinwoo${utc[0]}@sololeveling.com`;
    CreateCustomer payload = {
        customer: {
            firstName: "Sung",
            lastName: "Jin-woo",
            email: uniqueEmail
        }
    };
    CustomerResponse result = check shopify->createACustomer(payload);
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
    EventsList events = check shopify->retrieveAListOfEvents();
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
    GiftCardsList giftCardList = check shopify->retrieveAListOfGiftCards();
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
    LocationList locationList = check shopify->retrieveAListOfLocations();
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
    StoreLocationCount countOfLocations = check shopify->retrieveACountOfLocations();
    test:assertTrue(countOfLocations.count >= 0);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetACountOfProducts() returns error? {
    ObjectCount productCount = check shopify->retrieveACountOfProducts();
    test:assertTrue(productCount.count >= 0);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetListOfDraftOrders() returns error? {
    DraftOrders draftOrders = check shopify->retrieveAListOfDraftOrders();
    DraftOrdersDraftOrders[]? orders = draftOrders?.draftOrders;
    test:assertTrue(orders !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetDraftOrder() returns error? {
    DraftOrders draftOrders = check shopify->retrieveAListOfDraftOrders();
    DraftOrdersDraftOrders[]? orders = draftOrders?.draftOrders;
    if orders is () || orders.length() == 0 {
        return;
    }
    int? firstOrderId = orders[0].id;
    if firstOrderId is () {
        test:assertFail("First draft order is missing an id.");
    }
    SingleDraftOrder draftOrder = check shopify->receiveASingleDraftOrder(firstOrderId.toString());
    test:assertEquals(draftOrder.draftOrder?.id, firstOrderId);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetCountOfAllDraftOrders() returns error? {
    StoreLocationCount draftOrderCount = check shopify->receiveACountOfAllDraftOrders();
    test:assertTrue(draftOrderCount.count >= 0);
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
    CountriesCount countryCount = check shopify->retrieveACountOfCountries();
    test:assertTrue(countryCount.count >= 0);
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
    PriceRules priceRules = check shopify->retrieveAListOfPriceRules();
    SinglePriceRulePriceRule[]? priceRulesResult = priceRules.priceRules;
    test:assertTrue(priceRulesResult !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetCountOfEvents() returns error? {
    EventsCount eventCount = check shopify->retrieveACountOfEvents();
    test:assertTrue(eventCount.count >= 0);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testCreateAGiftCard() returns error? {
    ApiVersionGiftCardsJsonBody payload = {
        giftCard: {
            initialValue: "100.00"
        }
    };
    GiftCard giftCard = check shopify->createAGiftCard(payload);
    GiftCardGiftCard? giftCardResult = giftCard.giftCard;
    if giftCardResult !is () {
        test:assertEquals(giftCardResult?.initialValue, payload.giftCard?.initialValue);
    } else {
        test:assertFail("No gift card was created.");
    }
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetCountOfGiftCards() returns error? {
    EventsCount count = check shopify->retrieveACountOfGiftCards();
    test:assertTrue(count?.count >= 0);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetListOfComments() returns error? {
    ArticleComments comments = check shopify->retrieveAListOfComments();
    ArticleCommentsComments[]? commentsResult = comments.comments;
    test:assertTrue(commentsResult !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetListOfSmartCollections() returns error? {
    SmartCollectionList smartCollections = check shopify->retrieveAListOfSmartCollections();
    SmartCollectionListSmartCollections[]? smartCollectionsResult = smartCollections.smartCollections;
    test:assertTrue(smartCollectionsResult !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetCountOfAllProductImages() returns error? {
    ProductsResponse products = check shopify->retrieveAListOfProducts();
    ProductsResponseProducts[]? productList = products.products;
    if productList is () || productList.length() == 0 {
        return;
    }
    int firstProductId = productList[0].id ?: 0;
    BlogsCount productImageCount = check shopify->receiveACountOfAllProductImages(firstProductId.toString());
    test:assertTrue((productImageCount.count ?: 0) >= 0);
}
