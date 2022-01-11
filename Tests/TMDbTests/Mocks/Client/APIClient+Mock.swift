import APIClient
import Foundation
import Mocker
@testable import TMDb

extension APIClient {

    static let mockAPIKey = "qwerty123"

    static var mock: APIClient {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.protocolClasses = [MockingURLProtocol.self]

        let conf = Configuration(host: "tmdb.com", sessionConfiguration: sessionConfiguration, decoder: .tmdb)

        return APIClient(configuration: conf)
    }

}
