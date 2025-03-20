
import shopify.oas;

isolated function getOasConnectionConfig(ConnectionConfig config) returns oas:ConnectionConfig => {
    httpVersion: config.httpVersion,
    http1Settings: config.http1Settings,
    http2Settings: config.http2Settings,
    timeout: config.timeout,
    forwarded: config.forwarded,
    poolConfig: config.poolConfig,
    cache: config.cache,
    circuitBreaker: config.circuitBreaker,
    compression: config.compression,
    retryConfig: config.retryConfig,
    responseLimits: config.responseLimits,
    secureSocket: config.secureSocket,
    proxy: config.proxy,
    validation: config.validation,
    followRedirects: config.followRedirects
};
