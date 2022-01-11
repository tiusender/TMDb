import APIClient
import Mocker
@testable import TMDb
import XCTest

final class TMDbCertificationServiceTests: XCTestCase {

    var service: TMDbCertificationService!

    override func setUp() {
        super.setUp()
        service = TMDbCertificationService(apiClient: .mock)
    }

    override func tearDown() {
        service = nil
        super.tearDown()
    }

    func testMovieCertificationsReturnsMovieCertifications() async throws {
        let url = URL(string: "https://tmdb.com/certification/movie/list")!
        let data = try! Data(fromResource: "certifications", withExtension: "json")
        Mock(url: url, dataType: .json, statusCode: 200, data: [
            .get: data
        ]).register()
        let expectedResult = Certification.mocks

        let result = try await service.movieCertifications()

        XCTAssertEqual(result, expectedResult)
    }

    func testTVShowCertificationsReturnsTVShowCertifications() async throws {
        let url = URL(string: "https://tmdb.com/certification/tv/list")!
        Mock(url: url, dataType: .json, statusCode: 200, data: [
            .get: try! .init(fromResource: "certifications", withExtension: "json")
        ]).register()
        let expectedResult = Certification.mocks

        let result = try await service.tvShowCertifications()

        XCTAssertEqual(result, expectedResult)
    }

}
