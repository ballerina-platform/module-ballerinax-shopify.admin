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

import ballerina/io;
import ballerinax/shopify.admin;

configurable string accessToken = ?;
configurable string serviceUrl = ?;

public function main() returns error? {
    admin:Client shopify = check new (
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

    admin:CustomerResponse response = check shopify->createsACustomer({
        customer: {
            first_name: "Steve",
            last_name: "Lastnameson",
            email: "steve.lastnameson@example.com"
        }
    });

    admin:OrderResponse newOrder = check shopify->createAnOrder({
        'order: {
            customer: {
                id: check (response.customer?.id).ensureType(decimal)
            },
            name: "new order",
            order_number: 0,
            confirmed: true
        }
    });

    io:println("New order has received: ", newOrder.'order);
}
