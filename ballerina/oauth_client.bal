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

# Holds the credentials required for the OAuth 2.0 client credentials flow.
# Obtain these values from your app in the Shopify Partner Dashboard.
public type ClientCredentialsConfig record {|
    # The Client ID of your Shopify app
    string clientId;
    # The Client Secret of your Shopify app
    string clientSecret;
    # Comma-separated list of access scopes e.g. "read_orders,read_products"
    string scope;
    # Your shop's myshopify.com domain e.g. "my-store.myshopify.com"
    string shopDomain;
|};

# A client wrapper that supports OAuth 2.0 client credentials authentication.
# Use this instead of `Client` when authenticating with a `clientId` and
# `clientSecret` rather than a static access token.
public isolated client class ShopifyAdminClient {

    private final ShopifyOAuthHandler oauthHandler;
    private final string serviceUrl;

    # Initializes the client and validates credentials by fetching an initial token.
    #
    # + credConfig - OAuth 2.0 credentials from the Shopify Partner Dashboard
    # + serviceUrl - Base URL of the Shopify store e.g. "https://my-store.myshopify.com"
    # + return - An error if the initial token fetch fails
    public isolated function init(ClientCredentialsConfig credConfig,
            string serviceUrl) returns error? {
        self.oauthHandler = new ShopifyOAuthHandler(
            credConfig.clientId,
            credConfig.clientSecret,
            credConfig.scope,
            credConfig.shopDomain
        );
        self.serviceUrl = serviceUrl;
        _ = check self.oauthHandler.getToken();
    }

    # Returns a `Client` instance configured with a fresh access token.
    # The token is automatically refreshed if it has expired.
    #
    # + return - A configured `Client` or an error if token refresh fails
    public isolated function getClient() returns Client|error {
        string token = check self.oauthHandler.getToken();
        return check new Client(
            apiKeyConfig = {xShopifyAccessToken: token},
            serviceUrl = self.serviceUrl
        );
    }
}