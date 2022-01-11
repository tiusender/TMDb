import APIClient
import Foundation

struct ConfigurationResource {

    static var get: Request<APIConfiguration> {
        .get("/configuration")
    }

}
