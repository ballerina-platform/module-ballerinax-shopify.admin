_Author_:  @Nuvindu \
_Created_: 2025/03/21 \
_Updated_: 2025/03/21 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from Shopify.
The OpenAPI specification is obtained from a [Postman API collection for Shopify REST APIs](https://www.postman.com/muchisx/public/collection/ksm0zco/shopify-admin-rest).
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

1. Fix return types in API responses

    The OpenAPI specification often defines response structures incorrectly, leading to generate improper return types. For example, the response definition in the original specification is often as follows. This structure results in an incorrect return type of `error?`, which does not align with the actual behavior of Shopify REST APIs.

    ```json
        "responses": {
            "200": {
                "description": ""
            }
        }
    ```

    To resolve this, the relevant response types were updated based on [Shopify official API documentation](https://shopify.dev/docs/api/admin-rest).

    ```json
        "responses" : {
            "201" : {
                "content" : {
                    "application/json" : {
                        "schema" : {
                            "$ref" : "#/components/schemas/CustomerResponse"
                        }
                    }
                }
            },
            "422" : {
                "content" : {
                    "application/json" : {
                        "schema" : {
                            "$ref" : "#/components/schemas/InlineResponse4223"
                        }
                    }
                }
            }
        }
    ```

2. Fix request payload definitions

    The request body definitions in the OpenAPI specification lacks proper schema references, leading to incorrect payload types. For example, the request body is often defined as below.

    ```json
        "requestBody" : {
            "content": {
                "application/json": {}
                "schema": {}
            }
        }
    ```

    This results in a generated payload type of `record{}`, which does not accurately reflect the expected request format. The request body definitions were updated to use appropriate schema references, according to the official documentation.

    ```json
        "requestBody" : {
            "content" : {
                "application/json" : {
                    "schema" : {
                        "$ref" : "#/components/schemas/CreateCustomer"
                    }
                }
            }
        }
    ```

3. Improve method naming conventions

    The remote methods are usually generated from the `operationId` fields, but they contain unclear and inconsistent names which make it difficult to understand the functionality of each methods. For example, the specification contains `operationId` values as below which do not clearly convey the purpose of the method.

    ```json
        {
            "operationId": "deprecated_202001_get_customers"
        }
    ```

    They were then updated to more meaningful names that reflect the actual functionalities.

    ```json
        {
            "operationId" : "retrievesAListOfCustomers"
        }
    ```

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/openapi.json --mode client --license docs/license.txt -o ballerina
```

Note: The license year is hardcoded to 2025, change if necessary.
