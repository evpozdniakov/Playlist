import Foundation

class DataModel: NSObject {
    var allItems = [String]()
    var playlistItems = [Int]()

    override init() {
        super.init()

        for i in 0...200 {
            allItems.append("Record # \(i)")
        }
    }
}