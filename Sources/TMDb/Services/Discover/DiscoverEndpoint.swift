import APIClient
import Foundation

enum DiscoverEndpoint {

    static let basePath = URL(string: "/discover")!

    case movies(sortedBy: MovieSort? = nil, people: [Person.ID]? = nil, page: Int? = nil)
    case tvShows(sortedBy: TVShowSort? = nil, page: Int? = nil)

}

extension DiscoverEndpoint: Endpoint {

    var url: URL {
        switch self {
        case .movies(let sortedBy, let people, let page):
            return Self.basePath
                .appendingPathComponent("movie")
                .appendingSortBy(sortedBy)
                .appendingWithPeople(people)
                .appendingPage(page)

        case .tvShows(let sortedBy, let page):
            return Self.basePath
                .appendingPathComponent("tv")
                .appendingSortBy(sortedBy)
                .appendingPage(page)
        }
    }

}

struct DiscoverResource {

    static func movies(sortedBy: MovieSort? = nil, people: [Person.ID]? = nil,
                       page: Int? = nil) -> MoviesDiscoverResource {
        MoviesDiscoverResource(path: "/discover/movie", sortedBy: sortedBy, people: people, page: page)
    }

}

extension DiscoverResource {

    struct MoviesDiscoverResource {
        let path: String
        let sortedBy: MovieSort?
        let people: [Person.ID]?
        let page: Int?

        var get: Request<MoviePageableList> {
            .get(path, query: [
                "sort_by": sortedBy,
                "with_people": people?.map(String.init).joined(separator: ",")
            ])
        }

    }

}
