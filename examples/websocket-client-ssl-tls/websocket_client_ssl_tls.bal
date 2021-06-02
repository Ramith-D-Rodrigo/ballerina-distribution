import ballerina/websocket;
import ballerina/io;

public function main() returns error? {
    // An WebSocket client can be configured to communicate through WSS as well.
    // To secure a client using TLS/SSL, the client needs to be configured with
    // a certificate file of the listener.
    // The [`websocket:ClientSecureSocket`](https://docs.central.ballerina.io/ballerina/websocket/latest/records/ClientSecureSocket) record
    // provides the SSL-related configurations of the client.
    websocket:Client wssClient = check new("wss://localhost:9090/basic/wss",
        secureSocket = {
            cert: "../resource/path/to/public.crt"
        }
    );
    check wssClient->writeTextMessage("Hello");
    string textResp = check wssClient->readTextMessage();
    io:println(textResp);
}
