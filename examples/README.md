# Examples

The `ballerinax/shopify` connector provides practical examples illustrating usage in various scenarios.

1. [Create new order](https://github.com/ballerina-platform/module-ballerinax-shopify/tree/main/examples/create-orders) : This is a guide to use the Shopify connector to connect to a Shopify store, register a customer, and place an order.

## Prerequisites

1. Generate HubSpot credentials to authenticate the connector as described in the [Setup guide](https://github.com/ballerina-platform/module-ballerinax-shopify/blob/main/README.md#setup-guide).

2. For each example, create a `Config.toml` file the related configuration. Here's an example of how your `Config.toml` file should look:

    ```toml
    apiVersion = <API_VERSION>
    accessToken = <ACCESS_TOKEN>
    serviceUrl = <SERVICE_URL>
    ```

## Running an example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the examples with the local module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
