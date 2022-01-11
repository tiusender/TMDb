import Foundation

extension JSONDecoder {

    static var tmdb: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(.theMovieDatabase)
        return decoder
    }

}
