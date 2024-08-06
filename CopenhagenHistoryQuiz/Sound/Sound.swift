import AVFoundation

final class Sound: NSObject {
    static func correct() {
        guard CopenDa.isSound else { return }
        if let soundURL = Bundle.main.url(forResource: "correct", withExtension: "wav") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            AudioServicesPlaySystemSound(mySound)
        }
    }
    static func horrorlose() {
        guard CopenDa.isSound else { return }
        if let soundURL = Bundle.main.url(forResource: "horrorlose", withExtension: "wav") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            AudioServicesPlaySystemSound(mySound)
        }
    }
    static func fanfare() {
        guard CopenDa.isSound else { return }
        if let soundURL = Bundle.main.url(forResource: "fanfare", withExtension: "mp3") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            AudioServicesPlaySystemSound(mySound)
        }
    }
    static func metalHit() {
        guard CopenDa.isSound else { return }
        if let soundURL = Bundle.main.url(forResource: "metalHit", withExtension: "mp3") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            AudioServicesPlaySystemSound(mySound)
        }
    }
}


