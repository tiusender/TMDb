import Foundation

extension URL {

    func appendingPathComponent(_ value: Int) -> Self {
        appendingPathComponent(String(value))
    }

    func appendingQueryItem(name: String, value: CustomStringConvertible) -> Self {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)!
        var queryItems = urlComponents.queryItems ?? []
        queryItems.append(URLQueryItem(name: name, value: value.description))
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }

}

extension URL {

    func appendingAPIKey(_ apiKey: String) -> Self {
        appendingQueryItem(name: "api_key", value: apiKey)
    }

    func appendingLanguage(locale: Locale = .current) -> Self {
        var parts = [String]()
        if let languageCode = locale.languageCode {
            parts.append(languageCode)

            if let regionCode = locale.regionCode {
                parts.append(regionCode)
            }
        }

        guard !parts.isEmpty else {
            return self
        }

        return appendingLanguage(parts.joined(separator: "-"))
    }

    func appendingLanguage(_ language: String) -> Self {
        return appendingQueryItem(name: "language", value: language)
    }

    func appendingPage(_ page: Int?) -> Self {
        guard var page = page else {
            return self
        }

        page = max(page, 1)
        page = min(page, 1000)

        return appendingQueryItem(name: "page", value: page)
    }

    func appendingYear(_ year: Int?) -> Self {
        guard let year = year else {
            return self
        }

        return appendingQueryItem(name: "year", value: year)
    }

    func appendingFirstAirDateYear(_ year: Int?) -> Self {
        guard let year = year else {
            return self
        }

        return appendingQueryItem(name: "first_air_date_year", value: year)
    }

    func appendingWithPeople(_ people: [Person.ID]?) -> Self {
        guard let people = people else {
            return self
        }

        let value = people
            .map(String.init)
            .joined(separator: ",")

        return appendingQueryItem(name: "with_people", value: value)
    }

}
