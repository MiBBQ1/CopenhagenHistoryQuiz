import AVFoundation

final class Player: NSObject, AVAudioPlayerDelegate {
    static let shared = Player()
    
    private var audioPlayer: AVAudioPlayer?
    private var lps: [String] = ["01GypsyDance.mp3",
                                 "02BrdreMegetLangtHerfra.mp3",
                                 "03BrothersVeryFarAway.mp3",
                                 "04SkadaAttAmerika.mp3",
                                 "05DetDendeBarn.mp3",
                                 "06DuGamleMne.mp3",
                                 "07HilsFraOsDerhjemme.mp3",
                                 "08HilsFraMigDerhjemme.mp3",
                                 "09LilleSommerfugl.mp3",
                                 "10SovDukke-lise.mp3"
    ]
    
    override init() {
        super.init()
    }
    
    func loadUserDefaults() {
        if CopenDa.isMusic {
            playRandomLp()
        }
    }
    func checkState() {
        if CopenDa.isMusic {
            playRandomLp()
        }
        else {
            stop()
        }
    }
    func playRandomLp() {
        guard let randomSong = lps.randomElement() else { return }
        
        let url = Bundle.main.url(forResource: randomSong, withExtension: nil)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer?.delegate = self
            audioPlayer?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            playRandomLp()
        }
    }
    
    func stop() {
        audioPlayer?.stop()
    }
}
