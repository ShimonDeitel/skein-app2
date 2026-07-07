import Foundation
import Combine

@MainActor
final class Store: ObservableObject {
    @Published var items: [Skein] = []
    @Published var isPro: Bool = false

    static let freeLimit = 8

    private let fileURL: URL = {
        let dir = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        return dir.appendingPathComponent("skein_items.json")
    }()

    init() {
        load()
    }

    var canAddMore: Bool {
        isPro || items.count < Store.freeLimit
    }

    func add(_ item: Skein) {
        items.insert(item, at: 0)
        save()
    }

    func update(_ item: Skein) {
        guard let idx = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[idx] = item
        save()
    }

    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        save()
    }

    func delete(_ item: Skein) {
        items.removeAll { $0.id == item.id }
        save()
    }

    private func load() {
        if let data = try? Data(contentsOf: fileURL),
           let decoded = try? JSONDecoder().decode([Skein].self, from: data) {
            items = decoded
        } else {
            items = Store.seedData
        }
    }

    func save() {
        if let data = try? JSONEncoder().encode(items) {
            try? data.write(to: fileURL, options: .atomic)
        }
    }

    static let seedData: [Skein] = [
        Skein(colorway: "Colorway 1", fiber: "Fiber 1", weight: "Weight 1", yardage: 10.0, dyeLot: "Dyelot 1", notes: "Notes 1"),
        Skein(colorway: "Colorway 2", fiber: "Fiber 2", weight: "Weight 2", yardage: 20.0, dyeLot: "Dyelot 2", notes: "Notes 2"),
        Skein(colorway: "Colorway 3", fiber: "Fiber 3", weight: "Weight 3", yardage: 30.0, dyeLot: "Dyelot 3", notes: "Notes 3")
    ]
}
