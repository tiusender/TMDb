import APIClient
import Foundation

final class TMDbConfigurationService: ConfigurationService {

    private let apiClient: APIClient

    init(apiClient: APIClient = APIClient.prod) {
        self.apiClient = apiClient
    }

    func apiConfiguration() async throws -> APIConfiguration {
        try await apiClient.value(for: ConfigurationResource.get)
    }

}
