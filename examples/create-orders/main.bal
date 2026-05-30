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

import ballerina/io;
import ballerinax/shopify.admin as shopadmin;

configurable string serviceUrl = ?;
configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string scope = ?;
configurable string shopDomain = ?;

public function main() returns error? {
    shopadmin:ShopifyAdminClient shopifyWrapper = check new (
        {
            clientId: clientId,
            clientSecret: clientSecret,
            scope: scope,
            shopDomain: shopDomain
        },
        serviceUrl
    );

    shopadmin:Client shopify = check shopifyWrapper.getClient();

    shopadmin:ProductsResponse products = check shopify->retrieveAListOfProducts();
    io:println("Products in store: ", products.products);

    shopadmin:ShopConfigurations shopInfo = check shopify->retrieveTheShopSConfiguration();
    io:println("Shop name: ", shopInfo.shop?.name);
}