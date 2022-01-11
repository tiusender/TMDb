import Mocker
@testable import TMDb
import XCTest

final class TMDbConfigurationServiceTests: XCTestCase {

    var service: TMDbConfigurationService!

    override func setUp() {
        super.setUp()
        service = TMDbConfigurationService(apiClient: .mock)
    }

    override func tearDown() {
        service = nil
        super.tearDown()
    }

    func testAPIConfigurationReturnsAPIConfiguration() async throws {
        let url = URL(string: "https://tmdb.com/configuration")!
        let data = try! Data(fromResource: "configuration", withExtension: "json")
        Mock(url: url, dataType: .json, statusCode: 200, data: [
            .get: data
        ]).register()
        let expectedResult = APIConfiguration.mock

        let result = try await service.apiConfiguration()

        XCTAssertEqual(result, expectedResult)
    }

}
