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

import shopify.oas;

import ballerina/http;

# This is the public Shopify REST API.
public isolated client class Client {
    final oas:Client generatedClient;
    final string accessToken;
    final string apiVersion;

    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(string accessToken, string apiVersion, ConnectionConfig config, string serviceUrl) returns error? {
        self.accessToken = accessToken;
        self.apiVersion = apiVersion;
        oas:ConnectionConfig oasConnectionConfig = getOasConnectionConfig(config);
        self.generatedClient = check new ({ x\-shopify\-access\-token: accessToken}, serviceUrl, oasConnectionConfig);
    }

    # Get a list of access scopes
    #
    # + return - List all scopes / List all scopes 
    remote isolated function getAListOfAccessScopes(map<string|string[]> headers = {}) returns AccessScopes|error {
        return check self.generatedClient->getAListOfAccessScopes();
    }

    # Retrieves a list of storefront access tokens that have been issued
    #
    # + return - Retrieve a list of storefront access tokens that have been issued / Retrieve a list of storefront access tokens that have been issued 
    remote isolated function retrievesAListOfStorefrontAccessTokensThatHaveBeenIssued(map<string|string[]> headers = {}) returns StorefrontAccessTokens|error {
        return check self.generatedClient->retrievesAListOfStorefrontAccessTokensThatHaveBeenIssued(self.apiVersion, headers);
    }

    # Creates a new StorefrontAccessToken
    #
    # + payload - The payload to create a new storefront access token
    # + return - Create a new storefront access token / Create a new storefront access token 
    remote isolated function createsANewStorefrontAccesstoken(ApiVersionStorefrontAccessTokensJsonBody payload, map<string|string[]> headers = {}) returns StorefrontAccessToken|error {
        return check self.generatedClient->createsANewStorefrontaccesstoken(self.apiVersion, payload, headers);
    }

    # Deletes an existing storefront access token
    #
    # + storefrontAccessTokenId - The ID of the storefront access token
    # + payload - The payload to delete an existing storefront access token
    # + return - Deletes an existing storefront access token / Deletes an existing storefront access token 
    remote isolated function deletesAnExistingStorefrontAccessToken(string storefrontAccessTokenId, string payload, map<string|string[]> headers = {}) returns string|error {
        return check self.generatedClient->deletesAnExistingStorefrontAccessToken(self.apiVersion, storefrontAccessTokenId, payload, headers);
    }

    # Retrieves a list of application charges
    #
    # + fields - A comma-separated list of fields to include in the response
    # + since_id - Restrict results to after the specified ID
    # + return - Retrieves a list of application charges / Retrieves a list of application charges 
    remote isolated function retrievesAListOfApplicationCharges(map<string|string[]> headers = {}, *RetrievesAListOfApplicationChargesQueries queries) returns ApplicationChargesList|error {
        return check self.generatedClient->retrievesAListOfApplicationCharges(self.apiVersion, headers, queries);
    }

    # Creates an application charge
    #
    # + payload - The payload to create an application charge
    # + return - Create a test charge that will not cause a credit card to be charged / Creates an application charge / Create a test charge that will not cause a credit card to be charged / Creates an application charge 
    remote isolated function createsAnApplicationCharge(ApiVersionApplicationChargesJsonBody payload, map<string|string[]> headers = {}) returns ApplicationCharge|error {
        return check self.generatedClient->createsAnApplicationCharge(self.apiVersion, payload, headers);
    }

    # Retrieves an application charge
    #
    # + applicationChargeId - The ID of the application charge
    # + fields - A comma-separated list of fields to include in the response
    # + return - Retrieves an application charge / Retrieves an application charge
    remote isolated function retrievesAnApplicationCharge(string applicationChargeId, map<string|string[]> headers = {}, *RetrievesAnApplicationChargeQueries queries) returns ApplicationChargeResult|error {
        return check self.generatedClient->retrievesAnApplicationCharge(self.apiVersion, applicationChargeId, headers, queries);
    }

    # Retrieves all application credits
    #
    # + fields - A comma-separated list of fields to include in the response
    # + return - Retrieves all application credits / Retrieves all application credits
    remote isolated function retrievesAllApplicationCredits(map<string|string[]> headers = {}, *RetrievesAllApplicationCreditsQueries queries) returns ApplicationCredits|error {
        return check self.generatedClient->retrievesAllApplicationCredits(self.apiVersion, headers, queries);
    }

    # Retrieves a single application credit
    #
    # + aplicationCreditId - The ID of the application credit
    # + fields - A comma-separated list of fields to include in the response
    # + return - Retrieves a single application credit / Retrieves a single application credit
    remote isolated function retrievesASingleApplicationCredit(string aplicationCreditId, map<string|string[]> headers = {}, *RetrievesASingleApplicationCreditQueries queries) returns ApplicationCredit|error {
        return check self.generatedClient->retrievesASingleApplicationCredit(self.apiVersion, aplicationCreditId, headers, queries);
    }

    # Retrieves a list of recurring application charges
    #
    # + fields - A comma-separated list of fields to include in the response. 
    # + since_id - Restrict results to after the specified ID. 
    # + return - Retrieves a list of recurring application charges / Retrieves a list of recurring application charges 
    remote isolated function retrievesAListOfRecurringApplicationCharges(map<string|string[]> headers = {}, *RetrievesAListOfRecurringApplicationChargesQueries queries) returns RecurringApplicationCharges|error {
        return check self.generatedClient->retrievesAListOfRecurringApplicationCharges(self.apiVersion, headers, queries);
    }

    # Creates a recurring application charge
    #
    # + payload - The payload to create a recurring application charge
    # + return - Create a new charge with a trial period. The trial period will go into effect at the time the recurring charge is activated. / Create a new charge with terms and a capped amount / Create a recurring application charge / Create a recurring test charge that will not cause a credit card to be charged / Create a new charge with a trial period. The trial period will go into effect at the time the recurring charge is activated. / Create a new charge with terms and a capped amount / Create a recurring application charge / Create a recurring test charge that will not cause a credit card to be charged
    remote isolated function createsARecurringApplicationCharge(ApiVersionRecurringApplicationChargesJsonBody payload, map<string|string[]> headers = {}) returns ApplicationChargeResponse|error {
        return check self.generatedClient->createsARecurringApplicationCharge(self.apiVersion, payload, headers);
    }

    # Retrieves a single charge
    #
    # + recurringApplicationChargeId - The ID of the recurring application charge
    # + fields - A comma-separated list of fields to include in the response
    # + return - Retrieves a single charge / Retrieves a single charge
    remote isolated function retrievesASingleCharge(string recurringApplicationChargeId, map<string|string[]> headers = {}, *RetrievesASingleChargeQueries queries) returns SingleCharge|error {
        return check self.generatedClient->retrievesASingleCharge(self.apiVersion, recurringApplicationChargeId, headers, queries);
    }

    # Cancels a recurring application charge
    #
    # + recurringApplicationChargeId - The ID of the recurring application charge  
    # + return - Cancel the current recurring charge for a shop / Cancel the current recurring charge for a shop
    remote isolated function cancelsARecurringApplicationCharge(string recurringApplicationChargeId, string payload, map<string|string[]> headers = {}) returns string|error {
        return check self.generatedClient->cancelsARecurringApplicationCharge(self.apiVersion, recurringApplicationChargeId, payload, headers);
    }

    # Updates the capped amount of a recurring application charge
    #
    # + recurringApplicationChargeId - The ID of the recurring application charge
    # + payload - The payload to update the capped amount of a recurring application charge
    # + recurring_application_chargeCapped_amount - The capped amount for the shop
    # + return - Increase the capped amount for a shop / Increase the capped amount for a shop 
    remote isolated function updatesTheCappedAmountOfARecurringApplicationCharge(string recurringApplicationChargeId, string payload, map<string|string[]> headers = {}, *UpdatesTheCappedAmountOfARecurringApplicationChargeQueries queries) returns CappedAmountCharge|error {
        return check self.generatedClient->updatesTheCappedAmountOfARecurringApplicationCharge(self.apiVersion, recurringApplicationChargeId, payload, headers, queries);
    }

    # Retrieves a list of usage charges
    #
    # + recurringApplicationChargeId - The ID of the recurring application charge
    # + fields - A comma-separated list of fields to include in the response
    # + return - Retrieve all usage charges / Retrieve all usage charges
    remote isolated function retrievesAListOfUsageCharges(string recurringApplicationChargeId, map<string|string[]> headers = {}, *RetrievesAListOfUsageChargesQueries queries) returns UsageChargeList|error {
        return check self.generatedClient->retrievesAListOfUsageCharges(self.apiVersion, recurringApplicationChargeId, headers, queries);
    }

    # Creates a usage charge
    #
    # + recurringApplicationChargeId - The ID of the recurring application charge
    # + payload - The payload to create a usage charge
    # + return - Create a new usage charge / Create a new usage charge 
    remote isolated function createsAUsageCharge(string recurringApplicationChargeId, RecurringApplicationChargeIdUsageChargesJsonBody payload, map<string|string[]> headers = {}) returns UsageChargeResponse|error {
        return check self.generatedClient->createsAUsageCharge(self.apiVersion, recurringApplicationChargeId, payload, headers);
    }

    # Retrieves a single charge
    #
    # + recurringApplicationChargeId - The ID of the recurring application charge
    # + usageChargeId - The ID of the usage charge
    # + fields - A comma-separated list of fields to include in the response. 
    # + return - Retrieves a single charge / Retrieves a single charge 
    remote isolated function retrievesASingleCharge1(string recurringApplicationChargeId, string usageChargeId, map<string|string[]> headers = {}, *RetrievesASingleCharge1Queries queries) returns SingleUsageCharge|error {
        return check self.generatedClient->retrievesASingleCharge1(self.apiVersion, recurringApplicationChargeId, usageChargeId, headers, queries);
    }

    # Retrieves a list of customers
    #
    # + created_at_max - Show customers created before a specified date.  
    # (format: 2014-04-25T16:15:47-04:00) 
    # + created_at_min - Show customers created after a specified date.  
    # (format: 2014-04-25T16:15:47-04:00) 
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + ids - Restrict results to customers specified by a comma-separated list of IDs. 
    # + 'limit - The maximum number of results to show.(default: 50)(maximum: 250) 
    # + since_id - Restrict results to those after the specified ID. 
    # + updated_at_max - Show customers last updated before a specified date.  
    # (format: 2014-04-25T16:15:47-04:00) 
    # + updated_at_min - Show customers last updated after a specified date.  
    # (format: 2014-04-25T16:15:47-04:00) 
    # + return - Retrieve a list of customers
    remote isolated function retrievesAListOfCustomers(map<string|string[]> headers = {}, *RetrievesAListOfCustomersQueries queries) returns Customers|error {
        return check self.generatedClient->retrievesAListOfCustomers(self.apiVersion, headers, queries);
    }

    # Creates a customer
    #
    # + payload - The payload to create a customer
    # + return - Create a new customer record / Create a customer with password and password_confirmation and skip sending the welcome email / Create a customer with send_email_invite / Create a customer with a metafield / Create a new customer record / Create a customer with password and password_confirmation and skip sending the welcome email / Create a customer with send_email_invite / Create a customer with a metafield 
    remote isolated function createsACustomer(CreateCustomer payload, map<string|string[]> headers = {}) returns CustomerResponse|error {
        return check self.generatedClient->createsACustomer(self.apiVersion, payload, headers);
    }

    # Creates an account activation URL for a customer
    #
    # + customerId - The ID of the customer
    # + payload - The payload to create an account activation URL for a customer
    # + return - Create an account activation URL for an invited or disabled customer / Create an account activation URL for an invited or disabled customer 
    remote isolated function createsAnAccountActivationUrlForACustomer(string customerId, CustomerInvite payload, map<string|string[]> headers = {}) returns AccountActivationUrl|error {
        return check self.generatedClient->createsAnAccountActivationUrlForACustomer(self.apiVersion, customerId, payload, headers);
    }

    # Sends an account invite to a customer
    #
    # + customerId - The ID of the customer
    # + payload - The payload to send an account invite to a customer
    # + return - Send a customized invite / Send the default invite / Send a customized invite / Send the default invite 
    remote isolated function sendsAnAccountInviteToACustomer(string customerId, CustomerIdSendInviteJsonBody payload, map<string|string[]> headers = {}) returns AccountInvite|error {
        return check self.generatedClient->sendsAnAccountInviteToACustomer(self.apiVersion, customerId, payload, headers);
    }

    # Retrieves a single customer
    #
    # + customerId - The ID of the customer
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - Retrieves a single customer 
    remote isolated function retrievesASingleCustomer(string customerId, string? fields = (), map<string|string[]> headers = {}) returns CustomerResponse|error {
        return check self.generatedClient->retrievesASingleCustomer(self.apiVersion, customerId, headers);
    }

    # Updates a customer
    #
    # + customerId - The ID of the customer
    # + payload - The payload to update a customer
    # + return - Retrieves a single customer 
    remote isolated function updatesACustomer(string customerId, UpdateCustomer payload, map<string|string[]> headers = {}) returns CustomerResponse|error {
        return check self.generatedClient->updatesACustomer(self.apiVersion, customerId, payload, headers);
    }

    # Deletes a customer.
    #
    # + customerId - The ID of the customer
    # + payload - The payload to delete a customer
    # + return - Retrieves a single customer 
    remote isolated function deletesACustomer(string customerId, string payload, map<string|string[]> headers = {}) returns CustomerResponse|error {
        return check self.generatedClient->deletesACustomer(self.apiVersion, customerId, payload, headers);
    }

    # Retrieves all orders belonging to a customer
    #
    # + customerId - The ID of the customer
    # + return - Retrieve all orders belonging to a customer
    remote isolated function retrievesAllOrdersBelongingToACustomer(string customerId, map<string|string[]> headers = {}) returns Orders|error {
        return check self.generatedClient->retrievesAllOrdersBelongingToACustomer(self.apiVersion, customerId, headers);
    }

    # Retrieves a count of customers
    #
    # + return - Retrieve a count of customers
    remote isolated function retrievesACountOfCustomers(map<string|string[]> headers = {}) returns EventsCount|error {
        return check self.generatedClient->retrievesACountOfCustomers(self.apiVersion, headers);
    }

    # Searches for customers that match a supplied query
    #
    # + fields - Show only certain fields, specified by a comma-separated list of field names
    # + 'limit - The maximum number of results to show.(default: 50)(maximum: 250)
    # + 'order - Set the field and direction by which to order results.(default: last\_order\_date DESC)
    # + query - Text to search for in the shop\'s customer data
    # + return - Searches for customers that match a supplied query
    remote isolated function searchesForCustomersThatMatchASuppliedQuery(map<string|string[]> headers = {}, *SearchesForCustomersThatMatchASuppliedQueryQueries queries) returns Customers|error {
        return check self.generatedClient->searchesForCustomersThatMatchASuppliedQuery(self.apiVersion, headers, queries);
    }

    # Retrieves a list of addresses for a customer
    #
    # + customerId - The ID of the customer
    # + return - Retrieve all of a customer’s addresses / Retrieve a limited number of addresses for a customer / Retrieve all of a customer’s addresses / Retrieve a limited number of addresses for a customer 
    remote isolated function retrievesAListOfAddressesForACustomer(string customerId, map<string|string[]> headers = {}) returns AddressList|error {
        return check self.generatedClient->retrievesAListOfAddressesForACustomer(self.apiVersion, customerId, headers);
    }

    # Creates a new address for a customer
    #
    # + customerId - The ID of the customer
    # + payload - The payload to create a new address for a customer
    # + return - Create a new address for a customer
    remote isolated function createsANewAddressForACustomer(string customerId, CustomerIdAddressesJsonBody payload, map<string|string[]> headers = {}) returns CustomerAddress|error {
        return check self.generatedClient->createsANewAddressForACustomer(self.apiVersion, customerId, payload, headers);
    }

    # Retrieves details for a single customer address
    #
    # + customerId - The ID of the customer
    # + addressId - The ID of the address
    # + return - Retrieve a single customer address
    remote isolated function retrievesDetailsForASingleCustomerAddress(string customerId, string addressId, map<string|string[]> headers = {}) returns SingleCustomerAddress|error {
        return check self.generatedClient->retrievesDetailsForASingleCustomerAddress(self.apiVersion, customerId, addressId, headers);
    }

    # Updates an existing customer address
    #
    # + customerId - The ID of the customer
    # + addressId - The ID of the address
    # + payload - The payload to update an existing customer address
    # + return - Update the postal code of a customer address
    remote isolated function updatesAnExistingCustomerAddress(string customerId, string addressId, AddressesaddressIdJsonBody payload, map<string|string[]> headers = {}) returns PostalCodeResult|error {
        return check self.generatedClient->updatesAnExistingCustomerAddress(self.apiVersion, customerId, addressId, payload, headers);
    }

    # Removes an address from a customer’s address list
    #
    # + customerId - The ID of the customer
    # + addressId - The ID of the address
    # + payload - The payload to remove an address from a customer’s address list
    # + return - Remove a customer address
    remote isolated function removesAnAddressFromACustomerSAddressList(string customerId, string addressId, string payload, map<string|string[]> headers = {}) returns record {}|error {
        return check self.generatedClient->removesAnAddressFromACustomerSAddressList(self.apiVersion, customerId, addressId, payload, headers);
    }

    # Sets the default address for a customer
    #
    # + customerId - The ID of the customer
    # + addressId - The ID of the address
    # + return - Set a default address for a customer
    remote isolated function setsTheDefaultAddressForACustomer(string customerId, string addressId, string payload, map<string|string[]> headers = {}) returns CustomerDefaultAddress|error {
        return check self.generatedClient->setsTheDefaultAddressForACustomer(self.apiVersion, customerId, addressId, payload, headers);
    }

    # Performs bulk operations for multiple customer addresses
    #
    # + customerId - The ID of the customer
    # + payload - The payload to perform bulk operations for multiple customer addresses
    # + return - Destroy multiple customer addresses 
    remote isolated function performsBulkOperationsForMultipleCustomerAddresses(string customerId, string payload, map<string|string[]> headers = {}) returns json|error {
        return check self.generatedClient->performsBulkOperationsForMultipleCustomerAddresses(self.apiVersion, customerId, payload, headers);
    }

    # Creates a discount code creation job
    #
    # + priceRuleId - The ID of the price rule
    # + payload - The payload to create a discount code creation job
    # + return - Create a discount code creation job
    remote isolated function createsADiscountCodeCreationJob(string priceRuleId, PriceRuleIdBatchJsonBody payload, map<string|string[]> headers = {}) returns DiscountCode|error {
        return check self.generatedClient->createsADiscountCodeCreationJob(self.apiVersion, priceRuleId, payload, headers);
    }

    # Retrieves a list of discount codes
    #
    # + priceRuleId - The ID of the price rule
    # + return - Retrieve a list of all discount codes
    remote isolated function retrievesAListOfDiscountCodes(string priceRuleId, map<string|string[]> headers = {}) returns DiscountCodes|error {
        return check self.generatedClient->retrievesAListOfDiscountCodes(self.apiVersion, priceRuleId, headers);
    }

    # Creates a discount code
    #
    # + priceRuleId - The ID of the price rule
    # + payload - The payload to create a discount code
    # + return - Create a discount code / Create a discount code 
    remote isolated function createsADiscountCode(string priceRuleId, PriceRuleIdDiscountCodesJsonBody payload, map<string|string[]> headers = {}) returns CreateDiscountCode|error {
        return check self.generatedClient->createsADiscountCode(self.apiVersion, priceRuleId, payload, headers);
    }

    # Retrieves a count of discount codes for a shop
    #
    # + times_used - Show discount codes with times used
    # + times_used_max - Show discount codes used greater than or equal to this value
    # + times_used_min - Show discount codes used less than or equal to this value
    # + return - Retrieve a count of discount codes for a shop
    remote isolated function retrievesACountOfDiscountCodesForAShop(map<string|string[]> headers = {}, *RetrievesACountOfDiscountCodesForAShopQueries queries) returns EventsCount|error {
        return check self.generatedClient->retrievesACountOfDiscountCodesForAShop(self.apiVersion, headers, queries);
    }

    # Retrieves the location of a discount code
    #
    # + return - Retrieve the location of a discount code
    remote isolated function retrievesTheLocationOfADiscountCode(map<string|string[]> headers = {}) returns http:Response|error {
        return check self.generatedClient->retrievesTheLocationOfADiscountCode(self.apiVersion, headers);
    }

    # Retrieves a discount code creation job
    #
    # + priceRuleId - The ID of the price rule
    # + batchId - The ID of the batch
    # + return - Retrieve a discount code creation job
    remote isolated function retrievesADiscountCodeCreationJob(string priceRuleId, string batchId, map<string|string[]> headers = {}) returns DiscountCodeResponse|error {
        return check self.generatedClient->retrievesADiscountCodeCreationJob(self.apiVersion, priceRuleId, batchId, headers);
    }

    # Retrieves a list of discount codes for a discount code creation job
    #
    # + priceRuleId - The ID of the price rule
    # + batchId - The ID of the batch
    # + return - Retrieve a list of discount codes for a discount code creation job
    remote isolated function retrievesAListOfDiscountCodesForADiscountCodeCreationJob(string priceRuleId, string batchId, map<string|string[]> headers = {}) returns DiscountCodeList|error {
        return check self.generatedClient->retrievesAListOfDiscountCodesForADiscountCodeCreationJob(self.apiVersion, priceRuleId, batchId, headers);
    }

    # Retrieves a single discount code
    #
    # + priceRuleId - The ID of the price rule
    # + discountCodeId - The ID of the discount code
    # + return - Retrieve a single discount code / Retrieve a single discount code 
    remote isolated function retrievesASingleDiscountCode(string priceRuleId, string discountCodeId, map<string|string[]> headers = {}) returns SingleDiscountCode|error {
        return check self.generatedClient->retrievesASingleDiscountCode(self.apiVersion, priceRuleId, discountCodeId, headers);
    }

    # Updates an existing discount code
    #
    # + priceRuleId - The ID of the price rule
    # + discountCodeId - The ID of the discount code
    # + payload - The payload to update an existing discount code
    # + return - Update the code for a discount / Update the code for a discount 
    remote isolated function updatesAnExistingDiscountCode(string priceRuleId, string discountCodeId, DiscountCodesdiscountCodeIdJsonBody payload, map<string|string[]> headers = {}) returns UpdateDiscountCode|error {
        return check self.generatedClient->updatesAnExistingDiscountCode(self.apiVersion, priceRuleId, discountCodeId, payload, headers);
    }

    # Deletes a discount code
    #
    # + priceRuleId - The ID of the price rule
    # + discountCodeId - The ID of the discount code
    # + payload - The payload to delete a discount code
    # + return - Delete a discount code / Delete a discount code 
    remote isolated function deletesADiscountCode(string priceRuleId, string discountCodeId, string payload, map<string|string[]> headers = {}) returns string|error {
        return check self.generatedClient->deletesADiscountCode(self.apiVersion, priceRuleId, discountCodeId, payload, headers);
    }

    # Retrieves a list of price rules
    #
    # + 'limit - The maximum number of results to retrieve.(default: 50)(maximum: 250) 
    # + since_id - Restrict results to after the specified ID. 
    # + created_at_min - Show price rules created after date (format 2017-03-25T16:15:47-04:00). 
    # + created_at_max - Show price rules created before date (format 2017-03-25T16:15:47-04:00). 
    # + updated_at_min - Show price rules last updated after date (format 2017-03-25T16:15:47-04:00). 
    # + updated_at_max - Show price rules last updated before date (format 2017-03-25T16:15:47-04:00). 
    # + starts_at_min - Show price rules starting after date (format 2017-03-25T16:15:47-04:00). 
    # + starts_at_max - Show price rules starting before date (format 2017-03-25T16:15:47-04:00). 
    # + ends_at_min - Show price rules ending after date (format 2017-03-25T16:15:47-04:00). 
    # + ends_at_max - Show price rules ending before date (format 2017-03-25T16:15:47-04:00). 
    # + times_used - Show price rules with times used. 
    # + return - Retrieve all price rules / Retrieve all price rules 
    remote isolated function retrievesAListOfPriceRules(map<string|string[]> headers = {}, *RetrievesAListOfPriceRulesQueries queries) returns PriceRules|error {
        return check self.generatedClient->retrievesAListOfPriceRules(self.apiVersion, headers, queries);
    }

    # Creates a price rule
    #
    # + payload - The payload to create a price rule
    # + return - Create a price rule that gives the buyer 15% off a specific collection / Create a price rule that gives a select group of customers $5 off their order / Create a price rule that gives the buyer free shipping on orders         over $50.00 that can be used up to 20 times / Create a Buy X Get Y price rule that gives one free ipod touch if customer buys 2 ipods  / Create a price rule that gives the buyer $10.00 off an order / Create a price rule that gives the buyer 15% off a specific collection / Create a price rule that gives a select group of customers $5 off their order / Create a price rule that gives the buyer free shipping on orders         over $50.00 that can be used up to 20 times / Create a Buy X Get Y price rule that gives one free ipod touch if customer buys 2 ipods  / Create a price rule that gives the buyer $10.00 off an order 
    remote isolated function createsAPriceRule(ApiVersionPriceRulesJsonBody payload, map<string|string[]> headers = {}) returns PriceRule|error {
        return check self.generatedClient->createsAPriceRule(self.apiVersion, payload, headers);
    }

    # Retrieves a single price rule
    #
    # + priceRuleId - The ID of the price rule
    # + return - Retrieve a single price rule by its ID / Retrieve a single price rule by its ID
    remote isolated function retrievesASinglePriceRule(string priceRuleId, map<string|string[]> headers = {}) returns SinglePriceRule|error {
        return check self.generatedClient->retrievesASinglePriceRule(self.apiVersion, priceRuleId, headers);
    }

    # Updates an existing a price rule
    #
    # + priceRuleId - The ID of the price rule
    # + payload - The payload to update a price rule
    # + return - Update the title of a price rule / Update the title of a price rule
    remote isolated function updatesAnExistingAPriceRule(string priceRuleId, PriceRulespriceRuleIdJsonBody payload, map<string|string[]> headers = {}) returns UpdatePriceRule|error {
        return check self.generatedClient->updatesAnExistingAPriceRule(self.apiVersion, priceRuleId, payload, headers);
    }

    # Remove an existing PriceRule
    #
    # + priceRuleId - The ID of the price rule
    # + payload - The payload to delete a price rule
    # + return - Delete a price rule / Delete a price rule
    remote isolated function removeAnExistingPriceRule(string priceRuleId, string payload, map<string|string[]> headers = {}) returns string|error {
        return check self.generatedClient->removeAnExistingPriceRule(self.apiVersion, priceRuleId, payload, headers);
    }

    # Retrieves a count of all price rules
    #
    # + return - Retrieve a count of all price rules
    remote isolated function retrievesACountOfAllPriceRules(map<string|string[]> headers = {}) returns ObjectCount|error {
        return check self.generatedClient->retrievesACountOfAllPriceRules(self.apiVersion, headers);
    }

    # Retrieves a list of events
    #
    # + 'limit - The number of results to show.(default: 50)(maximum: 250) 
    # + since_id - Show only results after the specified ID. 
    # + created_at_min - Show events created at or after this date and time. (format: 2014-04-25T16:15:47-04:00) 
    # + created_at_max - Show events created at or before this date and time. (format: 2014-04-25T16:15:47-04:00) 
    # + filter - Show events specified in this filter. 
    # + verb - Show events of a certain type. 
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - Retrieve a list of events related to products that were deleted / Retrieve a list of all events from a specific order / Retrieve all events after the specified ID / Retrieve an event after a specific ID using <code>since_id</code> / Retrieve a list of all events related to products and orders / Retrieve all events from a specific product / Retrieve a list of events that occured at the specified time / Retrieve a list of all events for a shop / Retrieve a list of events related to products that were deleted / Retrieve a list of all events from a specific order / Retrieve all events after the specified ID / Retrieve an event after a specific ID using <code>since_id</code> / Retrieve a list of all events related to products and orders / Retrieve all events from a specific product / Retrieve a list of events that occured at the specified time / Retrieve a list of all events for a shop 
    remote isolated function retrievesAListOfEvents(map<string|string[]> headers = {}, *RetrievesAListOfEventsQueries queries) returns EventsList|error {
        return check self.generatedClient->retrievesAListOfEvents(self.apiVersion, headers, queries);
    }

    # Retrieves a single event
    #
    # + eventId - The ID of the event 
    # + fields - Show only certain fields, specified by a comma-separated list of field names.
    # + return - Retrieves a single event by its ID / Retrieves a single event by its ID
    remote isolated function retrievesASingleEvent(string eventId, map<string|string[]> headers = {}, *RetrievesASingleEventQueries queries) returns SingleEvent|error {
        return check self.generatedClient->retrievesASingleEvent(self.apiVersion, eventId, headers, queries);
    }

    # Retrieves a count of events
    #
    # + created_at_min - Count only events created at or after this date and time. (format: 2014-04-25T16:15:47-04:00) 
    # + created_at_max - Count only events created at or before this date and time. (format: 2014-04-25T16:15:47-04:00) 
    # + return - Count all events / Count of the number of events since a particular time / Count all events / Count of the number of events since a particular time 
    remote isolated function retrievesACountOfEvents(map<string|string[]> headers = {}, *RetrievesACountOfEventsQueries queries) returns EventsCount|error {
        return check self.generatedClient->retrievesACountOfEvents(self.apiVersion, headers, queries);
    }

    # Retrieves a list of gift cards
    #
    # + status - Retrieve gift cards with a given status. Valid values: enabled, disabled
    # + 'limit - The maximum number of results to show.(default: 50)(maximum: 250) 
    # + since_id - Restrict results to after the specified ID. 
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - Retrieve a list of all gift cards / Retrieve a list of all enabled gift cards / Retrieve a list of all gift cards / Retrieve a list of all enabled gift cards 
    remote isolated function retrievesAListOfGiftCards(map<string|string[]> headers = {}, *RetrievesAListOfGiftCardsQueries queries) returns GiftCardsList|error {
        return check self.generatedClient->retrievesAListOfGiftCards(self.apiVersion, headers, queries);
    }

    # Creates a gift card
    #
    # + payload - The payload to create a gift card
    # + return - Create a gift card with a custom code / Create a gift card with an automatically generated code / Create a gift card with a custom code / Create a gift card with an automatically generated code 
    remote isolated function createsAGiftCard(ApiVersionGiftCardsJsonBody payload, map<string|string[]> headers = {}) returns GiftCard|error {
        return check self.generatedClient->createsAGiftCard(self.apiVersion, payload, headers);
    }

    # Disables a gift card
    #
    # + giftCardId - The ID of the gift card
    # + payload - The payload to disable a gift card
    # + return - Disable a gift card / Disable a gift card 
    remote isolated function disablesAGiftCard(string giftCardId, GiftCardIdDisableJsonBody payload, map<string|string[]> headers = {}) returns DisableGiftCard|error {
        return check self.generatedClient->disablesAGiftCard(self.apiVersion, giftCardId, payload, headers);
    }

    # Retrieves a single gift card
    #
    # + giftCardId - The ID of the gift card
    # + status - Count gift cards with a given status. Valid values: enabled, disabled
    # + return - Retrieve a single gift card / Retrieve a single gift card 
    remote isolated function retrievesASingleGiftCard(string giftCardId, map<string|string[]> headers = {}, *RetrievesASingleGiftCardQueries queries) returns SingleGiftCard|error {
        return check self.generatedClient->retrievesASingleGiftCard(self.apiVersion, giftCardId, headers, queries);
    }

    # Updates an existing gift card
    #
    # + giftCardId - The ID of the gift card
    # + payload - The payload to update an existing gift card
    # + return - Update the expiry date of a gift card / Update the note of a gift card / Update the expiry date of a gift card / Update the note of a gift card 
    remote isolated function updatesAnExistingGiftCard(string giftCardId, GiftCardsgiftCardIdJsonBody payload, map<string|string[]> headers = {}) returns UpdateGiftCard|error {
        return check self.generatedClient->updatesAnExistingGiftCard(self.apiVersion, giftCardId, payload, headers);
    }

    # Retrieves a count of gift cards
    #
    # + status - Count gift cards with a given status
    # + return - Retrieve a count of enabled gift cards / Retrieve a count of all gift cards / Retrieve a count of enabled gift cards / Retrieve a count of all gift cards
    remote isolated function retrievesACountOfGiftCards(map<string|string[]> headers = {}, *RetrievesACountOfGiftCardsQueries queries) returns EventsCount|error {
        return check self.generatedClient->retrievesACountOfGiftCards(self.apiVersion, headers, queries);
    }

    # Searches for gift cards
    #
    # + created_at_max - Show gift cards created at or before date.
    # + created_at_min - Show gift cards created at or after date.
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + 'limit - The maximum number of results to retrieve.(default: 50)(maximum: 250) 
    # + 'order - The field and direction to order results by.(default: disabled\_at DESC) 
    # + query - The text to search for.
    # + updated_at_max - Show gift cards last updated at or before date.
    # + updated_at_min - Show gift cards last updated at or after date.
    # + return - Retrieve all gift cards with the last characters "mnop" / Retrieve all gift cards with the last characters "mnop"
    remote isolated function searchesForGiftCards(map<string|string[]> headers = {}, *SearchesForGiftCardsQueries queries) returns GiftCardSearch|error {
        return check self.generatedClient->searchesForGiftCards(self.apiVersion, headers, queries);
    }

    # Retrieves a detailed list for inventory items by IDs
    #
    # + ids - Show only inventory items specified by a comma-separated list of IDs.(maximum: 100)
    # + 'limit - The maximum number of results to show.(default: 50)(maximum: 250)
    # + return - Retrieve a detailed list for inventory items by IDs
    remote isolated function retrievesADetailedListForInventoryItemsByIds(map<string|string[]> headers = {}, *RetrievesADetailedListForInventoryItemsByIdsQueries queries) returns error? {
        return check self.generatedClient->retrievesADetailedListForInventoryItemsByIds(self.apiVersion, headers, queries);
    }

    # Retrieves a single inventory item by ID
    #
    # + inventoryItemId - The ID of the inventory item
    # + return - Retrieve an inventory item by ID / Retrieve an inventory item by ID 
    remote isolated function retrievesASingleInventoryItemById(string inventoryItemId, map<string|string[]> headers = {}) returns InventoryItem|error {
        return check self.generatedClient->retrievesASingleInventoryItemById(self.apiVersion, inventoryItemId, headers);
    }

    # Updates an existing inventory item
    #
    # + inventoryItemId - The ID of the inventory item
    # + payload - The payload to update an existing inventory item
    # + return - Update an inventory item's SKU / Update an inventory item's unit cost
    remote isolated function updatesAnExistingInventoryItem(string inventoryItemId, InventoryItemsinventoryItemIdJsonBody payload, map<string|string[]> headers = {}) returns UpdateInventoryItem|error {
        return check self.generatedClient->updatesAnExistingInventoryItem(self.apiVersion, inventoryItemId, payload, headers);
    }

    # Adjusts the inventory level of an inventory item at a location
    #
    # + payload - The payload to adjust the inventory level of an inventory item at a location
    # + return - Adjust the available quantity of an inventory item by 5 at a single location 
    remote isolated function adjustsTheInventoryLevelOfAnInventoryItemAtALocation(InventoryLevelsAdjustJsonBody payload, map<string|string[]> headers = {}) returns InventoryLevel|error {
        return check self.generatedClient->adjustsTheInventoryLevelOfAnInventoryItemAtALocation(self.apiVersion, payload, headers);
    }

    # Connects an inventory item to a location
    #
    # + payload - The payload to connect an inventory item to a location
    # + return - Connect an inventory item to a location
    remote isolated function connectsAnInventoryItemToALocation(InventoryLevelsConnectJsonBody payload, map<string|string[]> headers = {}) returns ConnectInventoryItem|error {
        return check self.generatedClient->connectsAnInventoryItemToALocation(self.apiVersion, payload, headers);
    }

    # Sets the inventory level for an inventory item at a location
    #
    # + payload - The payload to set the inventory level for an inventory item at a location
    # + return - Set the available inventory at a location
    remote isolated function setsTheInventoryLevelForAnInventoryItemAtALocation(InventoryLevelsSetJsonBody payload, map<string|string[]> headers = {}) returns AvailableInventory|error {
        return check self.generatedClient->setsTheInventoryLevelForAnInventoryItemAtALocation(self.apiVersion, payload, headers);
    }

    # Retrieves a list of inventory levels
    #
    # + inventory_item_ids - A comma-separated list of inventory item IDs.(maximum: 50) 
    # + location_ids - A comma-separated list of location IDs. To find the ID of a location, use the [Location resource](/api/reference/location).(maximum: 50) 
    # + 'limit - The maximum number of results to show.(default: 50)(maximum: 250) 
    # + updated_at_min - Show inventory levels updated at or after date (format: 2019-03-19T01:21:44-04:00). 
    # + return - Retrieve inventory levels for the specified inventory items and locations / Retrieve inventory levels at a single location / Retrieve inventory levels for a single inventory item / Retrieve inventory levels for the specified inventory items and locations / Retrieve inventory levels at a single location / Retrieve inventory levels for a single inventory item 
    remote isolated function retrievesAListOfInventoryLevels(map<string|string[]> headers = {}, *RetrievesAListOfInventoryLevelsQueries queries) returns InventoryLevels|error {
        return check self.generatedClient->retrievesAListOfInventoryLevels(self.apiVersion, headers, queries);
    }

    # Deletes an inventory level from a location
    #
    # + return - Delete an inventory level / Delete an inventory level 
    remote isolated function deletesAnInventoryLevelFromALocation(string payload, map<string|string[]> headers = {}) returns string|error {
        return check self.generatedClient->deletesAnInventoryLevelFromALocation(self.apiVersion, payload, headers);
    }

    # Retrieves a list of locations
    #
    # + return - Retrieve a list of all locations / Retrieve a list of all locations 
    remote isolated function retrievesAListOfLocations(map<string|string[]> headers = {}) returns LocationList|error {
        return check self.generatedClient->retrievesAListOfLocations(self.apiVersion, headers);
    }

    # Retrieves a single location by its ID
    #
    # + locationId - The ID of the location
    # + return - Retrieve a single location / Retrieve a single location 
    remote isolated function retrievesASingleLocationByItsId(string locationId, map<string|string[]> headers = {}) returns SingleLocation|error {
        return check self.generatedClient->retrievesASingleLocationByItsId(self.apiVersion, locationId, headers);
    }

    # Retrieves a list of inventory levels for a location.
    #
    # + locationId - The ID of the location
    # + return - Retrieve a list of all inventory for a location by its ID / Retrieve a list of all inventory for a location by its ID 
    remote isolated function retrievesAListOfInventoryLevelsForALocation(string locationId, map<string|string[]> headers = {}) returns InventoryListResponse|error {
        return check self.generatedClient->retrievesAListOfInventoryLevelsForALocation(self.apiVersion, locationId, headers);
    }

    # Retrieves a count of locations
    #
    # + return - Count all store locations / Count all store locations 
    remote isolated function retrievesACountOfLocations(map<string|string[]> headers = {}) returns StoreLocationCount|error {
        return check self.generatedClient->retrievesACountOfLocations(self.apiVersion, headers);
    }

    # Retrieves a list of all marketing events
    #
    # + 'limit - The amount of results to return.(default: 50)(maximum: 250)
    # + offset - The number of marketing events to skip
    # + return - Retrieve all marketing events / Retrieve all marketing events
    remote isolated function retrievesAListOfAllMarketingEvents(map<string|string[]> headers = {}, *RetrievesAListOfAllMarketingEventsQueries queries) returns MarketingEvents|error {
        return check self.generatedClient->retrievesAListOfAllMarketingEvents(self.apiVersion, headers, queries);
    }

    # Creates a marketing event
    #
    # + payload - The payload to create a marketing event
    # + return - Create a marketing event / Create a marketing event
    remote isolated function createsAMarketingEvent(ApiVersionMarketingEventsJsonBody payload, map<string|string[]> headers = {}) returns CreateMarketingEvent|error {
        return check self.generatedClient->createsAMarketingEvent(self.apiVersion, payload, headers);
    }

    # Creates marketing engagements on a marketing event
    #
    # + marketingEventId - The ID of the marketing event
    # + payload - The payload to create marketing engagements
    # + return - Add engagements to a marketing event / Add engagements to a marketing event
    remote isolated function createsMarketingEngagementsOnAMarketingEvent(string marketingEventId, MarketingEventIdEngagementsJsonBody payload, map<string|string[]> headers = {}) returns Engagements|error {
        return check self.generatedClient->createsMarketingEngagementsOnAMarketingEvent(self.apiVersion, marketingEventId, payload, headers);
    }

    # Retrieves a single marketing event
    #
    # + marketingEventId - The ID of the marketing event
    # + return - Retrieve a single marketing event by its ID
    remote isolated function retrievesASingleMarketingEvent(string marketingEventId, map<string|string[]> headers = {}) returns MarketingEvent|error {
        return check self.generatedClient->retrievesASingleMarketingEvent(self.apiVersion, marketingEventId, headers);
    }

    # Updates a marketing event
    #
    # + marketingEventId - The ID of the marketing event
    # + payload - The payload to update the marketing event
    # + return - Update a marketing event. Can modify only timestamps, remote_id, and budget/currency.
    remote isolated function updatesAMarketingEvent(string marketingEventId, MarketingEventsmarketingEventIdJsonBody payload, map<string|string[]> headers = {}) returns UpdateMarketingEvent|error {
        return check self.generatedClient->updatesAMarketingEvent(self.apiVersion, marketingEventId, payload, headers);
    }

    # Deletes a marketing event
    #
    # + marketingEventId - The ID of the marketing event
    # + payload - The payload for the delete request
    # + return - Delete a marketing event
    remote isolated function deletesAMarketingEvent(string marketingEventId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->deletesAMarketingEvent(self.apiVersion, marketingEventId, payload, headers);
    }

    # Retrieves a count of all marketing events
    #
    # + return - Retrieve a count of all marketing events
    remote isolated function retrievesACountOfAllMarketingEvents(map<string|string[]> headers = {}) returns ObjectCount|error {
        return check self.generatedClient->retrievesACountOfAllMarketingEvents(self.apiVersion, headers);
    }

    # Retrieve a list of metafields from the resource's endpoint
    #
    # + ownerId - The ID of the resource that the metafield will be attached to
    # + ownerResource - The name of the resource that the metafield will be attached to
    # + created_at_max - Show metafields created before date (format: 2014-04-25T16:15:47-04:00) 
    # + created_at_min - Show metafields created after date (format: 2014-04-25T16:15:47-04:00) 
    # + fields - comma-separated list of fields to include in the response 
    # + 'key - Show metafields with given key 
    # + 'limit - Amount of results(default: 50)(maximum: 250) 
    # + namespace - Show metafields with given namespace 
    # + since_id - Restrict results to after the specified ID 
    # + 'type - The type of data that the metafield stores in the `value` field. Refer to the list of supported types.
    # + updated_at_max - Show metafields last updated before date (format: 2014-04-25T16:15:47-04:00) 
    # + updated_at_min - Show metafields last updated after date (format: 2014-04-25T16:15:47-04:00) 
    # + return - Retrieve a list of metafields from the resource's endpoint 
    remote isolated function retrieveAListOfMetafieldsFromTheResourceSEndpoint(string ownerId, string ownerResource, map<string|string[]> headers = {}, *RetrieveAListOfMetafieldsFromTheResourceSEndpointQueries queries) returns MetafieldList|error {
        return check self.generatedClient->retrieveAListOfMetafieldsFromTheResourceSEndpoint(self.apiVersion, ownerId, ownerResource, headers, queries);
    }

    # Create a metafield
    #
    # + ownerId - The ID of the resource that the metafield will be attached to
    # + ownerResource - The name of the resource that the metafield will be attached to
    # + payload - The payload to create a metafield
    # + return - Create a metafield
    remote isolated function createAMetafield(string ownerId, string ownerResource, OwnerResourceMetafieldsJsonBody payload, map<string|string[]> headers = {}) returns error? {
        return self.generatedClient->createAMetafield(self.apiVersion, ownerId, ownerResource, payload, headers);
    }

    # [Shop] Retrieve a list of metafields from the resource's endpoint
    #
    # + created_at_max - Show metafields created before date (format: 2014-04-25T16:15:47-04:00) 
    # + created_at_min - Show metafields created after date (format: 2014-04-25T16:15:47-04:00) 
    # + fields - comma-separated list of fields to include in the response 
    # + 'key - Show metafields with given key 
    # + 'limit - Amount of results(default: 50)(maximum: 250) 
    # + namespace - Show metafields with given namespace 
    # + since_id - Restrict results to after the specified ID 
    # + 'type - The type of data that the metafield stores in the `value` field. Refer to the list of supported types.
    # + updated_at_max - Show metafields last updated before date (format: 2014-04-25T16:15:47-04:00) 
    # + updated_at_min - Show metafields last updated after date (format: 2014-04-25T16:15:47-04:00) 
    # + metafieldOwner_id - Filter by the resource ID on which the metafield is attached to.
    # + metafieldOwner_resource - Filter by the resource name on which the metafield is attached to.
    #
    # + return - Returns a list of metadata fields
    remote isolated function shopRetrieveAListOfMetafieldsFromTheResourcesEndpoint(map<string|string[]> headers = {}, *ShopRetrieveAListOfMetafieldsFromTheResourceSEndpointQueries queries) returns error? {
        return self.generatedClient->shopRetrieveAListOfMetafieldsFromTheResourceSEndpoint(self.apiVersion, headers, queries);
    }

    # [Shop] Create a metafield
    #
    # + payload - The payload to create a meta field
    # + return - Returns `()` if successful, otherwise an error
    remote isolated function shopCreateAMetafield(ApiVersionMetafieldsJsonBody payload, map<string|string[]> headers = {}) returns error? {
        return self.generatedClient->shopCreateAMetafield(self.apiVersion, payload, headers);
    }

    # Retrieve a specific metafield
    #
    # + ownerId - The ID of the resource that the metafield will be attached to
    # + ownerResource - The name of the resource that the metafield will be attached to
    # + metafieldId - The ID of the metafield
    # + fields - comma-separated list of fields to include in the response
    # + return - Retrieve a specific metafield
    remote isolated function retrieveASpecificMetafield(string ownerId, string ownerResource, string metafieldId, map<string|string[]> headers = {}, *RetrieveASpecificMetafieldQueries queries) returns MetafieldResponse|error {
        return self.generatedClient->retrieveASpecificMetafield(self.apiVersion, ownerId, ownerResource, metafieldId, headers, queries);
    }

    # Updates a metafield
    #
    # + ownerId - The ID of the resource that the metafield will be attached to
    # + ownerResource - The name of the resource that the metafield will be attached to
    # + metafieldId - The ID of the metafield
    # + payload - The payload to update a metafield
    # + return - Update a metafield
    remote isolated function updatesAMetafield(string ownerId, string ownerResource, string metafieldId, string payload, map<string|string[]> headers = {}) returns MetafieldResponse|error {
        return self.generatedClient->updatesAMetafield(self.apiVersion, ownerId, ownerResource, metafieldId, payload, headers);
    }

    # Deletes a metafield by its ID
    #
    # + ownerId - The ID of the resource that the metafield will be attached to
    # + ownerResource - The name of the resource that the metafield will be attached to
    # + metafieldId - The ID of the metafield
    # + payload - The payload to delete a metafield
    # + return - Deletes a metafield by its ID
    remote isolated function deletesAMetafieldByItsId(string ownerId, string ownerResource, string metafieldId, string payload, map<string|string[]> headers = {}) returns error? {
        return self.generatedClient->deletesAMetafieldByItsId(self.apiVersion, ownerId, ownerResource, metafieldId, payload, headers);
    }

    # [Shop] Retrieve a specific metafield
    #
    # + metafieldId - The ID of the metafield
    # + fields - comma-separated list of fields to include in the response
    # + return - Retrieve a specific metafield
    remote isolated function shopRetrieveASpecificMetafield(string metafieldId, map<string|string[]> headers = {}, *ShopRetrieveASpecificMetafieldQueries queries) returns MetafieldResponse|error {
        return self.generatedClient->shopRetrieveASpecificMetafield(self.apiVersion, metafieldId, headers, queries);
    }

    # [Shop] Updates a metafield
    #
    # + metafieldId - The ID of the metafield
    # + payload - The payload to update a metafield
    # + return - Update a metafield
    remote isolated function shopUpdatesAMetafield(string metafieldId, string payload, map<string|string[]> headers = {}) returns Metafield|error {
        return self.generatedClient->shopUpdatesAMetafield(self.apiVersion, metafieldId, payload, headers);
    }

    # [Shop] Deletes a metafield by its ID.
    #
    # + metafieldId - The ID of the metafield
    # + payload - The payload to delete a metafield
    # + return - Deletes a metafield by its ID
    remote isolated function shopDeletesAMetafieldByItsId(string metafieldId, string payload, map<string|string[]> headers = {}) returns error? {
        return self.generatedClient->shopDeletesAMetafieldByItsId(self.apiVersion, metafieldId, payload, headers);
    }

    # Retrieve a count of a resource's metafields.
    #
    # + ownerId - The ID of the resource that the metafield will be attached to
    # + ownerResource - The name of the resource that the metafield will be attached to
    # + return - Retrieve a count of a resource's metafields
    remote isolated function retrieveACountOfAResourceSMetafields(string ownerId, string ownerResource, map<string|string[]> headers = {}) returns ObjectCount|error {
        return self.generatedClient->retrieveACountOfAResourceSMetafields(self.apiVersion, ownerId, ownerResource, headers);
    }

    # [Shop] Retrieve a count of a resource's metafields.
    #
    # + return - Retrieve a count of a resource's metafields
    remote isolated function shopRetrieveACountOfAResourceSMetafields(map<string|string[]> headers = {}) returns ObjectCount|error {
        return self.generatedClient->shopRetrieveACountOfAResourceSMetafields(self.apiVersion, headers);
    }

    # List all of the mobile platform applications associated with the app
    #
    # + return - List all of the mobile platform applications associated with the app / List all of the mobile platform applications associated with the app 
    remote isolated function listAllOfTheMobilePlatformApplicationsAssociatedWithTheApp(map<string|string[]> headers = {}) returns MobilePlatformApplications|error {
        return check self.generatedClient->listAllOfTheMobilePlatformApplicationsAssociatedWithTheApp(self.apiVersion, headers);
    }

    # Create a mobile platform application
    #
    # + return - Create a mobile platform application for Android / Create mobile platform application for iOS / Create a mobile platform application for Android / Create mobile platform application for iOS 
    remote isolated function createAMobilePlatformApplication(ApiVersionMobilePlatformApplicationsJsonBody payload, map<string|string[]> headers = {}) returns MobilePlatformApplication|error {
        return check self.generatedClient->createAMobilePlatformApplication(self.apiVersion, payload, headers);
    }

    # Get a mobile platform application
    #
    # + mobilePlatformApplicationId - The ID of the mobile platform application
    # + return - Get a mobile platform application / Get a mobile platform application 
    remote isolated function getAMobilePlatformApplication(string mobilePlatformApplicationId, map<string|string[]> headers = {}) returns MobilePlatformApplicationResponse|error {
        return check self.generatedClient->getAMobilePlatformApplication(self.apiVersion, mobilePlatformApplicationId, headers);
    }

    # Update a mobile platform application
    #
    # + return - Update a mobile platform application 
    remote isolated function updateAMobilePlatformApplication(string mobilePlatformApplicationId, MobilePlatformApplicationsmobilePlatformApplicationIdJsonBody payload, map<string|string[]> headers = {}) returns MobilePlatformApplicationResponse|error {
        return check self.generatedClient->updateAMobilePlatformApplication(self.apiVersion, mobilePlatformApplicationId, payload, headers);
    }

    # Delete a mobile platform application
    #
    # + mobilePlatformApplicationId - The ID of the mobile platform application
    # + payload - The payload to delete a mobile platform application
    # + return - Delete a mobile platform application
    remote isolated function deleteAMobilePlatformApplication(string mobilePlatformApplicationId, string payload, map<string|string[]> headers = {}) returns error? {
        return self.generatedClient->deleteAMobilePlatformApplication(self.apiVersion, mobilePlatformApplicationId, payload, headers);
    }

    # Retrieves a list of all articles from a blog
    #
    # + 'limit - The maximum number of results to retrieve.(default: 50)(maximum: 250) 
    # + since_id - Restrict results to after the specified ID. 
    # + created_at_min - Show articles created after date (format: 2014-04-25T16:15:47-04:00). 
    # + created_at_max - Show articles created before date (format: 2014-04-25T16:15:47-04:00). 
    # + updated_at_min - Show articles last updated after date (format: 2014-04-25T16:15:47-04:00). 
    # + updated_at_max - Show articles last updated before date (format: 2014-04-25T16:15:47-04:00). 
    # + published_at_min - Show articles published after date (format: 2014-04-25T16:15:47-04:00). 
    # + published_at_max - Show articles published before date (format: 2014-04-25T16:15:47-04:00). 
    # + published_status - Retrieve results based on their published status.(default: any) 
    # + 'handle - Retrieve an article with a specific handle. 
    # + tag - Filter articles with a specific tag. 
    # + author - Filter articles by article author. 
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - Retrieve all articles from a blog after a specified ID / Retrieve a list of articles from a blog / Retrieve all articles from a blog after a specified ID / Retrieve a list of articles from a blog 
    remote isolated function retrievesAListOfAllArticlesFromABlog(string blogId, map<string|string[]> headers = {}, *RetrievesAListOfAllArticlesFromABlogQueries queries) returns Articles|error {
        return check self.generatedClient->retrievesAListOfAllArticlesFromABlog(self.apiVersion, blogId, headers, queries);
    }

    # Creates an article for a blog
    #
    # + 'limit - The amount of results to return. (default: 50) (maximum: 250)
    # + offset - The number of marketing events to skip
    # + return - Create an article with a metafield / Create an article with an image, which will be downloaded by Shopify / Create an article with HTML markup for a blog / Create an article with a base64 encoded image / Create an unpublished article for a blog
    remote isolated function createsAnArticleForABlog(string blogId, BlogIdArticlesJsonBody payload, map<string|string[]> headers = {}) returns Article|error {
        return check self.generatedClient->createsAnArticleForABlog(self.apiVersion, blogId, payload, headers);
    }

    # Retrieves a list of all article authors
    #
    # + 'limit - The amount of results to return. (default: 50) (maximum: 250)
    # + offset - The number of marketing events to skip
    # + return - Retrieve a list of all article authors
    remote isolated function retrievesAListOfAllArticleAuthors(map<string|string[]> headers = {}) returns ArticleAuthors|error {
        return check self.generatedClient->retrievesAListOfAllArticleAuthors(self.apiVersion, headers);
    }

    # Retrieves a list of all article tags
    #
    # + 'limit - The maximum number of tags to retrieve.
    # + popular - A flag for ordering retrieved tags.
    # + return - Retrieve a list of all tags from a specific blog / Retrieve a list of the most popular tags / Retrieve a list of all tags for all articles
    remote isolated function retrievesAListOfAllArticleTags(map<string|string[]> headers = {}, *RetrievesAListOfAllArticleTagsQueries queries) returns TagsList|error {
        return check self.generatedClient->retrievesAListOfAllArticleTags(self.apiVersion, headers, queries);
    }

    # Receive a single Article
    #
    # + fields - Show only certain fields, specified by a comma-separated list of field names.
    # + return - Retrieve a single article
    remote isolated function receiveASingleArticle(string blogId, string articleId, map<string|string[]> headers = {}, *ReceiveASingleArticleQueries queries) returns SingleArticle|error {
        return check self.generatedClient->receiveASingleArticle(self.apiVersion, blogId, articleId, headers, queries);
    }

    # Updates an article
    #
    # + return - Updates an article
    remote isolated function updatesAnArticle(string blogId, string articleId, ArticlesarticleIdJsonBody payload, map<string|string[]> headers = {}) returns SingleArticle|error {
        return check self.generatedClient->updatesAnArticle(self.apiVersion, blogId, articleId, payload);
    }

    # Deletes an article
    #
    # + return - Delete an existing article from a blog
    remote isolated function deletesAnArticle(string blogId, string articleId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->deletesAnArticle(self.apiVersion, blogId, articleId, payload, headers);
    }

    # Retrieves a count of all articles from a blog
    #
    # + created_at_min - Count articles created after date.
    # + created_at_max - Count articles created before date.
    # + updated_at_min - Count articles last updated after date.
    # + updated_at_max - Count articles last updated before date.
    # + published_at_min - Count articles published after date.
    # + published_at_max - Count articles published before date.
    # + published_status - Count articles with a given published status.
    # + return - Count all a blog's articles
    remote isolated function retrievesACountOfAllArticlesFromABlog(string apiVersion, string blogId, map<string|string[]> headers = {}, *RetrievesACountOfAllArticlesFromABlogQueries queries) returns ArticlesCount|error {
        return check self.generatedClient->retrievesACountOfAllArticlesFromABlog(self.apiVersion, blogId, headers, queries);
    }

    # Retrieves a list of all article tags from a specific blog
    #
    # + 'limit - The maximum number of tags to retrieve.
    # + popular - A flag for ordering retrieved tags. If present in the request, then the results will be ordered by popularity, starting with the most popular tag.
    # + return - Retrieves a list of all article tags from a specific blog
    remote isolated function retrievesAListOfAllArticleTagsFromASpecificBlog(string blogId, map<string|string[]> headers = {}, *RetrievesAListOfAllArticleTagsFromASpecificBlogQueries queries) returns Articles|error {
        return check self.generatedClient->retrievesAListOfAllArticleTagsFromASpecificBlog(self.apiVersion, blogId, headers, queries);
    }

    # Retrieves a list of assets for a theme
    #
    # + fields - Show only certain fields, specified by a comma-separated list of field names
    # + return - Retrieve a list of all assets for a theme / Retrieve a theme image / Retrieve a Liquid template
    remote isolated function retrievesAListOfAssetsForATheme(string themeId, map<string|string[]> headers = {}, *RetrievesAListOfAssetsForAThemeQueries queries) returns AssetsList|error {
        return check self.generatedClient->retrievesAListOfAssetsForATheme(self.apiVersion, themeId, headers, queries);
    }

    # Creates or updates an asset for a theme
    #
    # + return - Create an image asset by providing a base64-encoded attachment / Create an image asset by providing a source URL from which to upload the image / Change an existing Liquid template's value
    remote isolated function createsOrUpdatesAnAssetForATheme(string themeId, ThemeIdAssetsJsonBody payload, map<string|string[]> headers = {}) returns ImageAsset|error {
        return check self.generatedClient->createsOrUpdatesAnAssetForATheme(self.apiVersion, themeId, payload, headers);
    }

    # Deletes an asset from a theme
    #
    # + return - Delete an image from a theme
    remote isolated function deletesAnAssetFromATheme(string themeId, string payload, map<string|string[]> headers = {}) returns DeleteAssetResponse|error {
        return check self.generatedClient->deletesAnAssetFromATheme(self.apiVersion, themeId, payload, headers);
    }

    # Retrieve a list of all blogs
    #
    # + 'limit - The maximum number of results to retrieve.(default: 50)(maximum: 250)
    # + since_id - Restrict results to after the specified ID
    # + 'handle - Filter by blog handle
    # + fields - comma-separated list of fields to include in the response
    # + return - Get all blogs for a shop after a specified ID / Get all blogs for a shop
    remote isolated function retrieveAListOfAllBlogs(map<string|string[]> headers = {}, *RetrieveAListOfAllBlogsQueries queries) returns Blogs|error {
        return check self.generatedClient->retrieveAListOfAllBlogs(self.apiVersion, headers, queries);
    }

    # Create a new Blog
    #
    # + 'limit - The amount of results to return.(default: 50)(maximum: 250)
    # + offset - The number of marketing events to skip
    # + return - Create a new empty blog / Create a new empty blog with a metafield / Create a new empty blog / Create a new empty blog with a metafield
    remote isolated function createANewBlog(ApiVersionBlogsJsonBody payload, map<string|string[]> headers = {}) returns CreateBlogResponse|error {
        return check self.generatedClient->createANewBlog(self.apiVersion, payload, headers);
    }

    # Receive a single Blog
    #
    # + fields - comma-separated list of fields to include in the response 
    # + return - Get a single blog / Get a single blog 
    remote isolated function receiveASingleBlog(string blogId, map<string|string[]> headers = {}, *ReceiveASingleBlogQueries queries) returns SingleBlog|error {
        return check self.generatedClient->receiveASingleBlog(self.apiVersion, blogId, headers, queries);
    }

    # Modify an existing Blog
    #
    # + 'limit - The amount of results to return.(default: 50)(maximum: 250)
    # + offset - The number of marketing events to skip
    # + return - Add a metafield to an existing blog / Update an existing blog title and handle and also activate comments / Update an existing blog title / Add a metafield to an existing blog / Update an existing blog title and handle and also activate comments / Update an existing blog title 
    remote isolated function modifyAnExistingBlog(string blogId, BlogsblogIdJsonBody payload, map<string|string[]> headers = {}) returns UpdateBlogResponse|error {
        return check self.generatedClient->modifyAnExistingBlog(self.apiVersion, blogId, payload, headers);
    }

    # Remove an existing Blog
    #
    # + return - Remove an existing blog from a shop / Remove an existing blog from a shop 
    remote isolated function removeAnExistingBlog(string blogId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->removeAnExistingBlog(self.apiVersion, blogId, payload, headers);
    }

    # Receive a count of all Blogs
    #
    # + return - Get all blogs for a shop / Get all blogs for a shop 
    remote isolated function receiveACountOfAllBlogs(map<string|string[]> headers = {}) returns BlogsCount|error {
        return check self.generatedClient->receiveACountOfAllBlogs(self.apiVersion, headers);
    }

    # Retrieves a list of comments
    #
    # + 'limit - The maximum number of results to retrieve.(default: 50)(maximum: 250) 
    # + since_id - Restrict results to after the specified ID. 
    # + created_at_min - Show comments created after date (format: 2014-04-25T16:15:47-04:00). 
    # + created_at_max - Show comments created before date (format: 2014-04-25T16:15:47-04:00). 
    # + updated_at_min - Show comments last updated after date (format: 2014-04-25T16:15:47-04:00). 
    # + updated_at_max - Show comments last updated before date (format: 2014-04-25T16:15:47-04:00). 
    # + published_at_min - Show comments published after date (format: 2014-04-25T16:15:47-04:00). 
    # + published_at_max - Show comments published before date (format: 2014-04-25T16:15:47-04:00). 
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + published_status - Filter results by their published status.(default: any) 
    # + status - Filter results by their status. 
    # + return - Retrieve all the comments for a certain article of a blog / Retrieve all the comments for this shop / Retrieve all comments for this shop after the specified ID / Retrieve all the comments for all the articles of a blog / Retrieve all the comments for a certain article of a blog / Retrieve all the comments for this shop / Retrieve all comments for this shop after the specified ID / Retrieve all the comments for all the articles of a blog 
    remote isolated function retrievesAListOfComments(map<string|string[]> headers = {}, *RetrievesAListOfCommentsQueries queries) returns ArticleComments|error {
        return check self.generatedClient->retrievesAListOfComments(self.apiVersion, headers, queries);
    }

    # Creates a comment for an article
    #
    # + return - Create a comment for an article of a blog using basic Textile markup / Create a comment for an article of a blog using basic Textile markup 
    remote isolated function createsACommentForAnArticle(ApiVersionCommentsJsonBody payload, map<string|string[]> headers = {}) returns ArticleComment|error {
        return check self.generatedClient->createsACommentForAnArticle(self.apiVersion, payload, headers);
    }

    # Approves a comment
    #
    # + commentId - The ID of the comment to approve
    # + payload - The comment payload
    # + return - Approve a comment and publish it to the blog
    remote isolated function approvesAComment(string commentId, record {} payload, map<string|string[]> headers = {}) returns ApproveCommentResponse|error {
        return check self.generatedClient->approvesAComment(self.apiVersion, commentId, payload, headers);
    }

    # Marks a comment as not spam
    #
    # + commentId - The ID of the comment to mark as not spam
    # + payload - The comment payload
    # + return - Mark a comment as not spam, restoring it to an unapproved or published state
    remote isolated function marksACommentAsNotSpam(string commentId, record {} payload, map<string|string[]> headers = {}) returns MarkCommentResponse|error {
        return check self.generatedClient->marksACommentAsNotSpam(self.apiVersion, commentId, payload, headers);
    }

    # Removes a comment
    #
    # + commentId - The ID of the comment to remove
    # + payload - The comment payload
    # + return - Remove a comment
    remote isolated function removesAComment(string commentId, record {} payload, map<string|string[]> headers = {}) returns RemoveCommentResponse|error {
        return check self.generatedClient->removesAComment(self.apiVersion, commentId, payload, headers);
    }

    # Restores a previously removed comment
    #
    # + commentId - The ID of the comment to restore
    # + payload - The comment payload
    # + return - Restore a removed comment
    remote isolated function restoresAPreviouslyRemovedComment(string commentId, record {} payload, map<string|string[]> headers = {}) returns RestoreRemoveComment|error {
        return check self.generatedClient->restoresAPreviouslyRemovedComment(self.apiVersion, commentId, payload, headers);
    }

    # Marks a comment as spam
    #
    # + commentId - The ID of the comment to mark as spam
    # + payload - The comment payload
    # + return - Mark a comment as spam
    remote isolated function marksACommentAsSpam(string commentId, record {} payload, map<string|string[]> headers = {}) returns SpamCommentResponse|error {
        return check self.generatedClient->marksACommentAsSpam(self.apiVersion, commentId, payload, headers);
    }

    # Retrieves a single comment by its ID
    #
    # + commentId - The ID of the comment to retrieve
    # + fields - The fields to include in the response (optional)
    # + return - Retrieve a single comment
    remote isolated function retrievesASingleCommentByItsId(string commentId, map<string|string[]> headers = {}, *RetrievesASingleCommentByItsIdQueries queries) returns SingleCommentResponse|error {
        return check self.generatedClient->retrievesASingleCommentByItsId(self.apiVersion, commentId, headers, queries);
    }

    # Updates a comment of an article
    #
    # + commentId - The ID of the comment to update
    # + payload - The updated comment content
    # + return - Update the body of an existing comment
    remote isolated function updatesACommentOfAnArticle(string commentId, CommentscommentIdJsonBody payload, map<string|string[]> headers = {}) returns UpdateCommentResponse|error {
        return check self.generatedClient->updatesACommentOfAnArticle(self.apiVersion, commentId, payload, headers);
    }

    # Retrieves a count of comments
    #
    # + created_at_min - Count comments created after date (format: 2014-04-25T16:15:47-04:00). 
    # + created_at_max - Count comments created before date (format: 2014-04-25T16:15:47-04:00). 
    # + updated_at_min - Count comments last updated after date (format: 2014-04-25T16:15:47-04:00). 
    # + updated_at_max - Count comments last updated before date (format: 2014-04-25T16:15:47-04:00). 
    # + published_at_min - Count comments published after date (format: 2014-04-25T16:15:47-04:00). 
    # + published_at_max - Count comments published before date (format: 2014-04-25T16:15:47-04:00). 
    # + published_status - Retrieve a count of comments with a given published status (default: any) 
    # + status - Retrieve a count of comments with a given status 
    # + return - Count all comments for a certain article of a blog / Count all the comments for all the articles of a blog / Count all the comments for this shop
    remote isolated function retrievesACountOfComments(map<string|string[]> headers = {}, *RetrievesACountOfCommentsQueries queries) returns BlogsCount|error {
        return check self.generatedClient->retrievesACountOfComments(self.apiVersion, headers, queries);
    }

    # Retrieves a list of pages
    #
    # + 'limit - The maximum number of results to show (default: 50, maximum: 250) 
    # + since_id - Restrict results to after the specified ID 
    # + title - Retrieve pages with a given title 
    # + 'handle - Retrieve a page with a given handle 
    # + created_at_min - Show pages created after date (format: 2008-12-31) 
    # + created_at_max - Show pages created before date (format: 2008-12-31) 
    # + updated_at_min - Show pages last updated after date (format: 2008-12-31) 
    # + updated_at_max - Show pages last updated before date (format: 2008-12-31) 
    # + published_at_min - Show pages published after date (format: 2014-04-25T16:15:47-04:00) 
    # + published_at_max - Show pages published before date (format: 2014-04-25T16:15:47-04:00) 
    # + fields - Show only certain fields, specified by a comma-separated list of field names 
    # + published_status - Restrict results to pages with a given published status (default: any) 
    # + return - Retrieve a list of all pages after the specified ID / Get all pages for a shop
    remote isolated function retrievesAListOfPages(map<string|string[]> headers = {}, *RetrievesAListOfPagesQueries queries) returns PagesListResponse|error {
        return check self.generatedClient->retrievesAListOfPages(self.apiVersion, headers, queries);
    }

    # Create a new Page
    #
    # + payload - The page data (JSON) to create
    # + return - Create a page with a metafield / Create a page with HTML markup / Create an unpublished page
    remote isolated function createANewPage(ApiVersionPagesJsonBody payload, map<string|string[]> headers = {}) returns PageResponse|error {
        return check self.generatedClient->createANewPage(self.apiVersion, payload, headers);
    }

    # Retrieves a single page by its ID
    #
    # + 'fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - Retrieve a single page / Retrieve a single page
    remote isolated function retrievesASinglePageByItsId(string pageId, map<string|string[]> headers = {}, *RetrievesASinglePageByItsIdQueries queries) returns SinglePageResponse|error {
        return check self.generatedClient->retrievesASinglePageByItsId(self.apiVersion, pageId, headers, queries);
    }

    # Updates a page
    #
    # + pageId - The ID of the page to update
    # + payload - The updated page data
    # + return - Update an existing page completely / Add a metafield to a page / Show a hidden page / Update the body HTML of an existing page / Hide a published page
    remote isolated function updatesAPage(string pageId, PagespageIdJsonBody payload, map<string|string[]> headers = {}) returns UpdatePageResponse|error {
        return check self.generatedClient->updatesAPage(self.apiVersion, pageId, payload, headers);
    }

    # Deletes a page
    #
    # + pageId - The ID of the page to delete
    # + payload - The payload to delete a page
    # + return - Delete a page / Delete a page
    remote isolated function deletesAPage(string pageId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->deletesAPage(self.apiVersion, pageId, payload, headers);
    }

    # Retrieves a page count
    #
    # + title - Count pages with a given title
    # + created_at_min - Count pages created after date
    # + created_at_max - Count pages created before date
    # + updated_at_min - Count pages last updated after date
    # + updated_at_max - Count pages last updated before date
    # + published_at_min - Count pages published after date
    # + published_at_max - Count pages published before date
    # + published_status - Count pages with a given published status
    # + return - Retrieve a count of all pages / Retrieve a count of all pages
    remote isolated function retrievesAPageCount(map<string|string[]> headers = {}, *RetrievesAPageCountQueries queries) returns ArticlesCount|error {
        return check self.generatedClient->retrievesAPageCount(self.apiVersion, headers, queries);
    }

    # Retrieves a list of URL redirects
    #
    # + 'limit - The maximum number of results to show.(default: 50)(maximum: 250) 
    # + since_id - Restrict results to after the specified ID. 
    # + path - Show redirects with a given path. 
    # + target - Show redirects with a given target. 
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - Retrieve a list of URL redirects after a specified ID / Retrieve a list of all redirects
    remote isolated function retrievesAListOfUrlRedirects(map<string|string[]> headers = {}, *RetrievesAListOfUrlRedirectsQueries queries) returns UrlList|error {
        return check self.generatedClient->retrievesAListOfUrlRedirects(self.apiVersion, headers, queries);
    }

    # Creates a redirect
    #
    # + return - Create a redirect using a full URL for the path, which will be saved as an absolute path without a domain / Create a redirect
    remote isolated function createsARedirect(ApiVersionRedirectsJsonBody payload, map<string|string[]> headers = {}) returns RedirectResponse|error {
        return check self.generatedClient->createsARedirect(self.apiVersion, payload, headers);
    }

    # Retrieves a single redirect
    #
    # + redirectId - The ID of the redirect to retrieve
    # + fields - The fields to include in the response (optional)
    # + return - Retrieve a single redirect by its ID
    remote isolated function retrievesASingleRedirect(string redirectId, map<string|string[]> headers = {}, *RetrievesASingleRedirectQueries queries) returns SingleRedirect|error {
        return check self.generatedClient->retrievesASingleRedirect(self.apiVersion, redirectId, headers, queries);
    }

    # Updates an existing redirect
    #
    # + redirectId - The ID of the redirect to update
    # + payload - The updated redirect data
    # + return - Update the path URI of a redirect / Update both the path and target URIs of a redirect
    remote isolated function updatesAnExistingRedirect(string redirectId, RedirectsredirectIdJsonBody payload, map<string|string[]> headers = {}) returns UpdateRedirect|error {
        return check self.generatedClient->updatesAnExistingRedirect(self.apiVersion, redirectId, payload, headers);
    }

    # Deletes a redirect
    #
    # + redirectId - The ID of the redirect to delete
    # + payload - The payload to delete a redirect
    # + return - Delete an existing redirect
    remote isolated function deletesARedirect(string redirectId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->deletesARedirect(self.apiVersion, redirectId, payload, headers);
    }

    # Retrieves a count of URL redirects
    #
    # + path - Count redirects with a given path
    # + target - Count redirects with a given target
    # + return - Count all redirects
    remote isolated function retrievesACountOfUrlRedirects(map<string|string[]> headers = {}, *RetrievesACountOfUrlRedirectsQueries queries) returns EventsCount|error {
        return check self.generatedClient->retrievesACountOfUrlRedirects(self.apiVersion, headers, queries);
    }

    # Retrieves a list of all script tags
    #
    # + 'limit - The number of results to return.(default: 50)(maximum: 250) 
    # + since_id - Restrict results to after the specified ID. 
    # + created_at_min - Show script tags created after this date. (format: 2014-04-25T16:15:47-04:00) 
    # + created_at_max - Show script tags created before this date. (format: 2014-04-25T16:15:47-04:00) 
    # + updated_at_min - Show script tags last updated after this date. (format: 2014-04-25T16:15:47-04:00) 
    # + updated_at_max - Show script tags last updated before this date. (format: 2014-04-25T16:15:47-04:00) 
    # + src - Show script tags with this URL. 
    # + fields - A comma-separated list of fields to include in the response. 
    # + return - Retrieve a list of all script tags after the specified ID / Retrieve a list of all script tags / Retrieve a list of all script tags with a particular URL / Retrieve a list of all script tags after the specified ID / Retrieve a list of all script tags / Retrieve a list of all script tags with a particular URL 
    remote isolated function retrievesAListOfAllScriptTags(map<string|string[]> headers = {}, *RetrievesAListOfAllScriptTagsQueries queries) returns ScriptTagsList|error {
        return check self.generatedClient->retrievesAListOfAllScriptTags(self.apiVersion, headers, queries);
    }

    # Creates a new script tag
    #
    # + payload - The script tag data to create
    # + return - Create a new script tag / Create a new script tag 
    remote isolated function createsANewScriptTag(ApiVersionScriptTagsJsonBody payload, map<string|string[]> headers = {}) returns ScriptTagResponse|error {
        return check self.generatedClient->createsANewScriptTag(self.apiVersion, payload, headers);
    }

    # Retrieves a single script tag
    #
    # + scriptTagId - The ID of the script tag to retrieve
    # + fields - A comma-separated list of fields to include in the response. 
    # + return - Retrieve a single script tag by its ID / Retrieve a single script tag by its ID 
    remote isolated function retrievesASingleScriptTag(string scriptTagId, map<string|string[]> headers = {}, *RetrievesASingleScriptTagQueries queries) returns SingleScriptTag|error {
        return check self.generatedClient->retrievesASingleScriptTag(self.apiVersion, scriptTagId, headers, queries);
    }

    # Updates a script tag
    #
    # + scriptTagId - The ID of the script tag to update
    # + payload - The updated script tag data
    # + return - Update a script tag's URL / Update a script tag's URL 
    remote isolated function updatesAScriptTag(string scriptTagId, ScriptTagsscriptTagIdJsonBody payload, map<string|string[]> headers = {}) returns UpdateScriptTagResponse|error {
        return check self.generatedClient->updatesAScriptTag(self.apiVersion, scriptTagId, payload, headers);
    }

    # Deletes a script tag
    #
    # + scriptTagId - The ID of the script tag to delete
    # + payload - The payload to delete a script tag
    # + return - Delete an existing script tag / Delete an existing script tag 
    remote isolated function deletesAScriptTag(string scriptTagId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->deletesAScriptTag(self.apiVersion, scriptTagId, payload, headers);
    }

    # Retrieves a count of all script tags
    #
    # + src - Retrieve a count of all script tags for your shop
    # + return - Retrieve a count of all script tags for your shop
    remote isolated function retrievesACountOfAllScriptTags(map<string|string[]> headers = {}, *RetrievesACountOfAllScriptTagsQueries queries) returns BlogsCount|error {
        return check self.generatedClient->retrievesACountOfAllScriptTags(self.apiVersion, headers, queries);
    }

    # Retrieves a list of themes
    #
    # + fields - Show only certain fields, specified by a comma-separated list of field names.
    # + return - Retrieve a list of themes
    remote isolated function retrievesAListOfThemes(map<string|string[]> headers = {}, *RetrievesAListOfThemesQueries queries) returns ThemesList|error {
        return check self.generatedClient->retrievesAListOfThemes(self.apiVersion, headers, queries);
    }

    # Creates a theme
    #
    # + return - Create a theme that has a custom name and is published
    remote isolated function createsATheme(ApiVersionThemesJsonBody payload, map<string|string[]> headers = {}) returns CreateThemeResponse|error {
        return check self.generatedClient->createsATheme(self.apiVersion, payload, headers);
    }

    # Retrieves a single theme
    #
    # + themeId - The ID of the theme to retrieve
    # + fields - Show only certain fields, specified by a comma-separated list of field names.
    # + return - Retrieve a single theme
    remote isolated function retrievesASingleTheme(string themeId, map<string|string[]> headers = {}, *RetrievesASingleThemeQueries queries) returns SingleTheme|error {
        return check self.generatedClient->retrievesASingleTheme(self.apiVersion, themeId, headers, queries);
    }

    # Modify an existing Theme
    #
    # + themeId - The ID of the theme to modify
    # + payload - The updated theme data
    # + return - Publish an unpublished theme / Update a theme's name
    remote isolated function modifyAnExistingTheme(string themeId, ThemesthemeIdJsonBody payload, map<string|string[]> headers = {}) returns PublishThemeResponse|error {
        return check self.generatedClient->modifyAnExistingTheme(self.apiVersion, themeId, payload, headers);
    }

    # Remove an existing Theme
    #
    # + themeId - The ID of the theme to remove
    # + payload - The payload to remove a theme
    # + return - Delete a theme
    remote isolated function removeAnExistingTheme(string themeId, string payload, map<string|string[]> headers = {}) returns DeleteThemeResponse|error {
        return check self.generatedClient->removeAnExistingTheme(self.apiVersion, themeId, payload, headers);
    }

    # Retrieves a count of checkouts
    #
    # + since_id - Restrict results to after the specified ID.
    # + created_at_min - Count checkouts created after the specified date. (format: 2014-04-25T16:15:47-04:00) 
    # + created_at_max - Count checkouts created before the specified date. (format: 2014-04-25T16:15:47-04:00) 
    # + updated_at_min - Count checkouts last updated after the specified date. (format: 2014-04-25T16:15:47-04:00) 
    # + updated_at_max - Count checkouts last updated before the specified date. (format: 2014-04-25T16:15:47-04:00) 
    # + status - Count checkouts with a given status.(default: open) 
    # + return - Count all checkouts / Count all checkouts 
    remote isolated function retrievesACountOfCheckouts(map<string|string[]> headers = {}, *RetrievesACountOfCheckoutsQueries queries) returns CheckoutCount|error {
        return check self.generatedClient->retrievesACountOfCheckouts(self.apiVersion, headers, queries);
    }

    # Retrieves a list of abandoned checkouts
    #
    # + 'limit - The maximum number of results to show.(default: 50)(maximum: 250) 
    # + since_id - Restrict results to after the specified ID. 
    # + created_at_min - Show checkouts created after the specified date. (format: 2014-04-25T16:15:47-04:00) 
    # + created_at_max - Show checkouts created before the specified date. (format: 2014-04-25T16:15:47-04:00) 
    # + updated_at_min - Show checkouts last updated after the specified date. (format: 2014-04-25T16:15:47-04:00) 
    # + updated_at_max - Show checkouts last updated before the specified date. (format: 2014-04-25T16:15:47-04:00) 
    # + status - Show only checkouts with a given status.(default: open) 
    # + return - Retrieve all abandoned checkouts
    remote isolated function retrievesAListOfAbandonedCheckouts(map<string|string[]> headers = {}, *RetrievesAListOfAbandonedCheckoutsQueries queries) returns AbandonedCheckouts|error {
        return check self.generatedClient->retrievesAListOfAbandonedCheckouts(self.apiVersion, headers, queries);
    }

    # Creates a checkout
    #
    # + payload - The checkout data to create
    # + return - Create a checkout with a product variant and quantity / Create a checkout without any line items / Create a checkout with a product variant and quantity / Create a checkout without any line items 
    remote isolated function createsACheckout(ApiVersionCheckoutsJsonBody payload, map<string|string[]> headers = {}) returns CreateCheckoutResponse|error {
        return check self.generatedClient->createsACheckout(self.apiVersion, payload, headers);
    }

    # Retrieves a list of draft orders
    #
    # + fields - A comma-separated list of fields to include in the response 
    # + 'limit - Amount of results(default: 50)(maximum: 250) 
    # + since_id - Restrict results to after the specified ID 
    # + updated_at_min - Show orders last updated after date (format: 2014-04-25T16:15:47-04:00) 
    # + updated_at_max - Show orders last updated before date (format: 2014-04-25T16:15:47-04:00) 
    # + ids - Filter by list of IDs 
    # + status - Filter by order status
    # + return - List all draft orders / List all draft orders 
    remote isolated function retrievesAListOfDraftOrders(map<string|string[]> headers = {}, *RetrievesAListOfDraftOrdersQueries queries) returns DraftOrders|error {
        return check self.generatedClient->retrievesAListOfDraftOrders(self.apiVersion, headers, queries);
    }

    # Create a new DraftOrder
    #
    # + payload - The draft order data to create
    # + return - Retrieve all marketing events / Retrieve all marketing events
    remote isolated function createANewDraftorder(ApiVersionDraftOrdersJsonBody payload, map<string|string[]> headers = {}) returns CreateDraftOrder|error {
        return check self.generatedClient->createANewDraftorder(self.apiVersion, payload, headers);
    }

    # Send an invoice
    #
    # + draftOrderId - The ID of the draft order
    # + payload - The invoice data to send
    # + return - Send a customized invoice / Send the default invoice
    remote isolated function sendAnInvoice(string draftOrderId, DraftOrderIdSendInvoiceJsonBody payload, map<string|string[]> headers = {}) returns InvoiceResponse|error {
        return check self.generatedClient->sendAnInvoice(self.apiVersion, draftOrderId, payload, headers);
    }

    # Receive a single DraftOrder
    #
    # + draftOrderId - The ID of the draft order to retrieve
    # + fields - A comma-separated list of fields to include in the response
    # + return - Get a representation of a single draft order
    remote isolated function receiveASingleDraftorder(string draftOrderId, map<string|string[]> headers = {}, *ReceiveASingleDraftorderQueries queries) returns SingleDraftOrder|error {
        return check self.generatedClient->receiveASingleDraftorder(self.apiVersion, draftOrderId, headers, queries);
    }

    # Modify an existing DraftOrder
    #
    # + draftOrderId - The ID of the draft order to modify
    # + payload - The updated draft order data
    # + return - Set a discount on a draft order / Add a note to a draft order
    remote isolated function modifyAnExistingDraftorder(string draftOrderId, DraftOrdersdraftOrderIdJsonBody payload, map<string|string[]> headers = {}) returns ModifyDraftOrder|error {
        return check self.generatedClient->modifyAnExistingDraftorder(self.apiVersion, draftOrderId, payload, headers);
    }

    # Remove an existing DraftOrder
    #
    # + 'limit - The amount of results to return.(default: 50)(maximum: 250)
    # + offset - The number of marketing events to skip
    # + return - Permanently delete a draft order / Permanently delete a draft order 
    remote isolated function removeAnExistingDraftorder(string draftOrderId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->removeAnExistingDraftorder(self.apiVersion, draftOrderId, payload, headers);
    }

    # Receive a count of all DraftOrders
    #
    # + since_id - Count draft orders after the specified ID. 
    # + status - Count draft orders that have a given status.(default: open)
    # + updated_at_max - Count draft orders last updated before the specified date (format: 2014-04-25T16:15:47-04:00).
    # + updated_at_min - Count draft orders last updated after the specified date (format: 2014-04-25T16:15:47-04:00).
    # + return - Count all draft orders / Count all draft orders
    remote isolated function receiveACountOfAllDraftorders(map<string|string[]> headers = {}, *ReceiveACountOfAllDraftordersQueries queries) returns StoreLocationCount|error {
        return check self.generatedClient->receiveACountOfAllDraftorders(self.apiVersion, headers, queries);
    }

    # Complete a draft order
    #
    # + 'limit - The amount of results to return.(default: 50)(maximum: 250)
    # + return - Complete a draft order, marking it as paid / Complete a draft order, marking it as pending
    remote isolated function completeADraftOrder(string draftOrderId, string payload, map<string|string[]> headers = {}) returns CompleteDraftOrder|error {
        return check self.generatedClient->completeADraftOrder(self.apiVersion, draftOrderId, payload, headers);
    }

    # Retrieves a list of orders
    #
    # + 'limit - The maximum number of results to show on a page.(default: 50)(maximum: 250)
    # + return - Retrieve all orders but show only certain properties / Retrieve specific orders
    remote isolated function retrievesAListOfOrders(map<string|string[]> headers = {}, *RetrievesAListOfOrdersQueries queries) returns OrdersList|error {
        return check self.generatedClient->retrievesAListOfOrders(self.apiVersion, headers, queries);
    }

    # Create an order
    #
    # + payload - The order data to create
    # + return - Create a partially paid order with a new customer and addresses / Create a comprehensive order
    remote isolated function createAnOrder(CreateOrder payload, map<string|string[]> headers = {}) returns OrderResponse|error {
        return check self.generatedClient->createAnOrder(self.apiVersion, payload, headers);
    }

    # Cancel an order
    #
    # + orderId - The ID of the order to cancel
    # + payload - The order payload
    # + return - Cancel an order
    remote isolated function cancelAnOrder(string orderId, record {} payload, map<string|string[]> headers = {}) returns OrderResponse|error {
        return check self.generatedClient->cancelAnOrder(self.apiVersion, orderId, payload);
    }

    # Close an order
    #
    # + orderId - The ID of the order to close
    # + payload - The order payload
    # + return - Close an order / Close an order
    remote isolated function closeAnOrder(string orderId, record {} payload, map<string|string[]> headers = {}) returns CloseOrderResponse|error {
        return check self.generatedClient->closeAnOrder(self.apiVersion, orderId, payload, headers);
    }

    # Re-open a closed order
    #
    # + orderId - The ID of the order to re-open
    # + payload - The order payload
    # + return - Re-open a closed order
    remote isolated function reOpenAClosedOrder(string orderId, record {} payload, map<string|string[]> headers = {}) returns ReopenCloseOrder|error {
        return check self.generatedClient->reOpenAClosedOrder(self.apiVersion, orderId, payload, headers);
    }

    # Updates an order
    #
    # + return - Add note attributes to an order / Update the shipping address of an order / Update an order's tags / Add a note to order / Change an order's phone number / Add a metafield to an order / Change an order's email address / Remove the customer from an order / Change whether the buyer accepts marketing / Add note attributes to an order / Update the shipping address of an order / Update an order's tags / Add a note to order / Change an order's phone number / Add a metafield to an order / Change an order's email address / Remove the customer from an order / Change whether the buyer accepts marketing 
    remote isolated function updatesAnOrder(string orderId, UpdateOrder payload, map<string|string[]> headers = {}) returns UpdateOrderResponse|error {
        return check self.generatedClient->updatesAnOrder(self.apiVersion, orderId, payload, headers);
    }

    # Deletes an order
    #
    # + return - Delete an order / Delete an order 
    remote isolated function deletesAnOrder(string orderId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->deletesAnOrder(self.apiVersion, orderId, payload, headers);
    }

    # Retrieves an order count
    #
    # + created_at_min - Count orders created after date (format: 2014-04-25T16:15:47-04:00). 
    # + created_at_max - Count orders created before date (format: 2014-04-25T16:15:47-04:00). 
    # + updated_at_min - Count orders last updated after date (format: 2014-04-25T16:15:47-04:00). 
    # + updated_at_max - Count orders last updated before date (format: 2014-04-25T16:15:47-04:00). 
    # + status - Count orders of a given status.(default: open) 
    # + financial_status - Count orders of a given financial status.(default: any) 
    # + fulfillment_status - Filter orders by their fulfillment status.(default: any) 
    # + return - Count orders that have authorized payments ready to be captured / Count all orders / Count orders that have authorized payments ready to be captured / Count all orders 
    remote isolated function retrievesAnOrderCount(map<string|string[]> headers = {}, *RetrievesAnOrderCountQueries queries) returns ObjectCount|error {
        return check self.generatedClient->retrievesAnOrderCount(self.apiVersion, headers, queries);
    }

    # Retrieves a list of all order risks for an order
    #
    # + return - Retrieve all order risks for an order / Retrieve all order risks for an order 
    remote isolated function retrievesAListOfAllOrderRisksForAnOrder(string orderId, map<string|string[]> headers = {}) returns OrderRisks|error {
        return check self.generatedClient->retrievesAListOfAllOrderRisksForAnOrder(self.apiVersion, orderId, headers);
    }

    # Creates an order risk for an order
    #
    # + return - Create an order risk showing a fraud risk for proxy detection / Create an order risk showing a fraud risk for proxy detection 
    remote isolated function createsAnOrderRiskForAnOrder(string orderId, CreateOrderRisk payload, map<string|string[]> headers = {}) returns CreateOrderRisk|error {
        return check self.generatedClient->createsAnOrderRiskForAnOrder(self.apiVersion, orderId, payload, headers);
    }

    # Retrieves a single order risk by its ID
    #
    # + return - Retrieve a single order risk / Retrieve a single order risk 
    remote isolated function retrievesASingleOrderRiskByItsId(string orderId, string riskId, map<string|string[]> headers = {}) returns SingleOrderRisk|error {
        return check self.generatedClient->retrievesASingleOrderRiskByItsId(self.apiVersion, orderId, riskId, headers);
    }

    # Updates an order risk
    #
    # + return - Update an existing order risk for an order / Update an existing order risk for an order 
    remote isolated function updatesAnOrderRisk(string orderId, string riskId, UpdateOrderRisk payload, map<string|string[]> headers = {}) returns OrderRiskObject|error {
        return check self.generatedClient->updatesAnOrderRisk(self.apiVersion, orderId, riskId, payload, headers);
    }

    # Deletes an order risk for an order
    #
    # + return - Delete an order risk for an order / Delete an order risk for an order 
    remote isolated function deletesAnOrderRiskForAnOrder(string orderId, string riskId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->deletesAnOrderRiskForAnOrder(self.apiVersion, orderId, riskId, payload, headers);
    }

    # Retrieves a list of refunds for an order
    #
    # + 'limit - The maximum number of results to retrieve.(default: 50)(maximum: 250) 
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + in_shop_currency - Show amounts in the shop currency for the underlying transaction.(default: false) 
    # + return - Retrieve all refunds from a specific order / Retrieve all refunds from a specific order 
    remote isolated function retrievesAListOfRefundsForAnOrder(string orderId, map<string|string[]> headers = {}, *RetrievesAListOfRefundsForAnOrderQueries queries) returns Refunds|error {
        return check self.generatedClient->retrievesAListOfRefundsForAnOrder(self.apiVersion, orderId, headers, queries);
    }

    # Creates a refund
    #
    # + return - Create a refund for an order / Refund a specific amount of shipping / Create a refund for an order / Refund a specific amount of shipping 
    remote isolated function createsARefund(string orderId, CreateRefund payload, map<string|string[]> headers = {}) returns RefundObject|error {
        return check self.generatedClient->createsARefund(self.apiVersion, orderId, payload, headers);
    }

    # Calculates a refund
    #
    # + return - Calculate the refund for a line item and shipping / Calculate a refund for a partial amount of shipping / Calculate the refund without specifying currency / Calculate the refund for a line item and shipping / Calculate a refund for a partial amount of shipping / Calculate the refund without specifying currency 
    remote isolated function calculatesARefund(string orderId, RefundsCalculateJsonBody payload, map<string|string[]> headers = {}) returns CalculateRefund|error {
        return check self.generatedClient->calculatesARefund(self.apiVersion, orderId, payload, headers);
    }

    # Retrieves a specific refund
    #
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + in_shop_currency - Show amounts in the shop currency for the underlying transaction.(default: false) 
    # + return - Retrieve a specific refund / Retrieve a specific refund 
    remote isolated function retrievesASpecificRefund(string orderId, string refundId, map<string|string[]> headers = {}, *RetrievesASpecificRefundQueries queries) returns RefundResponse|error {
        return check self.generatedClient->retrievesASpecificRefund(self.apiVersion, orderId, refundId, headers, queries);
    }

    # Retrieves a list of transactions
    #
    # + since_id - Retrieve only transactions after the specified ID. 
    # + fields - Show only certain fields, specifed by a comma-separated list of fields names. 
    # + in_shop_currency - Show amounts in the shop currency.(default: false) 
    # + return - Retrieve an order's transactions / Retrieve an order's transactions after a specified ID / Retrieve an order's transactions / Retrieve an order's transactions after a specified ID 
    remote isolated function retrievesAListOfTransactions(string orderId, map<string|string[]> headers = {}, *RetrievesAListOfTransactionsQueries queries) returns TransactionsList|error {
        return check self.generatedClient->retrievesAListOfTransactions(self.apiVersion, orderId, headers, queries);
    }

    # Creates a transaction for an order
    #
    # + return - Capture the full amount for an authorized order, and associate the capture with an authorization by including its authorization code / Create a test transaction. / Capture a specified amount on an authorized order, and associate the capture with an authorization by including its ID / Capture the full amount for an authorized order, and associate the capture with an authorization by including its authorization code / Create a test transaction. / Capture a specified amount on an authorized order, and associate the capture with an authorization by including its ID 
    remote isolated function createsATransactionForAnOrder(string orderId, CreateTransaction payload, map<string|string[]> headers = {}) returns CreateTransaction|error {
        return check self.generatedClient->createsATransactionForAnOrder(self.apiVersion, orderId, payload, headers);
    }

    # Retrieves a specific transaction
    #
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + in_shop_currency - Show amounts in the shop currency.(default: false) 
    # + return - Retrieve a specific transaction for an order / Retrieve a specific transaction for an order 
    remote isolated function retrievesASpecificTransaction(string orderId, string transactionId, map<string|string[]> headers = {}, *RetrievesASpecificTransactionQueries queries) returns TransactionResponse|error {
        return check self.generatedClient->retrievesASpecificTransaction(self.apiVersion, orderId, transactionId, headers, queries);
    }

    # Retrieves a count of an order's transactions
    #
    # + return - Count an order's transactions / Count an order's transactions 
    remote isolated function retrievesACountOfAnOrderSTransactions(string orderId, map<string|string[]> headers = {}) returns EventsCount|error {
        return check self.generatedClient->retrievesACountOfAnOrderSTransactions(self.apiVersion, orderId, headers);
    }

    # Retrieves a list of all users
    #
    # + return - Retrieve a list of all users / Retrieve a list of all users 
    remote isolated function retrievesAListOfAllUsers(string? xShopifyAccessToken = (), map<string|string[]> headers = {}) returns UsersList|error {
        return check self.generatedClient->retrievesAListOfAllUsers(self.apiVersion, headers);
    }

    # Retrieves a single user
    #
    # + return - Retrieve a single user / Retrieve a single user 
    remote isolated function retrievesASingleUser(string userId, map<string|string[]> headers = {}) returns SingleUser|error {
        return check self.generatedClient->retrievesASingleUser(self.apiVersion, userId, headers);
    }

    # Retrieves the currently logged-in user
    #
    # + return - Retrieve the the currently logged-in user / Retrieve the the currently logged-in user 
    remote isolated function retrievesTheCurrentlyLoggedInUser(string? xShopifyAccessToken = (), map<string|string[]> headers = {}) returns SingleUser|error {
        return check self.generatedClient->retrievesTheCurrentlyLoggedInUser(self.apiVersion, headers);
    }

    # Retrieves a list of collects
    #
    # + 'limit - The maximum number of results to show.(default: 50)(maximum: 250) 
    # + since_id - Restrict results to after the specified ID. 
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - Retrieve only collects for a certain product / Retrieve all collects for the shop / Retrieve only collects for a certain collection / Retrieve only collects for a certain product / Retrieve all collects for the shop / Retrieve only collects for a certain collection 
    remote isolated function retrievesAListOfCollects(map<string|string[]> headers = {}, *RetrievesAListOfCollectsQueries queries) returns CollectsList|error {
        return check self.generatedClient->retrievesAListOfCollects(self.apiVersion, headers, queries);
    }

    # Adds a product to a custom collection
    #
    # + return - Create a new link between an existing product and an existing collection / Create a new link between an existing product and an existing collection 
    remote isolated function addsAProductToACustomCollection(ApiVersionCollectsJsonBody payload, map<string|string[]> headers = {}) returns ProductToCollectionResponse|error {
        return check self.generatedClient->addsAProductToACustomCollection(self.apiVersion, payload, headers);
    }

    # Retrieves a specific collect by its ID
    #
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - Retrieve a collect with a certain ID / Retrieve a collect with a certain ID 
    remote isolated function retrievesASpecificCollectByItsId(string collectId, map<string|string[]> headers = {}, *RetrievesASpecificCollectByItsIdQueries queries) returns CollectResponse|error {
        return check self.generatedClient->retrievesASpecificCollectByItsId(self.apiVersion, collectId, headers, queries);
    }

    # Removes a product from a collection
    #
    # + return - Delete the link between a product an a collection / Delete the link between a product an a collection 
    remote isolated function removesAProductFromACollection(string collectId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->removesAProductFromACollection(self.apiVersion, collectId, payload, headers);
    }

    # Retrieves a count of collects
    #
    # + return - Count only collects for a certain collection / Count only collects for a certain product / Count all collects for the shop / Count only collects for a certain collection / Count only collects for a certain product / Count all collects for the shop 
    remote isolated function retrievesACountOfCollects(string? xShopifyAccessToken = (), map<string|string[]> headers = {}) returns ObjectCount|error {
        return check self.generatedClient->retrievesACountOfCollects(self.apiVersion, headers);
    }

    # Retrieves a single collection
    #
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - Retrieve a specific collection by its ID / Retrieve a specific collection by its ID 
    remote isolated function retrievesASingleCollection(string collectionId, map<string|string[]> headers = {}, *RetrievesASingleCollectionQueries queries) returns SingleCollection|error {
        return check self.generatedClient->retrievesASingleCollection(self.apiVersion, collectionId, headers, queries);
    }

    # Retrieve a list of products belonging to a collection
    #
    # + 'limit - The number of products to retrieve.(default: 50)(maximum: 250) 
    # + return - Retrieve a list of products belonging to a collection / Retrieve a list of products belonging to a collection 
    remote isolated function retrieveAListOfProductsBelongingToACollection(string collectionId, map<string|string[]> headers = {}, *RetrieveAListOfProductsBelongingToACollectionQueries queries) returns ProductsList|error {
        return check self.generatedClient->retrieveAListOfProductsBelongingToACollection(self.apiVersion, collectionId, headers, queries);
    }

    # Retrieves a list of custom collections
    #
    # + 'limit - The maximum number of results to retrieve.(default: 50)(maximum: 250) 
    # + ids - Show only collections specified by a comma-separated list of IDs. 
    # + since_id - Restrict results to after the specified ID. 
    # + title - Show custom collections with a given title. 
    # + product_id - Show custom collections that include a given product. 
    # + 'handle - Filter by custom collection handle. 
    # + updated_at_min - Show custom collections last updated after date (format: 2014-04-25T16:15:47-04:00). 
    # + updated_at_max - Show custom collections last updated before date (format: 2014-04-25T16:15:47-04:00). 
    # + published_at_min - Show custom collections published after date (format: 2014-04-25T16:15:47-04:00). 
    # + published_at_max - Show custom collections published before date (format: 2014-04-25T16:15:47-04:00). 
    # + published_status - Show custom collectsion with a given published status.(default: any) 
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - Retrieve all collections / Retrieve all collections after the specified ID / Retrieve a list of specific custom collections / Retrieve all custom collections that contain a given product / Retrieve all collections / Retrieve all collections after the specified ID / Retrieve a list of specific custom collections / Retrieve all custom collections that contain a given product 
    remote isolated function retrievesAListOfCustomCollections(map<string|string[]> headers = {}, *RetrievesAListOfCustomCollectionsQueries queries) returns CollectionList|error {
        return check self.generatedClient->retrievesAListOfCustomCollections(self.apiVersion, headers, queries);
    }

    # Creates a custom collection
    #
    # + return - Create an unpublished custom collection / Create a custom collection / Create a collection that contains a product by including a collect / Create a custom collection with a base64-encoded image / Create a custom collection with a metafield / Create a custom collection with an image, which will be uploaded to Shopify / Create an unpublished custom collection / Create a custom collection / Create a collection that contains a product by including a collect / Create a custom collection with a base64-encoded image / Create a custom collection with a metafield / Create a custom collection with an image, which will be uploaded to Shopify 
    remote isolated function createsACustomCollection(ApiVersionCustomCollectionsJsonBody payload, map<string|string[]> headers = {}) returns CreateCollection|error {
        return check self.generatedClient->createsACustomCollection(self.apiVersion, payload, headers);
    }

    # Retrieves a single custom collection
    #
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - Retrieve a specific collection by its ID / Retrieve a specific collection by its ID 
    remote isolated function retrievesASingleCustomCollection(string customCollectionId, map<string|string[]> headers = {}, *RetrievesASingleCustomCollectionQueries queries) returns SingleCustomCollection|error {
        return check self.generatedClient->retrievesASingleCustomCollection(self.apiVersion, customCollectionId, headers, queries);
    }

    # Updates an existing custom collection
    #
    # + return - Update the description of a custom collection / Update a collection to remove its image / Update a collection with a new collection image / Update a collection with new alt text for its image / Publish a hidden collection / Add a collect to an existing collection by providing a product ID, and update an existing collect by its own ID to change its sort position / Add a metafield to an existing collection / Hide a published collection / Update the description of a custom collection / Update a collection to remove its image / Update a collection with a new collection image / Update a collection with new alt text for its image / Publish a hidden collection / Add a collect to an existing collection by providing a product ID, and update an existing collect by its own ID to change its sort position / Add a metafield to an existing collection / Hide a published collection 
    remote isolated function updatesAnExistingCustomCollection(string customCollectionId, CustomCollectionscustomCollectionIdJsonBody payload, map<string|string[]> headers = {}) returns UpdateCustomCollection|error {
        return check self.generatedClient->updatesAnExistingCustomCollection(self.apiVersion, customCollectionId, payload, headers);
    }

    # Deletes a custom collection
    #
    # + return - Delete a custom collection / Delete a custom collection 
    remote isolated function deletesACustomCollection(string customCollectionId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->deletesACustomCollection(self.apiVersion, customCollectionId, payload, headers);
    }

    # Retrieves a count of custom collections
    #
    # + title - Count custom collections with given title. 
    # + product_id - Count custom collections that include a given product. 
    # + updated_at_min - Count custom collections last updated after date (format: 2014-04-25T16:15:47-04:00). 
    # + updated_at_max - Count custom collections last updated before date (format: 2014-04-25T16:15:47-04:00). 
    # + published_at_min - Count custom collections published after date (format: 2014-04-25T16:15:47-04:00). 
    # + published_at_max - Count custom collections published before date (format: 2014-04-25T16:15:47-04:00). 
    # + published_status - Count custom collections with a given published status.(default: any) 
    # + return - Count all custom collections that contain a given product / Count all custom collections / Count all custom collections that contain a given product / Count all custom collections 
    remote isolated function retrievesACountOfCustomCollections(map<string|string[]> headers = {}, *RetrievesACountOfCustomCollectionsQueries queries) returns BlogsCount|error {
        return check self.generatedClient->retrievesACountOfCustomCollections(self.apiVersion, headers, queries);
    }

    # Retrieves a list of products
    #
    # + ids - Return only products specified by a comma-separated list of product IDs. 
    # + 'limit - Return up to this many results per page.(default: 50)(maximum: 250) 
    # + since_id - Restrict results to after the specified ID. 
    # + title - Filter results by product title. 
    # + vendor - Filter results by product vendor. 
    # + 'handle - Filter results by product handle. 
    # + product_type - Filter results by product type. 
    # + collection_id - Filter results by product collection ID. 
    # + created_at_min - Show products created after date. (format: 2014-04-25T16:15:47-04:00) 
    # + created_at_max - Show products created before date. (format: 2014-04-25T16:15:47-04:00) 
    # + updated_at_min - Show products last updated after date. (format: 2014-04-25T16:15:47-04:00) 
    # + updated_at_max - Show products last updated before date. (format: 2014-04-25T16:15:47-04:00) 
    # + published_at_min - Show products published after date. (format: 2014-04-25T16:15:47-04:00) 
    # + published_at_max - Show products published before date. (format: 2014-04-25T16:15:47-04:00) 
    # + published_status - Return products by their published status(default: any) 
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + presentment_currencies - Return presentment prices in only certain currencies, specified by a comma-separated list of [ISO 4217][1] currency codes. 
    # [1]: https://en.wikipedia.org/wiki/ISO_4217
    # + return - Retrieve all products, showing only some attributes / Retrieve all products with prices in selected presentment currencies / Retrieve all products that belong to a certain collection / Retrieve all products / Retrieve all products after the specified ID / Retrieve a list of specific products. / Retrieve all products, showing only some attributes / Retrieve all products with prices in selected presentment currencies / Retrieve all products that belong to a certain collection / Retrieve all products / Retrieve all products after the specified ID / Retrieve a list of specific products. 
    remote isolated function retrievesAListOfProducts(map<string|string[]> headers = {}, *RetrievesAListOfProductsQueries queries) returns ProductsResponse|error {
        return check self.generatedClient->retrievesAListOfProducts(self.apiVersion, headers, queries);
    }

    # Creates a new product
    #
    # + return - Create a new product with multiple product variants and multiple options / Create a new product with multiple product variants / Create a new product with the default variant and base64 encoded image / Create a product with a metafield / Create a new product with the default product variant / Create a new product with the default variant and a product image that will be downloaded by Shopify / Create a new unpublished product.
    remote isolated function createsANewProduct(CreateProduct payload, map<string|string[]> headers = {}) returns CreateProductResponse|error {
        return check self.generatedClient->createsANewProduct(self.apiVersion, payload, headers);
    }

    # Retrieves a single product
    #
    # + fields - A comma-separated list of fields to include in the response.
    # + return - Retrieve only particular fields / Retrieve a single product by ID.
    remote isolated function retrievesASingleProduct(string productId, map<string|string[]> headers = {}, *RetrievesASingleProductQueries queries) returns SingleProduct|error {
        return check self.generatedClient->retrievesASingleProduct(self.apiVersion, productId, headers, queries);
    }

    # Updates a product
    #
    # + return - Add a metafield to an existing product / Update a product by adding a new product image / Update a product by reordering product image / Update a product's title / Update a product by clearing product images / Hide a published product by changing the published attribute to false / Update a product's SEO title and description / Update a product and one of its variants / Update a product by reordering the product variants / Show a hidden product by changing the published attribute to true / Update a product's tags / Add a metafield to an existing product / Update a product by adding a new product image / Update a product by reordering product image / Update a product's title / Update a product by clearing product images / Hide a published product by changing the published attribute to false / Update a product's SEO title and description / Update a product and one of its variants / Update a product by reordering the product variants / Show a hidden product by changing the published attribute to true / Update a product's tags 
    remote isolated function updatesAProduct(string productId, UpdateProduct payload, map<string|string[]> headers = {}) returns ProductObject|error {
        return check self.generatedClient->updatesAProduct(self.apiVersion, productId, payload, headers);
    }

    # Deletes a product
    #
    # + return - Delete a product along with all its variants and images / Delete a product along with all its variants and images 
    remote isolated function deletesAProduct(string productId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->deletesAProduct(self.apiVersion, productId, payload, headers);
    }

    # Retrieves a count of products
    #
    # + vendor - Filter results by product vendor. 
    # + product_type - Filter results by product type. 
    # + collection_id - Filter results by collection ID. 
    # + created_at_min - Show products created after date. (format: 2014-04-25T16:15:47-04:00) 
    # + created_at_max - Show products created before date. (format: 2014-04-25T16:15:47-04:00) 
    # + updated_at_min - Show products last updated after date. (format: 2014-04-25T16:15:47-04:00) 
    # + updated_at_max - Show products last updated before date. (format: 2014-04-25T16:15:47-04:00) 
    # + published_at_min - Show products published after date. (format: 2014-04-25T16:15:47-04:00) 
    # + published_at_max - Show products published before date. (format: 2014-04-25T16:15:47-04:00) 
    # + published_status - Return products by their published status(default: any)
    #
    # + return - Retrieve a count of all products of a given collection / Retrieve a count of all products / Retrieve a count of all products of a given collection / Retrieve a count of all products 
    remote isolated function retrievesACountOfProducts(map<string|string[]> headers = {}, *RetrievesACountOfProductsQueries queries) returns ObjectCount|error {
        return check self.generatedClient->retrievesACountOfProducts(self.apiVersion, headers, queries);
    }

    # Receive a list of all Product Images
    #
    # + since_id - Restrict results to after the specified ID 
    # + fields - comma-separated list of fields to include in the response
    #
    # + return - Get all product images for a product / Get all product images for a product after a specified ID / Get all product images for a product / Get all product images for a product after a specified ID 
    remote isolated function receiveAListOfAllProductImages(string productId, map<string|string[]> headers = {}, *ReceiveAListOfAllProductImagesQueries queries) returns ProductImages|error {
        return check self.generatedClient->receiveAListOfAllProductImages(self.apiVersion, productId, headers, queries);
    }

    # Create a new Product Image
    #
    # + return - Create a new product image with included image data as attachment / Create a new product image and make it the main image / Create a new product image using a source URL that will be downloaded by Shopify / Create a new product image and attach it to product variants / <span id="metafield">Create a new product image with a metafield</span> / Create a new product image with included image data as attachment / Create a new product image and make it the main image / Create a new product image using a source URL that will be downloaded by Shopify / Create a new product image and attach it to product variants / <span id="metafield">Create a new product image with a metafield</span> 
    remote isolated function createANewProductImage(string productId, ProductIdImagesJsonBody payload, map<string|string[]> headers = {}) returns CreateProductImage|error {
        return check self.generatedClient->createANewProductImage(self.apiVersion, productId, payload, headers);
    }

    # Receive a single Product Image
    #
    # + fields - comma-separated list of fields to include in the response 
    # + return - Show product image / Show product image 
    remote isolated function receiveASingleProductImage(string productId, string imageId, map<string|string[]> headers = {}, *ReceiveASingleProductImageQueries queries) returns SingleProductImage|error {
        return check self.generatedClient->receiveASingleProductImage(self.apiVersion, productId, imageId, headers, queries);
    }

    # Modify an existing Product Image
    #
    # + return - Modify an image; add a metafield / Modify an image; change its position and alt tag content / Modify an image; add it to product variants / Modify an image; add a metafield / Modify an image; change its position and alt tag content / Modify an image; add it to product variants 
    remote isolated function modifyAnExistingProductImage(string productId, string imageId, ImagesimageIdJsonBody payload, map<string|string[]> headers = {}) returns ModifyProductImage|error {
        return check self.generatedClient->modifyAnExistingProductImage(self.apiVersion, productId, imageId, payload, headers);
    }

    # Remove an existing Product Image
    #
    # + return - Delete a product image / Delete a product image 
    remote isolated function removeAnExistingProductImage(string productId, string imageId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->removeAnExistingProductImage(self.apiVersion, productId, imageId, payload, headers);
    }

    # Receive a count of all Product Images
    #
    # + since_id - Restrict results to after the specified ID 
    # + return - Get a count all product images / Get a count of all product images after a specified ID / Get a count all product images / Get a count of all product images after a specified ID 
    remote isolated function receiveACountOfAllProductImages(string productId, map<string|string[]> headers = {}, *ReceiveACountOfAllProductImagesQueries queries) returns BlogsCount|error {
        return check self.generatedClient->receiveACountOfAllProductImages(self.apiVersion, productId, headers, queries);
    }

    # Retrieves a list of product variants
    #
    # + 'limit - Return up to this many results per page(default: 50)(maximum: 250) 
    # + presentment_currencies - Return presentment prices in only certain currencies, specified by a comma-separated list of [ISO 4217][1] currency codes. 
    # [1]: https://en.wikipedia.org/wiki/ISO_4217
    # + since_id - Restrict results to after the specified ID 
    # + fields - A comma-separated list of fields to include in the response 
    # + return - Retrieve all variants for a product / Retrieve all variants for a product with prices in specified presentment currencies / Retrieve all variants for a product after a specified ID / Retrieve all variants for a product / Retrieve all variants for a product with prices in specified presentment currencies / Retrieve all variants for a product after a specified ID 
    remote isolated function retrievesAListOfProductVariants(string productId, map<string|string[]> headers = {}, *RetrievesAListOfProductVariantsQueries queries) returns ProductVariants|error {
        return check self.generatedClient->retrievesAListOfProductVariants(self.apiVersion, productId, headers, queries);
    }

    # Create a new Product Variant
    #
    # + return - Create a new product variant with an image / Create a new product variant with a metafield / Create a new product variant / Create a new product variant with an image / Create a new product variant with a metafield / Create a new product variant 
    remote isolated function createANewProductVariant(string productId, CreateProductVariant payload, map<string|string[]> headers = {}) returns CreateProductVariant|error {
        return check self.generatedClient->createANewProductVariant(self.apiVersion, productId, payload, headers);
    }

    # Receive a count of all Product Variants
    #
    # + return - Retrieve a count all variants for a product / Retrieve a count all variants for a product 
    remote isolated function receiveACountOfAllProductVariants(string productId, map<string|string[]> headers = {}) returns ArticlesCount|error {
        return check self.generatedClient->receiveACountOfAllProductVariants(self.apiVersion, productId, headers);
    }

    # Receive a single Product Variant
    #
    # + fields - A comma-separated list of fields to include in the response 
    # + return - Retrieve a product variant by ID / Retrieve a product variant by ID 
    remote isolated function receiveASingleProductVariant(string variantId, map<string|string[]> headers = {}, *ReceiveASingleProductVariantQueries queries) returns ProductVariantResponse|error {
        return check self.generatedClient->receiveASingleProductVariant(self.apiVersion, variantId, headers, queries);
    }

    # Modify an existing Product Variant
    #
    # + return - Add a metafield to an existing variant / Add an existing image to an existing variant / Update the title and price of an existing variant / Add a metafield to an existing variant / Add an existing image to an existing variant / Update the title and price of an existing variant 
    remote isolated function modifyAnExistingProductVariant(string variantId, UpdateProductVariant payload, map<string|string[]> headers = {}) returns ModifyProductVariant|error {
        return check self.generatedClient->modifyAnExistingProductVariant(self.apiVersion, variantId, payload, headers);
    }

    # Remove an existing Product Variant
    #
    # + return - Delete a product variant / Delete a product variant 
    remote isolated function removeAnExistingProductVariant(string productId, string variantId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->removeAnExistingProductVariant(self.apiVersion, productId, variantId, payload, headers);
    }

    # Retrieves a list of smart collections
    #
    # + 'limit - The number of results to show.(default: 50)(maximum: 250) 
    # + ids - Show only the smart collections specified by a comma-separated list of IDs. 
    # + since_id - Restrict results to after the specified ID. 
    # + title - Show smart collections with the specified title. 
    # + product_id - Show smart collections that includes the specified product. 
    # + 'handle - Filter results by smart collection handle. 
    # + updated_at_min - Show smart collections last updated after this date. (format: 2014-04-25T16:15:47-04:00) 
    # + updated_at_max - Show smart collections last updated before this date. (format: 2014-04-25T16:15:47-04:00) 
    # + published_at_min - Show smart collections published after this date. (format: 2014-04-25T16:15:47-04:00) 
    # + published_at_max - Show smart collections published before this date. (format: 2014-04-25T16:15:47-04:00) 
    # + published_status - Filter results based on the published status of smart collections.(default: any) 
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - Retrieve a list of all smart collections for a certain product_id / Retrieve a list of specific smart collections / Retrieve a list of all smart collections / Retrieve a list all smart collections after a specified ID / Retrieve a list of all smart collections for a certain product_id / Retrieve a list of specific smart collections / Retrieve a list of all smart collections / Retrieve a list all smart collections after a specified ID 
    remote isolated function retrievesAListOfSmartCollections(map<string|string[]> headers = {}, *RetrievesAListOfSmartCollectionsQueries queries) returns SmartCollectionList|error {
        return check self.generatedClient->retrievesAListOfSmartCollections(self.apiVersion, headers, queries);
    }

    # Creates a smart collection
    #
    # + return - Create a new smart collection with a base64 encoded image / Create a smart collection of all products starting with the specified term / Create a smart collection with a specified title / Create a new smart collection with an image that will be downloaded by Shopify / Create a new unpublished smart collection / Create a new smart collection with a base64 encoded image / Create a smart collection of all products starting with the specified term / Create a smart collection with a specified title / Create a new smart collection with an image that will be downloaded by Shopify / Create a new unpublished smart collection 
    remote isolated function createsASmartCollection(ApiVersionSmartCollectionsJsonBody payload, map<string|string[]> headers = {}) returns CreatSmartCollection|error {
        return check self.generatedClient->createsASmartCollection(self.apiVersion, payload, headers);
    }

    # Retrieves a single smart collection
    #
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - Retrieve a specific collection by ID / Retrieve a specific collection by ID 
    remote isolated function retrievesASingleSmartCollection(string smartCollectionId, map<string|string[]> headers = {}, *RetrievesASingleSmartCollectionQueries queries) returns SmartCollectionResponse|error {
        return check self.generatedClient->retrievesASingleSmartCollection(self.apiVersion, smartCollectionId, headers, queries);
    }

    # Updates an existing smart collection
    #
    # + return - Update the description of a smart collection / Hide a published smart collection / Update a smart collection by setting a new collection image alternative text / Update a smart collection by clearing the collection image / Publish a hidden collection / Update a smart collection by setting a new collection image / Update the description of a smart collection / Hide a published smart collection / Update a smart collection by setting a new collection image alternative text / Update a smart collection by clearing the collection image / Publish a hidden collection / Update a smart collection by setting a new collection image 
    remote isolated function updatesAnExistingSmartCollection(string smartCollectionId, SmartCollectionssmartCollectionIdJsonBody payload, map<string|string[]> headers = {}) returns UpdateSmartCollection|error {
        return check self.generatedClient->updatesAnExistingSmartCollection(self.apiVersion, smartCollectionId, payload, headers);
    }

    # Removes a smart collection
    #
    # + return - Remove a smart collection / Remove a smart collection 
    remote isolated function removesASmartCollection(string smartCollectionId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->removesASmartCollection(self.apiVersion, smartCollectionId, payload, headers);
    }

    # Retrieves a count of smart collections
    #
    # + title - Show smart collections with the specified title. 
    # + product_id - Show smart collections that include the specified product. 
    # + updated_at_min - Show smart collections last updated after this date. (format: 2014-04-25T16:15:47-04:00) 
    # + updated_at_max - Show smart collections last updated before this date. (format: 2014-04-25T16:15:47-04:00) 
    # + published_at_min - Show smart collections published after this date. (format: 2014-04-25T16:15:47-04:00) 
    # + published_at_max - Show smart collections published before this date. (format: 2014-04-25T16:15:47-04:00) 
    # + published_status - Filter results based on the published status of smart collections.(default: any) 
    # + return - Retrieve a count of all smart collections for a certain product_id / Retrieve a count of all smart collections / Retrieve a count of all smart collections for a certain product_id / Retrieve a count of all smart collections 
    remote isolated function retrievesACountOfSmartCollections(map<string|string[]> headers = {}, *RetrievesACountOfSmartCollectionsQueries queries) returns ObjectCount|error {
        return check self.generatedClient->retrievesACountOfSmartCollections(self.apiVersion, headers, queries);
    }

    # Updates the ordering type of products in a smart collection
    #
    # + return - Update the type of ordering applied to the smart collection / Update manually-sorted products in the smart collection / Update the type of ordering applied to the smart collection / Update manually-sorted products in the smart collection 
    remote isolated function updatesTheOrderingTypeOfProductsInASmartCollection(string smartCollectionId, record {} payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->updatesTheOrderingTypeOfProductsInASmartCollection(self.apiVersion, smartCollectionId, payload, headers);
    }

    # Completes a checkout
    #
    # + return - Complete a checkout without requiring payment / Complete a checkout without requiring payment 
    remote isolated function completesACheckout(string token, record {} payload, map<string|string[]> headers = {}) returns CompleteCheckoutResponse|error {
        return check self.generatedClient->completesACheckout(self.apiVersion, token, payload, headers);
    }

    # Retrieves a checkout
    #
    # + return - Retrieve a completed checkout / Retrieve a completed checkout 
    remote isolated function retrievesACheckout(string token, map<string|string[]> headers = {}) returns CompleteCheckout|CheckoutResponse|error {
        return check self.generatedClient->retrievesACheckout(self.apiVersion, token, headers);
    }

    # Modifies an existing checkout
    #
    # + return - Select a shipping rate / Select a shipping rate 
    remote isolated function modifiesAnExistingCheckout(string token, CheckoutstokenJsonBody payload, map<string|string[]> headers = {}) returns UpdateCheckoutResponse|ShippingRateResponse|error {
        return check self.generatedClient->modifiesAnExistingCheckout(self.apiVersion, token, payload, headers);
    }

    # Retrieves a list of shipping rates
    #
    # + return - Retrieve available shipping rates / Retrieving shipping rates when none are available for the current shipping address or cart returns an empty array / Retrieve available shipping rates / Retrieving shipping rates when none are available for the current shipping address or cart returns an empty array 
    remote isolated function retrievesAListOfShippingRates(string token, map<string|string[]> headers = {}) returns AvailableShippingRates|ShippingRates|error {
        return check self.generatedClient->retrievesAListOfShippingRates(self.apiVersion, token, headers);
    }

    # Retrieve collection listings that are published to your app
    #
    # + 'limit - Amount of results(default: 50)(maximum: 1000) 
    # + return - Retrieve collection listings that are published to your app / Retrieve collection listings that are published to your app 
    remote isolated function retrieveCollectionListingsThatArePublishedToYourApp(map<string|string[]> headers = {}, *RetrieveCollectionListingsThatArePublishedToYourAppQueries queries) returns CollectionListingResponse|error {
        return check self.generatedClient->retrieveCollectionListingsThatArePublishedToYourApp(self.apiVersion, headers, queries);
    }

    # Retrieve product_ids that are published to a collection_id
    #
    # + 'limit - Amount of results(default: 50)(maximum: 1000) 
    # + return - Retrieve <code>product_ids</code> that are published to a <code>collection_id</code> / Retrieve <code>product_ids</code> that are published to a <code>collection_id</code> 
    remote isolated function retrieveProductIdsThatArePublishedToACollectionId(string collectionListingId, map<string|string[]> headers = {}, *RetrieveProductIdsThatArePublishedToACollectionIdQueries queries) returns ProductIds|error {
        return check self.generatedClient->retrieveProductIdsThatArePublishedToACollectionId(self.apiVersion, collectionListingId, headers, queries);
    }

    # Retrieve a specific collection listing that is published to your app
    #
    # + return - Retrieve a specific collection listing that is published to your app / Retrieve a specific collection listing that is published to your app 
    remote isolated function retrieveASpecificCollectionListingThatIsPublishedToYourApp(string collectionListingId, map<string|string[]> headers = {}) returns CollectionListing|error {
        return check self.generatedClient->retrieveASpecificCollectionListingThatIsPublishedToYourApp(self.apiVersion, collectionListingId, headers);
    }

    # Create a collection listing to publish a collection to your app
    #
    # + return - Create a collection listing to publish a collection to your app / Create a collection listing to publish a collection to your app 
    remote isolated function createACollectionListingToPublishACollectionToYourApp(string collectionListingId, CollectionListingscollectionListingIdJsonBody payload, map<string|string[]> headers = {}) returns CollectionListing|error {
        return check self.generatedClient->createACollectionListingToPublishACollectionToYourApp(self.apiVersion, collectionListingId, payload, headers);
    }

    # Delete a collection listing to unpublish a collection from your app
    #
    # + return - Delete a collection listing to unpublish a collection from your app / Delete a collection listing to unpublish a collection from your app 
    remote isolated function deleteACollectionListingToUnpublishACollectionFromYourApp(string collectionListingId, string payload, map<string|string[]> headers = {}) returns string|error {
        return check self.generatedClient->deleteACollectionListingToUnpublishACollectionFromYourApp(self.apiVersion, collectionListingId, payload, headers);
    }

    # Retrieves a list of payments on a particular checkout
    #
    # + return - Retrieve all the payments on a checkout 
    remote isolated function retrievesAListOfPaymentsOnAParticularCheckout(string token, map<string|string[]> headers = {}) returns PaymentsResponse|error {
        return check self.generatedClient->retrievesAListOfPaymentsOnAParticularCheckout(self.apiVersion, token, headers);
    }

    # Creates a new payment
    #
    # + return - Create an authorization using a valid <code>session_id</code> stored in the vault / Create an authorization using a valid <code>session_id</code> stored in the vault 
    remote isolated function createsANewPayment(string token, TokenPaymentsJsonBody payload, map<string|string[]> headers = {}) returns CreateAuthorizationResponse|error {
        return check self.generatedClient->createsANewPayment(self.apiVersion, token, payload, headers);
    }

    # Retrieves a single payment
    #
    # + return - Retrieve a payment with a succesful transaction / Retrieve a payment with a failed transaction / Retrieve a payment with a succesful transaction / Retrieve a payment with a failed transaction 
    remote isolated function retrievesASinglePayment(string token, string paymentId, map<string|string[]> headers = {}) returns SinglePaymentResponse|error {
        return check self.generatedClient->retrievesASinglePayment(self.apiVersion, token, paymentId, headers);
    }

    # Receive a list of all Product ResourceFeedbacks
    #
    # + return - Receive a list of all Product ResourceFeedbacks 
    remote isolated function receiveAListOfAllProductResourcefeedbacks(string productId, map<string|string[]> headers = {}) returns ResourceFeedbackList|error {
        return check self.generatedClient->receiveAListOfAllProductResourcefeedbacks(self.apiVersion, productId, headers);
    }

    # Create a new Product ResourceFeedback
    #
    # + return - Create a new Product ResourceFeedback 
    remote isolated function createANewProductResourcefeedback(string productId, ProductIdResourceFeedbackJsonBody payload, map<string|string[]> headers = {}) returns ResourceFeedbackList|error {
        return check self.generatedClient->createANewProductResourcefeedback(self.apiVersion, productId, payload, headers);
    }

    # Retrieve product listings that are published to your app
    #
    # + product_ids - A comma-separated list of product ids 
    # + 'limit - Amount of results(default: 50)(maximum: 1000) 
    # + page - Page to show(default: 1) 
    # + collection_id - Filter by products belonging to a particular collection 
    # + updated_at_min - Filter by products last updated after a certain date and time (formatted in ISO 8601) 
    # + 'handle - Filter by product handle 
    # + return - Retrieve product listings that are published to your app / Retrieve product listings that are published to your app 
    remote isolated function retrieveProductListingsThatArePublishedToYourApp(map<string|string[]> headers = {}, *RetrieveProductListingsThatArePublishedToYourAppQueries queries) returns ProductListings|error {
        return check self.generatedClient->retrieveProductListingsThatArePublishedToYourApp(self.apiVersion, headers, queries);
    }

    # Retrieve a specific product listing that is published to your app
    #
    # + return - Retrieve a specific product listing that is published to your app / Retrieve a specific product listing that is published to your app 
    remote isolated function retrieveASpecificProductListingThatIsPublishedToYourApp(string productListingId, map<string|string[]> headers = {}) returns ProductListingAppResponse|error {
        return check self.generatedClient->retrieveASpecificProductListingThatIsPublishedToYourApp(self.apiVersion, productListingId, headers);
    }

    # Create a product listing to publish a product to your app
    #
    # + return - Create a product listing to publish a product to your app / Create a product listing to publish a product to your app 
    remote isolated function createAProductListingToPublishAProductToYourApp(string productListingId, ProductListingsproductListingIdJsonBody payload, map<string|string[]> headers = {}) returns ProductListingAppResponse|error {
        return check self.generatedClient->createAProductListingToPublishAProductToYourApp(self.apiVersion, productListingId, payload, headers);
    }

    # Delete a product listing to unpublish a product from your app
    #
    # + return - Delete a product listing to unpublish a product from your app / Delete a product listing to unpublish a product from your app 
    remote isolated function deleteAProductListingToUnpublishAProductFromYourApp(string productListingId, string payload, map<string|string[]> headers = {}) returns string|error {
        return check self.generatedClient->deleteAProductListingToUnpublishAProductFromYourApp(self.apiVersion, productListingId, payload, headers);
    }

    # Retrieve a count of products that are published to your app
    #
    # + return - Retrieve a count of products that are published to your app / Retrieve a count of products that are published to your app 
    remote isolated function retrieveACountOfProductsThatArePublishedToYourApp(string? xShopifyAccessToken = (), map<string|string[]> headers = {}) returns BlogsCount|error {
        return check self.generatedClient->retrieveACountOfProductsThatArePublishedToYourApp(self.apiVersion, headers);
    }

    # Retrieve product_ids that are published to your app
    #
    # + 'limit - Amount of results(default: 50)(maximum: 1000) 
    # + return - Retrieve <code>product_ids</code> that are published to your app / Retrieve <code>product_ids</code> that are published to your app 
    remote isolated function retrieveProductIdsThatArePublishedToYourApp(map<string|string[]> headers = {}, *RetrieveProductIdsThatArePublishedToYourAppQueries queries) returns ProductIdAppResponse|error {
        return check self.generatedClient->retrieveProductIdsThatArePublishedToYourApp(self.apiVersion, headers, queries);
    }

    # Receive a list of all ResourceFeedbacks
    #
    # + return - Get a list of resource feedback records for a specific shop / Get a list of resource feedback records for a specific shop 
    remote isolated function receiveAListOfAllResourcefeedbacks(string? xShopifyAccessToken = (), map<string|string[]> headers = {}) returns ResourceFeedbackList|error {
        return check self.generatedClient->receiveAListOfAllResourcefeedbacks(self.apiVersion, headers);
    }

    # Create a new ResourceFeedback
    #
    # + return - Create a shop feedback record indicating the Shop is usable by your app / Create a shop feedback record indicating a problem specific to your app / Create a shop feedback record indicating the Shop is usable by your app / Create a shop feedback record indicating a problem specific to your app 
    remote isolated function createANewResourcefeedback(ApiVersionResourceFeedbackJsonBody payload, map<string|string[]> headers = {}) returns CreateShopFeedback|error {
        return check self.generatedClient->createANewResourcefeedback(self.apiVersion, payload, headers);
    }

    # Retrieves a list of fulfillment orders assigned to the shop locations that are owned by the app
    #
    # + assignment_status - The assignment status of the fulfillment orders that should be returned. If assignment_status parameter isn't provided, then the query will return all assigned fulfillment orders, except those with the CLOSED status.
    # + location_ids - he IDs of the assigned locations of the fulfillment orders that should be returned.
    # If the location_ids parameter isn't provided, then all fulfillment orders assigned to the shop locations that are managed by the app will be returned.
    # + return - Retrieve a list of fulfillment orders in cancellation_requested state at a location for an app / Retrieve a list of fulfillment orders in cancellation_requested state at a location for an app 
    remote isolated function retrievesAListOfFulfillmentOrdersAssignedToTheShopLocationsThatAreOwnedByTheApp(string apiVersion, map<string|string[]> headers = {}, *RetrievesAListOfFulfillmentOrdersAssignedToTheShopLocationsThatAreOwnedByTheAppQueries queries) returns FulfillmentOrders|error {
        return check self.generatedClient->retrievesAListOfFulfillmentOrdersAssignedToTheShopLocationsThatAreOwnedByTheApp(self.apiVersion, headers, queries);
    }

    # Sends a cancellation request
    #
    # + return - Sends a cancellation request to the fulfillment service of a fulfillment order and updates the fulfillment order / Sends a cancellation request to the fulfillment service of a fulfillment order and updates the fulfillment order 
    remote isolated function sendsACancellationRequest(string fulfillmentOrderId, FulfillmentOrderIdCancellationRequestJsonBody payload, map<string|string[]> headers = {}) returns FulfillmentOrder|error {
        return check self.generatedClient->sendsACancellationRequest(self.apiVersion, fulfillmentOrderId, payload, headers);
    }

    # Accepts a cancellation request
    #
    # + return - Accepts a cancellation request sent to a fulfillment service and updates the fulfillment order / Accepts a cancellation request sent to a fulfillment service and updates the fulfillment order 
    remote isolated function acceptsACancellationRequest(string fulfillmentOrderId, CancellationRequestAcceptJsonBody payload, map<string|string[]> headers = {}) returns CancellationResponse|error {
        return check self.generatedClient->acceptsACancellationRequest(self.apiVersion, fulfillmentOrderId, payload, headers);
    }

    # Rejects a cancellation request
    #
    # + return - Rejects a cancellation request sent to a fulfillment service and updates the fulfillment order / Rejects a cancellation request sent to a fulfillment service and updates the fulfillment order 
    remote isolated function rejectsACancellationRequest(string fulfillmentOrderId, CancellationRequestRejectJsonBody payload, map<string|string[]> headers = {}) returns RejectCancellationRequestResponse|error {
        return check self.generatedClient->rejectsACancellationRequest(self.apiVersion, fulfillmentOrderId, payload, headers);
    }

    # Retrieves a list of carrier services
    #
    # + return - Retrieve a list of carrier services / Retrieve a list of carrier services 
    remote isolated function retrievesAListOfCarrierServices(string? xShopifyAccessToken = (), map<string|string[]> headers = {}) returns CarrierServiceList|error {
        return check self.generatedClient->retrievesAListOfCarrierServices(self.apiVersion, headers);
    }

    # Creates a carrier service
    #
    # + return - Create a carrier service / Create a carrier service 
    remote isolated function createsACarrierService(ApiVersionCarrierServicesJsonBody payload, map<string|string[]> headers = {}) returns CreateCarrierService|error {
        return check self.generatedClient->createsACarrierService(self.apiVersion, payload, headers);
    }

    # Retrieves a single carrier service
    #
    # + return - Retrieve a single carrier service / Retrieve a single carrier service 
    remote isolated function retrievesASingleCarrierService(string carrierServiceId, map<string|string[]> headers = {}) returns SingleCarrierService|error {
        return check self.generatedClient->retrievesASingleCarrierService(self.apiVersion, carrierServiceId, headers);
    }

    # Modify an existing CarrierService
    #
    # + return - Update a carrier service / Update a carrier service 
    remote isolated function modifyAnExistingCarrierservice(string carrierServiceId, CarrierServicescarrierServiceIdJsonBody payload, map<string|string[]> headers = {}) returns UpdateCarrierService|error {
        return check self.generatedClient->modifyAnExistingCarrierservice(self.apiVersion, carrierServiceId, payload, headers);
    }

    # Deletes a carrier service
    #
    # + return - Delete a carrier service / Delete a carrier service 
    remote isolated function deletesACarrierService(string carrierServiceId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->deletesACarrierService(self.apiVersion, carrierServiceId, payload, headers);
    }

    # Creates a fulfillment for one or many fulfillment orders
    #
    # + return - Create a fulfillment for the fulfillment order line items specified / Creates a fulfillment for all fulfillment order line items if `fulfillment_order_line_items` is left blank / Create a fulfillment for the fulfillment order line items specified / Creates a fulfillment for all fulfillment order line items if `fulfillment_order_line_items` is left blank 
    remote isolated function createsAFulfillmentForOneOrManyFulfillmentOrders(CreateOrderFulfillment payload, map<string|string[]> headers = {}) returns CreateFulfillmentOrder|error {
        return check self.generatedClient->createsAFulfillmentForOneOrManyFulfillmentOrders(self.apiVersion, payload, headers);
    }

    # Cancels a fulfillment
    #
    # + return - Cancel a fulfillment / Cancel a fulfillment 
    remote isolated function cancelsAFulfillment(string fulfillmentId, record {} payload, map<string|string[]> headers = {}) returns CancelFulfillment|error {
        return check self.generatedClient->cancelsAFulfillment(self.apiVersion, fulfillmentId, payload, headers);
    }

    # Updates the tracking information for a fulfillment
    #
    # + return - Update the tracking information for a fulfillment / Update the tracking information for a fulfillment 
    remote isolated function updatesTheTrackingInformationForAFulfillment(string fulfillmentId, FulfillmentIdUpdateTrackingJsonBody payload, map<string|string[]> headers = {}) returns Fulfillment|error {
        return check self.generatedClient->updatesTheTrackingInformationForAFulfillment(self.apiVersion, fulfillmentId, payload, headers);
    }

    # Retrieves fulfillments associated with a fulfillment order
    #
    # + fulfillment_order_id - The ID of the fulfillment order that is associated with the fulfillments. 
    # + return - Retrieve a list of all fulfillments for a fulfillment order / Retrieve a list of all fulfillments for a fulfillment order 
    remote isolated function retrievesFulfillmentsAssociatedWithAFulfillmentOrder(map<string|string[]> headers = {}, *RetrievesFulfillmentsAssociatedWithAFulfillmentOrderQueries queries) returns FulfillmentList|error {
        return check self.generatedClient->retrievesFulfillmentsAssociatedWithAFulfillmentOrder(self.apiVersion, headers, queries);
    }

    # Retrieves fulfillments associated with an order
    #
    # + created_at_max - Show fulfillments created before date (format: 2014-04-25T16:15:47-04:00). 
    # + created_at_min - Show fulfillments created after date (format: 2014-04-25T16:15:47-04:00). 
    # + fields - A comma-separated list of fields to include in the response. 
    # + 'limit - Limit the amount of results.(default: 50)(maximum: 250) 
    # + since_id - Restrict results to after the specified ID. 
    # + updated_at_max - Show fulfillments last updated before date (format: 2014-04-25T16:15:47-04:00). 
    # + updated_at_min - Show fulfillments last updated after date (format: 2014-04-25T16:15:47-04:00). 
    # + return - Retrieve a list of all fulfillments for an order / Retrieve all fulfillments after the specified ID / Retrieve a list of all fulfillments for an order / Retrieve all fulfillments after the specified ID 
    remote isolated function retrievesFulfillmentsAssociatedWithAnOrder(string orderId, map<string|string[]> headers = {}, *RetrievesFulfillmentsAssociatedWithAnOrderQueries queries) returns FulfillmentListForOrder|error {
        return check self.generatedClient->retrievesFulfillmentsAssociatedWithAnOrder(self.apiVersion, orderId, headers, queries);
    }

    # Receive a single Fulfillment
    #
    # + fields - Comma-separated list of fields to include in the response. 
    # + return - Retrieve a specific fulfillment / Retrieve a specific fulfillment 
    remote isolated function receiveASingleFulfillment(string orderId, string fulfillmentId, map<string|string[]> headers = {}, *ReceiveASingleFulfillmentQueries queries) returns SingleFulfillment|error {
        return check self.generatedClient->receiveASingleFulfillment(self.apiVersion, orderId, fulfillmentId, headers, queries);
    }

    # Retrieves a count of fulfillments associated with a specific order
    #
    # + created_at_min - Count fulfillments created after date (format: 2014-04-25T16:15:47-04:00). 
    # + created_at_max - Count fulfillments created before date (format: 2014-04-25T16:15:47-04:00). 
    # + updated_at_min - Count fulfillments last updated after date (format: 2014-04-25T16:15:47-04:00). 
    # + updated_at_max - Count fulfillments last updated before date (format: 2014-04-25T16:15:47-04:00). 
    # + return - Count the total number of fulfillments for an order / Count the total number of fulfillments for an order 
    remote isolated function retrievesACountOfFulfillmentsAssociatedWithASpecificOrder(string orderId, map<string|string[]> headers = {}, *RetrievesACountOfFulfillmentsAssociatedWithASpecificOrderQueries queries) returns ObjectCount|error {
        return check self.generatedClient->retrievesACountOfFulfillmentsAssociatedWithASpecificOrder(self.apiVersion, orderId, headers, queries);
    }

    # Retrieves a list of fulfillment events for a specific fulfillment
    #
    # + fulfillment_id - The ID of the fulfillment that\'s associated with the fulfillment event. 
    # + order_id - The ID of the order that\'s associated with the fulfillment event. 
    # + return - Retrieve a list of all the fulfillment events that are associated with a specific fulfillment / Retrieve a list of all the fulfillment events that are associated with a specific fulfillment 
    remote isolated function retrievesAListOfFulfillmentEventsForASpecificFulfillment(map<string|string[]> headers = {}, *RetrievesAListOfFulfillmentEventsForASpecificFulfillmentQueries queries) returns FulfillmentEvents|error {
        return check self.generatedClient->retrievesAListOfFulfillmentEventsForASpecificFulfillment(self.apiVersion, headers, queries);
    }

    # Creates a fulfillment event
    #
    # + return - Create a fulfillment event / Create a fulfillment event 
    remote isolated function createsAFulfillmentEvent(string orderId, string fulfillmentId, FulfillmentIdEventsJsonBody payload, map<string|string[]> headers = {}) returns CreateFulfillmentEvent|error {
        return check self.generatedClient->createsAFulfillmentEvent(self.apiVersion, orderId, fulfillmentId, payload, headers);
    }

    # Retrieves a specific fulfillment event
    #
    # + event_id - The ID of the fulfillment event. 
    # + return - Retrieve a specific fulfillment event / Retrieve a specific fulfillment event 
    remote isolated function retrievesASpecificFulfillmentEvent(string orderId, string fulfillmentId, map<string|string[]> headers = {}, *RetrievesASpecificFulfillmentEventQueries queries) returns FulfillmentEventResponse|error {
        return check self.generatedClient->retrievesASpecificFulfillmentEvent(self.apiVersion, orderId, fulfillmentId, headers, queries);
    }

    # Deletes a fulfillment event
    #
    # + return - Delete a fulfillment event / Delete a fulfillment event 
    remote isolated function deletesAFulfillmentEvent(string orderId, string fulfillmentId, string eventId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->deletesAFulfillmentEvent(self.apiVersion, orderId, fulfillmentId, eventId, payload, headers);
    }

    # Cancel a fulfillment order
    #
    # + return - Cancel a fulfillment order / Cancel a fulfillment order 
    remote isolated function cancelAFulfillmentOrder(string fulfillmentOrderId, FulfillmentOrderIdCancelJsonBody payload, map<string|string[]> headers = {}) returns CancelFulfillmentOrder|error {
        return check self.generatedClient->cancelAFulfillmentOrder(self.apiVersion, fulfillmentOrderId, payload, headers);
    }

    # Marks a fulfillment order as incomplete
    #
    # + return - Transition a fulfillment order from in progress to incomplete / Transition a fulfillment order from in progress to incomplete 
    remote isolated function marksAFulfillmentOrderAsIncomplete(string fulfillmentOrderId, FulfillmentOrderIdCloseJsonBody payload, map<string|string[]> headers = {}) returns TransitionFulfillmentOrder|error {
        return check self.generatedClient->marksAFulfillmentOrderAsIncomplete(self.apiVersion, fulfillmentOrderId, payload, headers);
    }

    # Applies a fulfillment hold on an open fulfillment order
    #
    # + return - Move a fulfillment order to a new location / Move a fulfillment order to a new location 
    remote isolated function appliesAFulfillmentHoldOnAnOpenFulfillmentOrder(string fulfillmentOrderId, FulfillmentOrderIdHoldJsonBody payload, map<string|string[]> headers = {}) returns MoveFulfillmentOrderResponse|error {
        return check self.generatedClient->appliesAFulfillmentHoldOnAnOpenFulfillmentOrder(self.apiVersion, fulfillmentOrderId, payload, headers);
    }

    # Moves a fulfillment order to a new location
    #
    # + return - Move a fulfillment order to a new location / Move a fulfillment order to a new location 
    remote isolated function movesAFulfillmentOrderToANewLocation(string fulfillmentOrderId, FulfillmentOrderIdMoveJsonBody payload, map<string|string[]> headers = {}) returns MoveFulfillmentOrderResponse|error {
        return check self.generatedClient->movesAFulfillmentOrderToANewLocation(self.apiVersion, fulfillmentOrderId, payload, headers);
    }

    # Marks the fulfillment order as open
    #
    # + return - Move a fulfillment order to a new location / Move a fulfillment order to a new location 
    remote isolated function marksTheFulfillmentOrderAsOpen(string fulfillmentOrderId, FulfillmentOrderIdOpenJsonBody payload, map<string|string[]> headers = {}) returns MoveFulfillmentOrderResponse|error {
        return check self.generatedClient->marksTheFulfillmentOrderAsOpen(self.apiVersion, fulfillmentOrderId, payload, headers);
    }

    # Releases the fulfillment hold on a fulfillment order
    #
    # + return - Move a fulfillment order to a new location / Move a fulfillment order to a new location 
    remote isolated function releasesTheFulfillmentHoldOnAFulfillmentOrder(string fulfillmentOrderId, FulfillmentOrderIdReleaseHoldJsonBody payload, map<string|string[]> headers = {}) returns MoveFulfillmentOrderResponse|error {
        return check self.generatedClient->releasesTheFulfillmentHoldOnAFulfillmentOrder(self.apiVersion, fulfillmentOrderId, payload, headers);
    }

    # Reschedules the fulfill_at time of a scheduled fulfillment order
    #
    # + return - Move a fulfillment order to a new location / Move a fulfillment order to a new location 
    remote isolated function reschedulesTheFulfillAtTimeOfAScheduledFulfillmentOrder(string fulfillmentOrderId, FulfillmentOrderIdRescheduleJsonBody payload, map<string|string[]> headers = {}) returns MoveFulfillmentOrderResponse|error {
        return check self.generatedClient->reschedulesTheFulfillAtTimeOfAScheduledFulfillmentOrder(self.apiVersion, fulfillmentOrderId, payload, headers);
    }

    # Sets deadline for fulfillment orders
    #
    # + return - Move a fulfillment order to a new location / Move a fulfillment order to a new location 
    remote isolated function setsDeadlineForFulfillmentOrders(FulfillmentOrdersSetFulfillmentOrdersDeadlineJsonBody payload, map<string|string[]> headers = {}) returns MoveFulfillmentOrderResponse|error {
        return check self.generatedClient->setsDeadlineForFulfillmentOrders(self.apiVersion, payload, headers);
    }

    # Retrieves a specific fulfillment order
    #
    # + return - Get a single fulfillment order by its ID / Get a single fulfillment order by its ID 
    remote isolated function retrievesASpecificFulfillmentOrder(string fulfillmentOrderId, map<string|string[]> headers = {}) returns SingleFulfillmentOrder|error {
        return check self.generatedClient->retrievesASpecificFulfillmentOrder(self.apiVersion, fulfillmentOrderId, headers);
    }

    # Retrieves a list of fulfillment orders for a specific order
    #
    # + order_id - The ID of the order that is associated with the fulfillment orders. 
    # + return - Retrieve a list of all fulfillment orders for an order / Retrieve a list of all fulfillment orders for an order 
    remote isolated function retrievesAListOfFulfillmentOrdersForASpecificOrder(map<string|string[]> headers = {}, *RetrievesAListOfFulfillmentOrdersForASpecificOrderQueries queries) returns FulfillmentOrdersList|error {
        return check self.generatedClient->retrievesAListOfFulfillmentOrdersForASpecificOrder(self.apiVersion, headers, queries);
    }

    # Sends a fulfillment request
    #
    # + return - Sends a fulfillment request to the fulfillment service of a fulfillment order for the specified line items / Sends a fulfillment request to the fulfillment service for all line items on the fulfillment order if fulfillment_order_line_items is left blank / Sends a fulfillment request to the fulfillment service of a fulfillment order for the specified line items / Sends a fulfillment request to the fulfillment service for all line items on the fulfillment order if fulfillment_order_line_items is left blank 
    remote isolated function sendsAFulfillmentRequest(string fulfillmentOrderId, FulfillmentOrderIdFulfillmentRequestJsonBody payload, map<string|string[]> headers = {}) returns OriginalFulfillmentOrder|error {
        return check self.generatedClient->sendsAFulfillmentRequest(self.apiVersion, fulfillmentOrderId, payload, headers);
    }

    # Accepts a fulfillment request
    #
    # + return - Accepts a fulfillment request sent to a fulfillment service and updates the fulfillment order / Accepts a fulfillment request sent to a fulfillment service and updates the fulfillment order 
    remote isolated function acceptsAFulfillmentRequest(string fulfillmentOrderId, FulfillmentRequestAcceptJsonBody payload, map<string|string[]> headers = {}) returns AcceptFulfillmentResponse|error {
        return check self.generatedClient->acceptsAFulfillmentRequest(self.apiVersion, fulfillmentOrderId, payload, headers);
    }

    # Rejects a fulfillment request
    #
    # + return - Rejects a fulfillment request sent to a fulfillment service and updates the fulfillment order / Rejects a fulfillment request sent to a fulfillment service and updates the fulfillment order 
    remote isolated function rejectsAFulfillmentRequest(string fulfillmentOrderId, FulfillmentRequestRejectJsonBody payload, map<string|string[]> headers = {}) returns RejectFulfillmentResponse|error {
        return check self.generatedClient->rejectsAFulfillmentRequest(self.apiVersion, fulfillmentOrderId, payload, headers);
    }

    # Receive a list of all FulfillmentServices
    #
    # + return - List your app's fulfillment services / List all of the shop's fulfillment services / List your app's fulfillment services / List all of the shop's fulfillment services 
    remote isolated function receiveAListOfAllFulfillmentservices(map<string|string[]> headers = {}, *ReceiveAListOfAllFulfillmentservicesQueries queries) returns FulfillmentServicesList|error {
        return check self.generatedClient->receiveAListOfAllFulfillmentservices(self.apiVersion, headers, queries);
    }

    # Create a new FulfillmentService
    #
    # + return - Create a fulfillment service / Create a fulfillment service 
    remote isolated function createANewFulfillmentservice(ApiVersionFulfillmentServicesJsonBody payload, map<string|string[]> headers = {}) returns CreateFulfillmentService|error {
        return check self.generatedClient->createANewFulfillmentservice(self.apiVersion, payload, headers);
    }

    # Receive a single FulfillmentService
    #
    # + return - Get a single fulfillment service by its ID / Get a single fulfillment service by its ID 
    remote isolated function receiveASingleFulfillmentservice(string fulfillmentServiceId, map<string|string[]> headers = {}) returns SingleFulfillmentService|error {
        return check self.generatedClient->receiveASingleFulfillmentservice(self.apiVersion, fulfillmentServiceId, headers);
    }

    # Modify an existing FulfillmentService
    #
    # + return - Update a fulfillment service / Update a fulfillment service 
    remote isolated function modifyAnExistingFulfillmentservice(string fulfillmentServiceId, FulfillmentServicesfulfillmentServiceIdJsonBody payload, map<string|string[]> headers = {}) returns UpdateFulfillmentService|error {
        return check self.generatedClient->modifyAnExistingFulfillmentservice(self.apiVersion, fulfillmentServiceId, payload, headers);
    }

    # Remove an existing FulfillmentService
    #
    # + return - Destroy a fulfillment service / Destroy a fulfillment service 
    remote isolated function removeAnExistingFulfillmentservice(string fulfillmentServiceId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->removeAnExistingFulfillmentservice(self.apiVersion, fulfillmentServiceId, payload, headers);
    }

    # Retrieves a list of locations that a fulfillment order can potentially move to.
    #
    # + fulfillment_order_id - The ID of the fulfillment order. 
    # + return - Retrieve a list of locations that a fulfillment order can potentially move to. / Retrieve a list of locations that a fulfillment order can potentially move to. 
    remote isolated function retrievesAListOfLocationsThatAFulfillmentOrderCanPotentiallyMoveTo(map<string|string[]> headers = {}, *RetrievesAListOfLocationsThatAFulfillmentOrderCanPotentiallyMoveToQueries queries) returns LocationsList|error {
        return check self.generatedClient->retrievesAListOfLocationsThatAFulfillmentOrderCanPotentiallyMoveTo(self.apiVersion, headers, queries);
    }

    # Return the current balance
    #
    # + return - Retrieves the account's current balance. / Retrieves the account's current balance. 
    remote isolated function returnTheCurrentBalance(string? xShopifyAccessToken = (), map<string|string[]> headers = {}) returns AccountCurrentBalance|error {
        return check self.generatedClient->returnTheCurrentBalance(self.apiVersion, headers);
    }

    # Return a list of all disputes
    #
    # + since_id - Return only disputes after the specified ID. 
    # + last_id - Return only disputes before the specified ID. 
    # + status - Return only disputes with the specified status. 
    # + initiated_at - Return only disputes with the specified `initiated_at` date ([ISO 8601][1] format). 
    # [1]: https://en.wikipedia.org/wiki/ISO_8601
    # + return - Retrieve all disputes ordered newest to oldest / Retrieve all won disputes / Retrieve all disputes initiated on 2013-05-03 / Retrieve all disputes ordered newest to oldest / Retrieve all won disputes / Retrieve all disputes initiated on 2013-05-03 
    remote isolated function returnAListOfAllDisputes(map<string|string[]> headers = {}, *ReturnAListOfAllDisputesQueries queries) returns Disputes|error {
        return check self.generatedClient->returnAListOfAllDisputes(self.apiVersion, headers, queries);
    }

    # Return a single dispute
    #
    # + return - Retrieves a single dispute by ID / Retrieves a single dispute by ID 
    remote isolated function returnASingleDispute(string disputeId, map<string|string[]> headers = {}) returns SingleDispute|error {
        return check self.generatedClient->returnASingleDispute(self.apiVersion, disputeId, headers);
    }

    # Returns evidence associated with the dispute
    #
    # + return - Returns evidence associated with the dispute 
    remote isolated function returnsEvidenceAssociatedWithTheDispute(string disputeId, map<string|string[]> headers = {}) returns DisputeEvidenceResponse|error {
        return check self.generatedClient->returnsEvidenceAssociatedWithTheDispute(self.apiVersion, disputeId, headers);
    }

    # Updates dispute evidence associated with the dispute ID.
    #
    # + return - Updates dispute evidence associated with the dispute ID 
    remote isolated function returnsEvidenceAssociatedWithTheDisputeCopy(string disputeId, DisputeIdDisputeEvidencesJsonBody payload, map<string|string[]> headers = {}) returns DisputeEvidenceResponse|error {
        return check self.generatedClient->returnsEvidenceAssociatedWithTheDisputeCopy(self.apiVersion, disputeId, payload, headers);
    }

    # Upload a file to a dispute
    #
    # + return - Upload a file to a dispute 
    remote isolated function uploadAFileToADispute(string disputeId, DisputeIdDisputeFileUploadsJsonBody payload, map<string|string[]> headers = {}) returns DisputeFileUpload|error {
        return check self.generatedClient->uploadAFileToADispute(self.apiVersion, disputeId, payload, headers);
    }

    # Delete a dispute evidence file
    #
    remote isolated function deleteADisputeEvidenceFile(string disputeId, string disputeFileUploadId, map<string|string[]> headers = {}) returns error? {
        return check self.generatedClient->deleteADisputeEvidenceFile(self.apiVersion, disputeId, disputeFileUploadId, headers);
    }

    # Return a list of all payouts
    #
    # + since_id - Filter response to payouts exclusively after the specified ID. 
    # + last_id - Filter response to payouts exclusively before the specified ID 
    # + date_min - Filter response to payouts inclusively after the specified date. 
    # + date_max - Filter response to payouts inclusively before the specified date. 
    # + date - Filter response to payouts on the specified date. 
    # + status - Filter response to payouts with the specified status 
    # + return - List all payouts up to a specific date / List all payouts ordered newest to oldest / List all payouts up to a specific date / List all payouts ordered newest to oldest 
    remote isolated function returnAListOfAllPayouts(map<string|string[]> headers = {}, *ReturnAListOfAllPayoutsQueries queries) returns PayoutsList|error {
        return check self.generatedClient->returnAListOfAllPayouts(self.apiVersion, headers, queries);
    }

    # Return a single payout
    #
    # + return - Retrieves a single payout by id. / Retrieves a single payout by id. 
    remote isolated function returnASinglePayout(string payoutId, map<string|string[]> headers = {}) returns SinglePayout|error {
        return check self.generatedClient->returnASinglePayout(self.apiVersion, payoutId, headers);
    }

    # Return a list of all balance transactions
    #
    # + since_id - Filter response to transactions exclusively after the specified ID. 
    # + last_id - Filter response to transactions exclusively before the specified ID 
    # + test - Filter response to transactions placed in test mode. 
    # + payout_id - Filter response to transactions paid out in the specified payout. 
    # + payout_status - Filter response to transactions with the specified payout status 
    # + return - List all transactions associated with a payout. / List all transactions associated with a payout. 
    remote isolated function returnAListOfAllBalanceTransactions(map<string|string[]> headers = {}, *ReturnAListOfAllBalanceTransactionsQueries queries) returns TransactionsListForPayout|error {
        return check self.generatedClient->returnAListOfAllBalanceTransactions(self.apiVersion, headers, queries);
    }

    # Receive a list of all Countries
    #
    # + since_id - Restrict results to after the specified ID. 
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - Retrieve all countries after the specified ID / Retrieve all countries / Retrieve all countries after the specified ID / Retrieve all countries 
    remote isolated function receiveAListOfAllCountries(map<string|string[]> headers = {}, *ReceiveAListOfAllCountriesQueries queries) returns CountriesList|error {
        return check self.generatedClient->receiveAListOfAllCountries(self.apiVersion, headers, queries);
    }

    # Creates a country
    #
    # + return - Create a country using a custom tax rate  / Create a country using Shopify's tax rate for it / Create a country using a custom tax rate  / Create a country using Shopify's tax rate for it 
    remote isolated function createsACountry(ApiVersionCountriesJsonBody payload, map<string|string[]> headers = {}) returns CreateCountry|error {
        return check self.generatedClient->createsACountry(self.apiVersion, payload, headers);
    }

    # Retrieves a specific county
    #
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - Retrieve a specific country by its ID / Retrieve a specific country by its ID 
    remote isolated function retrievesASpecificCounty(string countryId, map<string|string[]> headers = {}, *RetrievesASpecificCountyQueries queries) returns CountryResponse|error {
        return check self.generatedClient->retrievesASpecificCounty(self.apiVersion, countryId, headers, queries);
    }

    # Updates an existing country
    #
    # + return - Update a country's tax rate / Update a country's tax rate 
    remote isolated function updatesAnExistingCountry(string countryId, CountriescountryIdJsonBody payload, map<string|string[]> headers = {}) returns UpdateCountryTaxRate|error {
        return check self.generatedClient->updatesAnExistingCountry(self.apiVersion, countryId, payload, headers);
    }

    # Remove an existing Country
    #
    # + return - Delete a country / Delete a country 
    remote isolated function removeAnExistingCountry(string countryId, string payload, map<string|string[]> headers = {}) returns record{}|error {
        return check self.generatedClient->removeAnExistingCountry(self.apiVersion, countryId, payload, headers);
    }

    # Retrieves a count of countries
    #
    # + return - Count all countries / Count all countries 
    remote isolated function retrievesACountOfCountries(string? xShopifyAccessToken = (), map<string|string[]> headers = {}) returns CountriesCount|error {
        return check self.generatedClient->retrievesACountOfCountries(self.apiVersion, headers);
    }

    # Retrieves a list of currencies enabled on a shop
    #
    # + return - Retrieve a list of currencies enabled on a shop / Retrieve a list of currencies enabled on a shop 
    remote isolated function retrievesAListOfCurrenciesEnabledOnAShop(string? xShopifyAccessToken = (), map<string|string[]> headers = {}) returns CurrenciesList|error {
        return check self.generatedClient->retrievesAListOfCurrenciesEnabledOnAShop(self.apiVersion, headers);
    }

    # Retrieves a list of the shop's policies
    #
    # + return - Retrieve a list of the shop's policies / Retrieve a list of the shop's policies 
    remote isolated function retrievesAListOfTheShopSPolicies(string? xShopifyAccessToken = (), map<string|string[]> headers = {}) returns ShopPoliciesList|error {
        return check self.generatedClient->retrievesAListOfTheShopSPolicies(self.apiVersion, headers);
    }

    # Retrieves a list of provinces for a country
    #
    # + since_id - Restrict results to after the specified ID. 
    # + fields - Show only certain fields, specified by a comma-separated list of fields names. 
    # + return - Retrieve all provinces for a country / Retrieve all provinces for a country after the specified ID / Retrieve all provinces for a country / Retrieve all provinces for a country after the specified ID 
    remote isolated function retrievesAListOfProvincesForACountry(string countryId, map<string|string[]> headers = {}, *RetrievesAListOfProvincesForACountryQueries queries) returns ProvincesList|error {
        return check self.generatedClient->retrievesAListOfProvincesForACountry(self.apiVersion, countryId, headers);
    }

    # Retrieves a single province for a country
    #
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - Retrieve a single province / Retrieve a single province 
    remote isolated function retrievesASingleProvinceForACountry(string countryId, string provinceId, map<string|string[]> headers = {}, *RetrievesASingleProvinceForACountryQueries queries) returns SingleProvince|error {
        return check self.generatedClient->retrievesASingleProvinceForACountry(self.apiVersion, countryId, provinceId, headers, queries);
    }

    # Updates an existing province for a country
    #
    # + return - Update a province's tax rate / Update a province's tax rate 
    remote isolated function updatesAnExistingProvinceForACountry(string countryId, string provinceId, ProvincesprovinceIdJsonBody payload, map<string|string[]> headers = {}) returns UpdateProvinceResponse|error {
        return check self.generatedClient->updatesAnExistingProvinceForACountry(self.apiVersion, countryId, provinceId, payload, headers);
    }

    # Retrieves a count of provinces for a country
    #
    # + return - Count all provinces / Count all provinces 
    remote isolated function retrievesACountOfProvincesForACountry(string countryId, map<string|string[]> headers = {}) returns ProvincesCount|error {
        return check self.generatedClient->retrievesACountOfProvincesForACountry(self.apiVersion, countryId, headers);
    }

    # Receive a list of all ShippingZones
    #
    # + fields - Show only specific fields by providing a comma-separated list of field names.
    remote isolated function receiveAListOfAllShippingzones(map<string|string[]> headers = {}, *ReceiveAListOfAllShippingzonesQueries queries) returns ShippingZonesList|error {
        return check self.generatedClient->receiveAListOfAllShippingzones(self.apiVersion, headers, queries);
    }

    # Retrieves the shop's configuration
    #
    # + fields - A comma-separated list of fields to include in the response. 
    # + return - Retrieve the shop's configuration / Retrieve the shop's configuration 
    remote isolated function retrievesTheShopSConfiguration(map<string|string[]> headers = {}, *RetrievesTheShopSConfigurationQueries queries) returns ShopConfigurations|error {
        return check self.generatedClient->retrievesTheShopSConfiguration(self.apiVersion, headers, queries);
    }

    # Retrieves a list of tender transactions
    #
    # + 'limit - The maximum number of results to retrieve.(default: 50)(maximum: 250) 
    # + since_id - Retrieve only transactions after the specified ID. 
    # + processed_at_min - Show tender transactions processed\_at or after the specified date. 
    # + processed_at_max - Show tender transactions processed\_at or before the specified date. 
    # + processed_at - Show tender transactions processed at the specified date. 
    # + 'order - Show tender transactions ordered by processed\_at in ascending or descending order. 
    # + return - Retrieve tender transactions processed_at the specified date / Retrieve tender transactions after the specified ID / Retrieve tender transactions ordered by <code>processed_at</code> / Retrieve tender transactions processed_at or after the specified date / Retrieve all tender transactions / Retrieve tender transactions processed_at or before the specified date / Retrieve tender transactions processed_at the specified date / Retrieve tender transactions after the specified ID / Retrieve tender transactions ordered by <code>processed_at</code> / Retrieve tender transactions processed_at or after the specified date / Retrieve all tender transactions / Retrieve tender transactions processed_at or before the specified date 
    remote isolated function retrievesAListOfTenderTransactions(map<string|string[]> headers = {}, *RetrievesAListOfTenderTransactionsQueries queries) returns TenderTransactions|error {
        return check self.generatedClient->retrievesAListOfTenderTransactions(self.apiVersion, headers, queries);
    }

    # Retrieves a list of webhooks
    #
    # + address - Retrieve webhook subscriptions that send the POST request to this URI. 
    # + created_at_max - Retrieve webhook subscriptions that were created before a given date and time (format: 2014-04-25T16:15:47-04:00). 
    # + created_at_min - Retrieve webhook subscriptions that were created after a given date and time (format: 2014-04-25T16:15:47-04:00). 
    # + fields - Comma-separated list of the properties you want returned for each item in the result list. Use this parameter to restrict the returned list of items to only those properties you specify. 
    # + 'limit - Maximum number of webhook subscriptions that should be returned. Setting this parameter outside the maximum range will return an error.(default: 50)(maximum: 250) 
    # + since_id - Restrict the returned list to webhook subscriptions whose id is greater than the specified since\_id. 
    # + topic - Show webhook subscriptions with a given topic. For a list of valid values, refer to the [`topic` property](#topic-property-).> 
    # + updated_at_min - Retrieve webhooks that were updated before a given date and time (format: 2014-04-25T16:15:47-04:00). 
    # + updated_at_max - Retrieve webhooks that were updated after a given date and time (format: 2014-04-25T16:15:47-04:00). 
    # + return - Retrieve a list of all webhook subscriptions for your shop / Retrieve a list of all webhook subscriptions for your shop after a specified <code>id</code> / Retrieve a list of all webhook subscriptions for your shop / Retrieve a list of all webhook subscriptions for your shop after a specified <code>id</code> 
    remote isolated function retrievesAListOfWebhooks(map<string|string[]> headers = {}, *RetrievesAListOfWebhooksQueries queries) returns SubscriptionsList|error {
        return check self.generatedClient->retrievesAListOfWebhooks(self.apiVersion, headers, queries);
    }

    # Create a new Webhook
    #
    # + return - Subscribe to order creation webhooks / Subscribe to order creation webhooks 
    remote isolated function createANewWebhook(CreateWebhook payload, map<string|string[]> headers = {}) returns SubscribeOrderCreation|error {
        return check self.generatedClient->createANewWebhook(self.apiVersion, payload, headers);
    }

    # Receive a single Webhook
    #
    # + fields - Comma-separated list of the properties you want returned for each item in the result list. Use this parameter to restrict the returned list of items to only those properties you specify. 
    # + return - Retrieve a single webhook by its <code>id</code> / Retrieve a single webhook by its <code>id</code> 
    remote isolated function receiveASingleWebhook(string webhookId, map<string|string[]> headers = {}, *ReceiveASingleWebhookQueries queries) returns SingleWebhook|error {
        return check self.generatedClient->receiveASingleWebhook(self.apiVersion, webhookId, headers, queries);
    }

    # Modify an existing Webhook
    #
    # + return - Update a webhook subscription so that it POSTs to a different address / Update a webhook subscription so that it POSTs to a different address 
    remote isolated function modifyAnExistingWebhook(string webhookId, UpdateWebhook payload, map<string|string[]> headers = {}) returns WebhookObject|error {
        return check self.generatedClient->modifyAnExistingWebhook(self.apiVersion, webhookId, payload, headers);
    }

    # Remove an existing Webhook
    #
    # + return - Delete an existing webhook from a shop / Delete an existing webhook from a shop 
    remote isolated function removeAnExistingWebhook(string webhookId, string payload, map<string|string[]> headers = {}) returns record {}|error {
        return check self.generatedClient->removeAnExistingWebhook(self.apiVersion, webhookId, payload, headers);
    }

    # Receive a count of all Webhooks
    #
    # + address - Retrieve webhook subscriptions that send the POST request to this URI. 
    # + topic - Show webhook subscriptions with a given topic. For a list of valid values, refer to the [`topic` property](#topic-property-).> 
    # + return - Count all of the webhook subscriptions for the topic <code>orders/create</code> / Count all of the webhook subscriptions for your shop / Count all of the webhook subscriptions for the topic <code>orders/create</code> / Count all of the webhook subscriptions for your shop 
    remote isolated function receiveACountOfAllWebhooks(map<string|string[]> headers = {}, *ReceiveACountOfAllWebhooksQueries queries) returns ObjectCount|error {
        return check self.generatedClient->receiveACountOfAllWebhooks(self.apiVersion, headers, queries);
    }

    # Retrieves a list of reports
    #
    # + fields - A comma-separated list of fields to include in the response.
    # + ids - A comma-separated list of report IDs.
    # + 'limit - The amount of results to return.
    # + since_id - Restrict results to after the specified ID.
    # + updated_at_max - Show reports last updated before date. (format: 2014-04-25T16:15:47-04:00)
    # + updated_at_min - Show reports last updated after date. (format: 2014-04-25T16:15:47-04:00)
    # + return - Retrieves a list of reports 
    remote isolated function retrievesAListOfReports(map<string|string[]> headers = {}, *RetrievesAListOfReportsQueries queries) returns ReportList|error {
        return check self.generatedClient->retrievesAListOfReports(self.apiVersion, headers, queries);
    }

    # Creates a new report
    #
    # + return - Creates a new report 
    remote isolated function createsANewReport(ApiVersionReportsJsonBody payload, map<string|string[]> headers = {}) returns ReportResponse|error {
        return check self.generatedClient->createsANewReport(self.apiVersion, payload, headers);
    }

    # Retrieves a single report
    #
    # + fields - A comma-separated list of fields to include in the response.
    # + return - Retrieves a single report 
    remote isolated function retrievesASingleReport(string reportId, map<string|string[]> headers = {}, *RetrievesASingleReportQueries queries) returns SingleReportResponse|error {
        return check self.generatedClient->retrievesASingleReport(self.apiVersion, reportId, headers, queries);
    }

    # Updates a report
    #
    # + return - Updates a report 
    remote isolated function updatesAReport(string reportId, ReportsreportIdJsonBody payload, map<string|string[]> headers = {}) returns UpdateReportResponse|error {
        return check self.generatedClient->updatesAReport(self.apiVersion, reportId, payload, headers);
    }

    # Deletes a report
    #
    # + return - Deletes a report 
    remote isolated function deletesAReport(string reportId, string payload, map<string|string[]> headers = {}) returns record {}|error {
        return check self.generatedClient->deletesAReport(self.apiVersion, reportId, payload, headers);
    }

    # Counts the number of payments attempted on a checkout
    #
    # + return - Retrieve the number of payments on a checkout 
    remote isolated function countsTheNumberOfPaymentsAttemptedOnACheckout(string token, map<string|string[]> headers = {}) returns ObjectCount|error {
        return check self.generatedClient->countsTheNumberOfPaymentsAttemptedOnACheckout(self.apiVersion, token, headers);
    }
}
