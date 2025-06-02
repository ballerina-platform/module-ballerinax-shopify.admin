# Ballerina Shopify admin connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-shopify.admin/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-shopify.admin/actions/workflows/ci.yml)
[![Trivy](https://github.com/ballerina-platform/module-ballerinax-shopify.admin/actions/workflows/trivy-scan.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-shopify.admin/actions/workflows/trivy-scan.yml)
[![GraalVM Check](https://github.com/ballerina-platform/module-ballerinax-shopify.admin/actions/workflows/build-with-bal-test-graalvm.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-shopify.admin/actions/workflows/build-with-bal-test-graalvm.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-shopify.admin.svg)](https://github.com/ballerina-platform/module-ballerinax-shopify.admin/commits/master)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/shopify.admin.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%shopify.admin)

## Overview

[Shopify](https://www.shopify.com) is a leading e-commerce platform that enables users to create, manage, and grow their online stores, offering secure transactions, inventory management, and seamless integrations.

The Ballerina Shopify admin connector allows developers to interact with the [Shopify Admin REST APIs](https://shopify.dev/docs/api/admin-rest). It provides an easy-to-use interface for managing products, orders, customers, and other essential e-commerce functionalities. The module supports Shopify API versions up to the `2025-01` release.

## Setup guide

Follow these steps to generate an access token for Shopify Admin APIs using the Ballerina Shopify connector.

### 1. Sign up for a Shopify developer account

1. Create a Shopify account via the [Shopify signup portal](https://accounts.shopify.com/signup).

   ![Signup](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify.admin/refs/heads/main/docs/resources/signup-page.png)

2. Join the [Shopify partner program](https://www.shopify.com/partners) to access development tools.

   ![Partner program](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify.admin/refs/heads/main/docs/resources/partner-page.png)  

### 2. Create a new organization

   ![New organization](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify.admin/refs/heads/main/docs/resources/new-organization.png)  

In the Shopify partner dashboard, you can either connect to an existing organization or create a new one. If you don’t already have an organization, follow these steps to create one.

* Follow the on-screen instructions and provide the necessary details.

   ![Main focus](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify.admin/refs/heads/main/docs/resources/main-focus-as-shopify-partner.png)

* Provide business contact details and finalize the setup.

   ![Business contact info](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify.admin/refs/heads/main/docs/resources/business-contact-information.png)  

### 3. Create a development store

1. In the [Shopify partner dashboard](https://partners.shopify.com/), select **Create a new store**.

   ![Create store](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify.admin/refs/heads/main/docs/resources/build-new-store.png)

2. Enter store details and assign a unique store name.

   ![Store details](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify.admin/refs/heads/main/docs/resources/create-development-store.png)  

3. Select the appropriate account type for your development needs.

   ![Choose account type](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify.admin/refs/heads/main/docs/resources/choose-account.png)  

4. Complete the store setup by following the instructions. You can customize store settings as needed.

   ![Setup store](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify.admin/refs/heads/main/docs/resources/setup-shopify.admin-store.png)  

### 4. Create a new app

To start developing on your store, you need to create an app.

1. Under **App and sales channels** in settings, select **Develop apps**.

   ![Apps & sales](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify.admin/refs/heads/main/docs/resources/apps-and-sales-channel.png)

2. Select **Allow custom app development**.

   ![Develop apps](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify.admin/refs/heads/main/docs/resources/develop-apps.png)  

3. Click **Create an app**, enter an app name, and confirm.

   ![Create app](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify.admin/refs/heads/main/docs/resources/create-app.png)  

### 5. Generate an access token

1. Once the app is created, select **Configure Admin API scopes** and apply the necessary scopes for your REST APIs.

   ![Configure API scopes](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify.admin/refs/heads/main/docs/resources/configure-admin-api-scopes.png)  

2. Click **Install app** to generate an Admin API access token.

   ![Add access token](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify.admin/refs/heads/main/docs/resources/add-access-token.png)

3. Click **Reveal token once** to copy and save the token securely. This token will be required for authentication when using the Ballerina Shopify connector.

   ![Reveal token](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-shopify.admin/refs/heads/main/docs/resources/reveal-access-token.png)  

Your development store is now ready, and you can integrate it with Shopify using the Ballerina Shopify connector.

## Quickstart

To use the Shopify connector in your Ballerina project, modify the `.bal` file as follows.

### Step 1: Import the module

Import the `ballerinax/shopify.admin` module into your Ballerina project.

```ballerina
import ballerinax/shopify.admin as shopadmin;
```

### Step 2: Instantiate a new connector

Create a `shopadmin:Client` instance with necessary configurations.

```ballerina
configurable string apiVersion = ?;
configurable string accessToken = ?;
configurable string serviceUrl = ?;

shopadmin:Client shopify = check new (config = {
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
   shopadmin:CreateCustomer payload = {
      customer: {
         first_name: "Steve",
         last_name: "Lastnameson",
         email: "steve.lastnameson@example.com"
      }
   };
   shopadmin:CustomerResponse result = check shopify->createsACustomer(payload);
}
```

### Step 4: Run the Ballerina application

Use the following command to compile and run the Ballerina program.

```bash
bal run
```

## Examples

The `ballerinax/shopify.admin` connector provides practical examples illustrating usage in various scenarios.

1. [Create new order](https://github.com/ballerina-platform/module-ballerinax-shopify.admin/tree/main/examples/create-orders) : This is a guide to use the Shopify connector to connect to a Shopify store, register a customer, and place an order.

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 17. You can download it from either of the following sources:

    - [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    - [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

- For more information go to the [`shopify.admin` package](https://central.ballerina.io/ballerinax/shopify.admin/latest).
- For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
- Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
- Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
