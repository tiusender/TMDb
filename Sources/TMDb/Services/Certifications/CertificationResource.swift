import APIClient
import Foundation

struct CertificationsResource {

    static var movie: CertificationsResource {
        CertificationsResource(path: "\(basePath)/movie")
    }

    static var tvShow: CertificationsResource {
        CertificationsResource(path: "\(basePath)/tv")
    }

    private static let basePath = "/certification"
    private let path: String

    var get: Request<Certifications> {
        .get("\(path)/list")
    }

}
