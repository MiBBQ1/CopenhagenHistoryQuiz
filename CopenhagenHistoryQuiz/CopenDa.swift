import UIKit

@propertyWrapper
struct CopenDaWrap<T: Codable> {
    let key: String
    let defaultValue: T
    
    var wrappedValue: T {
        get {
            guard let data = UserDefaults.standard.data(forKey: key) else { return defaultValue }
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    mutating func reset() {
        wrappedValue = defaultValue
    }
}

final class CopenDa {
    @CopenDaWrap(key: "openLevels", defaultValue: ["guessPerson" : [true, false, false, false, false, false, false, false, false, false],
                                                    "guessYear" : [true, false, false, false, false, false, false, false, false, false],
                                                    "quiz" : [true, false, false, false, false, false, false, false, false, false]])
    static var openLevels: [String: [Bool]]
    
    @CopenDaWrap(key: "startForLevels", defaultValue: ["guessPerson" : [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                                                        "guessYear" :   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                                                        "quiz" :        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                                                       ])
    static var startForLevels: [String: [Int]]
    
    @CopenDaWrap(key: "needOnboard", defaultValue: true)
    static var needOnboard: Bool
    
    @CopenDaWrap(key: "isVibro", defaultValue: true)
    static var isVibro: Bool
    
    @CopenDaWrap(key: "isMusic", defaultValue: true)
    static var isMusic: Bool
    
    @CopenDaWrap(key: "isSound", defaultValue: true)
    static var isSound: Bool
    
    static func restartData() {
        _isVibro.reset()
        _isMusic.reset()
        _isSound.reset()
        _openLevels.reset()
        _startForLevels.reset()
    }
}
