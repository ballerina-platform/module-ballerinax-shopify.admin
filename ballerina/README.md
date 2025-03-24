## Overview

[Shopify](https://www.shopify.com) is a leading e-commerce platform that enables users to create, manage, and grow their online stores, offering secure transactions, inventory management, and seamless integrations.

The Ballerina Shopify connector allows developers to interact with the [Shopify Admin REST APIs](https://shopify.dev/docs/api/admin-rest). It provides an easy-to-use interface for managing products, orders, customers, and other essential e-commerce functionalities. The module supports Shopify API versions up to the `2025-01` release.

## Setup guide

Follow these steps to generate an access token for Shopify Admin APIs using the Ballerina Shopify connector.

### 1. Sign up for a Shopify developer account

1. Create a Shopify account via the [Shopify signup portal](https://accounts.shopify.com/signup).

   ![Signup](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify/refs/heads/main/docs/resources/signup-page.png)

2. Join the [Shopify partner program](https://www.shopify.com/partners) to access development tools.

   ![Partner program](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify/refs/heads/main/docs/resources/partner-page.png)  

### 2. Create a new organization

In the Shopify partner dashboard, you can either connect to an existing organization or create a new one. If you don’t already have an organization, follow these steps to create one.

   ![New organization](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify/refs/heads/main/docs/resources/new-organization.png)  

* Follow the on-screen instructions and provide the necessary details.

   ![Main focus](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify/refs/heads/main/docs/resources/main-focus-as-shopify-partner.png)

* Provide business contact details and finalize the setup.

   ![Business contact info](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify/refs/heads/main/docs/resources/business-contact-information.png)  

### 3. Create a development store

1. In the [Shopify partner dashboard](https://partners.shopify.com/), select **Create a new store**.

   ![Create store](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify/refs/heads/main/docs/resources/build-new-store.png)

2. Enter store details and assign a unique store name.

   ![Store details](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify/refs/heads/main/docs/resources/create-development-store.png)  

3. Select the appropriate account type for your development needs.

   ![Choose account type](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify/refs/heads/main/docs/resources/choose-account.png)  

4. Complete the store setup by following the instructions. You can customize store settings as needed.

   ![Setup store](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify/refs/heads/main/docs/resources/setup-shopify-store.png)  

### 4. Create a new app

To start developing on your store, you need to create an app.

1. Under **App and sales channels** in settings, select **Develop apps**.

   ![Apps & sales](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify/refs/heads/main/docs/resources/apps-and-sales-channel.png)

2. Select **Allow custom app development**.

   ![Develop apps](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify/refs/heads/main/docs/resources/develop-apps.png)  

3. Click **Create an app**, enter an app name, and confirm.

   ![Create app](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify/refs/heads/main/docs/resources/create-app.png)  

### 5. Generate an access token

1. Once the app is created, select **Configure Admin API scopes** and apply the necessary scopes for your REST APIs.

   ![Configure API scopes](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify/refs/heads/main/docs/resources/configure-admin-api-scopes.png)  

2. Click **Install app** to generate an Admin API access token.

   ![Add access token](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify/refs/heads/main/docs/resources/add-access-token.png)

3. Click **Reveal token once** to copy and save the token securely. This token will be required for authentication when using the Ballerina Shopify connector.

   ![Reveal token](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify/refs/heads/main/docs/resources/reveal-access-token.png)  

Your development store is now ready, and you can integrate it with Shopify using the Ballerina Shopify connector.

## Quickstart

To use the Shopify connector in your Ballerina project, modify the `.bal` file as follows.

### Step 1: Import the module

Import the `ballerinax/shopify` module into your Ballerina project.

```ballerina
import ballerinax/shopify;
```

### Step 2: Instantiate a new connector

Create a `shopify:Client` instance with necessary configurations.

```ballerina
configurable string apiVersion = ?;
configurable string accessToken = ?;
configurable string serviceUrl = ?;

shopify:Client shopify = check new (config = {
    followRedirects: {
        enabled: true
    },
    apiVersion,
    auth: {
        token: accessToken
    }
}, serviceUrl);
```

### Step 3: Invoke the connector operation

You can now utilize the operations available within the connector.

```ballerina
public function main() returns error? {
   shopify:CreateCustomer payload = {
      customer: {
         first_name: "Steve",
         last_name: "Lastnameson",
         email: "steve.lastnameson@example.com"
      }
   };
   shopify:CustomerResponse result = check shopify->createsACustomer(payload);
}
```

### Step 4: Run the Ballerina application

Use the following command to compile and run the Ballerina program.

```bash
bal run
```

## Examples

The `ballerinax/shopify` connector provides practical examples illustrating usage in various scenarios.

1. [Create new order](https://github.com/ballerina-platform/module-ballerinax-shopify/tree/main/examples/create-orders) : This is a guide to use the Shopify connector to connect to a Shopify store, register a customer, and place an order.
