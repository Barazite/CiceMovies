// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let applePodcastsServerModel = try? newJSONDecoder().decode(ApplePodcastsServerModel.self, from: jsonData)

import Foundation

// MARK: - ApplePodcastsServerModel
struct ApplePodcastsServerModel: Codable {
    let feed: PodcastFeed?

    enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }
}

// MARK: - Feed
struct PodcastFeed: Codable {
    let title: String?
    let id: String?
    let author: PodcastAuthor?
    let links: [PodcastLink]?
    let copyright: String?
    let country: String?
    let icon: String?
    let updated: String?
    let results: [ResultPodcast]?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case id = "id"
        case author = "author"
        case links = "links"
        case copyright = "copyright"
        case country = "country"
        case icon = "icon"
        case updated = "updated"
        case results = "results"
    }
}

// MARK: - Author
struct PodcastAuthor: Codable {
    let name: String?
    let uri: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case uri = "uri"
    }
}

// MARK: - Link
struct PodcastLink: Codable, Identifiable {
    var id = UUID()
    let linkSelf: String?
    let alternate: String?

    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
        case alternate = "alternate"
    }
}

// MARK: - Result
struct ResultPodcast: Codable, Identifiable {
    let artistName: String?
    let id: String?
    let releaseDate: String?
    let name: String?
    let kind: PodcastKind?
    let artistID: String?
    let artistURL: String?
    let artworkUrl100: String?
    let genres: [PodcastGenre]?
    let url: String?
    let copyright: String?

    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case id = "id"
        case releaseDate = "releaseDate"
        case name = "name"
        case kind = "kind"
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100 = "artworkUrl100"
        case genres = "genres"
        case url = "url"
        case copyright = "copyright"
    }
}

// MARK: - Genre
struct PodcastGenre: Codable {
    let genreID: String?
    let name: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name = "name"
        case url = "url"
    }
}

enum PodcastKind: String, Codable {
    case podcast = "podcast"
}
