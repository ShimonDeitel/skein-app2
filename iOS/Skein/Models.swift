import Foundation

struct Skein: Identifiable, Codable, Equatable {
    let id: UUID
    var createdAt: Date
    var colorway: String
    var fiber: String
    var weight: String
    var yardage: Double
    var dyeLot: String
    var notes: String

    init(id: UUID = UUID(), createdAt: Date = Date(), colorway: String = "", fiber: String = "", weight: String = "", yardage: Double = 0, dyeLot: String = "", notes: String = "") {
        self.id = id
        self.createdAt = createdAt
        self.colorway = colorway
        self.fiber = fiber
        self.weight = weight
        self.yardage = yardage
        self.dyeLot = dyeLot
        self.notes = notes
    }
}
