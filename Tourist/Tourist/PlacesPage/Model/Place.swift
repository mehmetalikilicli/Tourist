
import Foundation

// MARK: - Place
struct Place: Codable {
    let type: String?
    let features: [Feature]?
}

// MARK: - Feature
struct Feature: Codable {
    let type: FeatureType?
    let properties: Properties?
    let geometry: Geometry?
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: GeometryType?
    let coordinates: [Double]?
}

enum GeometryType: String, Codable {
    case point = "Point"
}

// MARK: - Properties
struct Properties: Codable {
    let name: String?
    let country: Country?
    let countryCode: CountryCode?
    let state: State?
    let county, city: City?
    let town: Town?
    let postcode, suburb, street: String?
    let lon, lat: Double?
    let formatted, addressLine1, addressLine2: String?
    let categories: [Category]?
    let details: [Detail]?
    let datasource: Datasource?
    let distance: Int?
    let placeID, quarter, district: String?

    enum CodingKeys: String, CodingKey {
        case name, country
        case countryCode
        case state, county, city, town, postcode, suburb, street, lon, lat, formatted
        case addressLine1
        case addressLine2
        case categories, details, datasource, distance
        case placeID
        case quarter, district
    }
}

enum Category: String, Codable {
    case commercialHealthAndBeauty = "commercial.health_and_beauty"
    case commercialHealthAndBeautyPharmacy = "commercial.health_and_beauty.pharmacy"
    case healthcare = "healthcare"
    case healthcarePharmacy = "healthcare.pharmacy"
}

enum City: String, Codable {
    case beyoğlu = "Beyoğlu"
    case istanbul = "Istanbul"
}

enum Country: String, Codable {
    case turkey = "Turkey"
}

enum CountryCode: String, Codable {
    case tr = "tr"
}

// MARK: - Datasource
struct Datasource: Codable {
    let sourcename: Sourcename?
    let attribution: Attribution?
    let license: License?
    let url: String?
    let raw: Raw?
}

enum Attribution: String, Codable {
    case openStreetMapContributors = "© OpenStreetMap contributors"
}

enum License: String, Codable {
    case openDatabaseLicence = "Open Database Licence"
}

// MARK: - Raw
struct Raw: Codable {
    let name, phone: String?
    let osmID: Int?
    let amenity: Amenity?
    let osmType: OsmType?
    let addrCity: City?
    let healthcare: Amenity?
    let addrStreet: String?
    let addrDistrict: Town?
    let nameAr, description, rawOperator, emergency: String?

    enum CodingKeys: String, CodingKey {
        case name, phone
        case osmID
        case amenity
        case osmType
        case addrCity
        case healthcare
        case addrStreet
        case addrDistrict
        case nameAr
        case description
        case rawOperator
        case emergency
    }
}

enum Town: String, Codable {
    case fatih = "Fatih"
}

enum Amenity: String, Codable {
    case pharmacy = "pharmacy"
}

enum OsmType: String, Codable {
    case n = "n"
}

enum Sourcename: String, Codable {
    case openstreetmap = "openstreetmap"
}

enum Detail: String, Codable {
    case details = "details"
    case detailsContact = "details.contact"
}

enum State: String, Codable {
    case marmaraRegion = "Marmara Region"
}

enum FeatureType: String, Codable {
    case feature = "Feature"
}
