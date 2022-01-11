import Foundation

final class TMDbDiscoverService: DiscoverService {

    private let apiClient: APIClientOld

    init(apiClient: APIClientOld = TMDbAPIClient.shared) {
        self.apiClient = apiClient
    }

    func movies(sortedBy: MovieSort?, withPeople people: [Person.ID]?, page: Int?) async throws -> MoviePageableList {
        try await apiClient.get(endpoint: DiscoverEndpoint.movies(sortedBy: sortedBy, people: people, page: page))
    }

    func tvShows(sortedBy: TVShowSort?, page: Int?) async throws -> TVShowPageableList {
        try await apiClient.get(endpoint: DiscoverEndpoint.tvShows(sortedBy: sortedBy, page: page))
    }

}
