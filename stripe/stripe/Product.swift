

import Foundation

struct Product: Identifiable, Codable {
    let id: UUID
    let name: String
    let price: Int // grosze
}
