import APIClient
import Foundation

final class TMDbAPIClientDelegate: APIClientDelegate {

    static var apiKey: String = ""

    static func setAPIKey(_ apiKey: String) {
        Self.apiKey = apiKey
    }

    func client(_ client: APIClient, willSendRequest request: inout URLRequest) {
        request.url = request.url?
            .appendingAPIKey(Self.apiKey)
            .appendingLanguage()
    }

}
