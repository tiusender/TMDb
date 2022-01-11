import APIClient
import Foundation

final class TMDbCertificationService: CertificationService {

    private let apiClient: APIClient

    init(apiClient: APIClient = .prod) {
        self.apiClient = apiClient
    }

    func movieCertifications() async throws -> [String: [Certification]] {
        try await apiClient.value(for: CertificationsResource.movie.get).certifications
    }

    func tvShowCertifications() async throws -> [String: [Certification]] {
        try await apiClient.value(for: CertificationsResource.tvShow.get).certifications
    }

}
