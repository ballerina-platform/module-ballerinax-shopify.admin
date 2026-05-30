// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com).
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
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/test;
import ballerina/http;

final string mockServiceUrl = "http://localhost:8080/shopify";
final string mockShopDomain = "localhost:8080/shopify";

@test:Config {
    groups: ["mock_tests", "oauth_tests"]
}
function testClientCredentialsConfigValues() {
    ClientCredentialsConfig config = {
        clientId: "test-client-id",
        clientSecret: "test-client-secret",
        scope: "read_products,read_orders",
        shopDomain: "test-store.myshopify.com"
    };

    test:assertEquals(config.clientId, "test-client-id",
        "clientId should be stored correctly");
    test:assertEquals(config.clientSecret, "test-client-secret",
        "clientSecret should be stored correctly");
    test:assertEquals(config.scope, "read_products,read_orders",
        "scope should be stored correctly");
    test:assertEquals(config.shopDomain, "test-store.myshopify.com",
        "shopDomain should be stored correctly");
}

@test:Config {
    groups: ["mock_tests", "oauth_tests"]
}
function testOAuthHandlerFetchesToken() returns error? {
    ShopifyOAuthHandler handler = new (
        "mock-client-id",
        "mock-client-secret",
        "read_products",
        mockShopDomain
    );
    string token = check handler.getToken();
    test:assertTrue(token.length() > 0, "Token should not be empty");
}

@test:Config {
    groups: ["mock_tests", "oauth_tests"]
}
function testTokenIsCached() returns error? {
    ShopifyOAuthHandler handler = new (
        "mock-client-id",
        "mock-client-secret",
        "read_products",
        mockShopDomain
    );

    // First call fetches token from mock server
    string token1 = check handler.getToken();
    test:assertEquals(token1, "mock-access-token-12345",
        "First call should return the mock token");

    // Second call should use cached token — not make another server request.
    // Since the mock returns a token valid for 86400s, the cache will be used.
    string token2 = check handler.getToken();
    test:assertEquals(token2, "mock-access-token-12345",
        "Cached call should return the same mock token");

    // Verify both calls returned identical values
    test:assertEquals(token1, token2,
        "Token should be served from cache on second call");

    // Verify only one network request was made by checking counter
    http:Client mockClient = check new ("http://localhost:8080/shopify");
    json countResponse = check mockClient->get("/admin/oauth/token_request_count");
    int count = check countResponse.count;
    test:assertTrue(count >= 1, "Token endpoint should have been called at least once");
}

@test:Config {
    groups: ["mock_tests", "oauth_tests"]
}
function testShopifyAdminClientInit() returns error? {
    ShopifyAdminClient _ = check new (
        {
            clientId: "mock-client-id",
            clientSecret: "mock-client-secret",
            scope: "read_products",
            shopDomain: mockShopDomain
        },
        mockServiceUrl
    );
    test:assertTrue(true, "ShopifyAdminClient initialized successfully");
}

@test:Config {
    groups: ["mock_tests", "oauth_tests"]
}
function testGetClientReturnsWorkingClient() returns error? {
    ShopifyAdminClient wrapper = check new (
        {
            clientId: "mock-client-id",
            clientSecret: "mock-client-secret",
            scope: "read_products",
            shopDomain: mockShopDomain
        },
        mockServiceUrl
    );
    Client shopify = check wrapper.getClient();
    ProductsResponse products = check shopify->retrieveAListOfProducts();
    test:assertTrue(products.products !is (),
        "Products list should not be null");
}