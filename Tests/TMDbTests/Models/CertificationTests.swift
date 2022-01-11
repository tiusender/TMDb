@testable import TMDb
import XCTest

final class CertificationTests: XCTestCase {

    func testIDReturnsCode() {
        let certification = Certification(
            code: "15",
            meaning: "Some meaning.",
            order: 1
        )

        XCTAssertEqual(certification.id, certification.code)
    }

}
