import APIClient
import Foundation

extension APIClient {

    static let prod: APIClient = APIClient(configuration: tmdbConfiguration)

    private static let tmdbConfiguration: Configuration = {
        Configuration(host: "api.themoviedb.org", basePath: "/3", decoder: .tmdb,
                      clientDelegate: TMDbAPIClientDelegate())
    }()

}
