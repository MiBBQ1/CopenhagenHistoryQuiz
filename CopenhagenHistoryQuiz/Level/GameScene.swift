import SpriteKit

protocol QuizeSceneDelegate: AnyObject {
    func dismisMe()
}

final class GameScene: SKScene {
    var currentLevel = 1
    var currentQuestion = 0
    var lives = 3
    let maxLives = 3
    var numberOfQuestions = 5
    var questions: [WonderPeople] = []
    var portraits: [SKSpriteNode] = []
    var butons: [SKSpriteNode] = []
    var heartNodes: [SKSpriteNode] = []
    var questionLabel: SKLabelNode!
    var progressLabel: SKLabelNode!
    var deleg: QuizeSceneDelegate?
    var state = 0
    var gameType: GameType!
    var resultNode: GameResultNode!
    
    private func setupBackground() {
        let background = SKSpriteNode(imageNamed: "helmBg")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.zPosition = -10
        background.size = size
        addChild(background)
    }
    
    override func didMove(to view: SKView) {
        numberOfQuestions += currentLevel
        setupUI()
        setupQuestions()
        showNextQuestion()
        setupBackground()
    }
    
    func setupUI() {
        // Setup question label
        questionLabel = SKLabelNode(fontNamed: "Inika-Bold")
        questionLabel.fontSize = 17
        questionLabel.fontColor = SKColor.white
        questionLabel.position = CGPoint(x: size.width / 2, y: size.height - 180)
        addChild(questionLabel)
        
        // Setup progress label
        progressLabel = SKLabelNode(fontNamed: "Inika-Bold")
        progressLabel.fontSize = 18
        progressLabel.fontColor = SKColor.white
        progressLabel.position = CGPoint(x: size.width - 60, y: size.height - 80)
        addChild(progressLabel)
        
        for i in 0..<maxLives {
            let heart = SKSpriteNode(imageNamed: "helmet")
            heart.size = CGSize(width: 35, height: 30)
            heart.position = CGPoint(x: 30 + CGFloat(i) * 40, y: 50)
            heartNodes.append(heart)
            addChild(heart)
        }
    }
    
    func setupQuestions() {
        questions = dataStr.wonderPeopleList
    }
    
    func showNextQuestion() {
        if currentQuestion >= numberOfQuestions {
            if CopenDa.openLevels.count > currentLevel + 1 {
                if gameType == .guessPerson {
                    CopenDa.openLevels["guessPerson"]![currentLevel + 1] = true
                    if  CopenDa.startForLevels["guessPerson"]![currentLevel] < lives {
                        CopenDa.startForLevels["guessPerson"]![currentLevel] = lives
                    }
                }
                else if gameType == .guessYear {
                    CopenDa.openLevels["guessYear"]![currentLevel + 1] = true
                    if  CopenDa.startForLevels["guessYear"]![currentLevel] < lives {
                        CopenDa.startForLevels["guessYear"]![currentLevel] = lives
                    }
                }
                Sound.fanfare()
                startVibrationMedium()
                resultNode = GameResultNode(isWin: true, starCount: lives, size: self.size)
                resultNode.alpha = 0
                addChild(resultNode)
                resultNode.run(SKAction.fadeIn(withDuration: 0.3))
            }
            return
        }
        state = 0
        let question = questions[currentQuestion]
        questionLabel.text = "Where is \(question.name)?"
        progressLabel.text = "Question \(currentQuestion + 1)/\(numberOfQuestions)"
        
        // Show portraits
        showPortraits(for: question)
    }
    
    func showPortraits(for question: WonderPeople) {
        butons.forEach { button in
            button.run(SKAction.sequence([
                SKAction.fadeOut(withDuration: 0.3),
                SKAction.run {
                    button.removeFromParent()
                }
            ]))
        }
        
        butons.removeAll()
        
        
        // Randomly select portraits for display
        var selectedPeople = questions.shuffled().prefix(4)
        if !selectedPeople.contains(where: { $0.name == question.name }) {
            selectedPeople.removeLast()
            selectedPeople.append(question)
        }
        selectedPeople.shuffle()
        
        let padding: CGFloat = 10
        let spriteWidth: CGFloat = 120
        let spriteHeight: CGFloat = 140
        
        let numberOfColumns = 2
        let numberOfRows = (selectedPeople.count + 1) / numberOfColumns
        
        // Calculate the total width and height of the grid
        let totalWidth = CGFloat(numberOfColumns) * (spriteWidth + padding) - padding
        let totalHeight = CGFloat(numberOfRows) * (spriteHeight + padding) - padding
        
        // Calculate the starting x and y positions to center the grid
        let startX = (frame.width - totalWidth) / 2 + spriteWidth / 2
        let startY = (frame.height + totalHeight) / 2 - spriteHeight / 2
        
        for (i, person) in selectedPeople.enumerated() {
            let texture = SKTexture(image: person.image!)
            let sprite = SKSpriteNode(texture: texture)
            sprite.name = person.name
            sprite.size = CGSize(width: spriteWidth, height: spriteHeight)
            
            let column = CGFloat(i % numberOfColumns)
            let row = CGFloat(i / numberOfColumns)
            
            let xPosition = startX + column * (spriteWidth + padding)
            let yPosition = startY - row * (spriteHeight + padding)
            
            sprite.position = CGPoint(x: xPosition, y: yPosition)
            portraits.append(sprite)
            addChild(sprite)
        }
        
        
    }
    
    func showDetails(for question: WonderPeople) {
        portraits.forEach { button in
            button.run(SKAction.sequence([
                SKAction.fadeOut(withDuration: 0.3),
                SKAction.run {
                    button.removeFromParent()
                }
            ]))
        }
        
        portraits.removeAll()
        
        state = 1
        questionLabel.text = "Whom was he?"
        
        // Remove previous buttons
        self.children.filter { $0.name?.contains("option") == true }.forEach { $0.removeFromParent() }
        
        // Display options
        var options = questions.shuffled().prefix(4)
        if !options.contains(where: { $0.whoHeIs == question.whoHeIs }) {
            var optionsArray = Array(options)
            optionsArray.removeLast()
            optionsArray.append(question)
            options = optionsArray.shuffled().prefix(4)
        }
        butons = []
        for (i, person) in options.enumerated() {
            let buttonTexture = createRoundedRectangleTexture(size: CGSize(width: 200, height: 50), cornerRadius: 15, color: UIColor.color(0x207C4C).withAlphaComponent(0.6))
            let button = SKSpriteNode(texture: buttonTexture)
            
            button.name = person.whoHeIs
            button.position = CGPoint(x: size.width / 2, y: size.height / 1.5 - CGFloat(i * 60))
            butons.append(button)
            let label = SKLabelNode(fontNamed: "Inika-Bold")
            label.text = person.whoHeIs
            label.fontSize = 20
            label.fontColor = .white
            label.verticalAlignmentMode = .center
            label.position = CGPoint(x: 0, y: 0)
            button.addChild(label)
            
            addChild(button)
        }
    }
    
    func checkAnswer(_ node: CGPoint, for question: WonderPeople) {
        startVibration()
        if state == 0 {
            portraits.forEach { portrait in
                if portrait.contains(node) {
                    handleClick(portrait)
                    let person = portrait.name
                    
                    if person == question.name {
                        portrait.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.removeFromParent()]))
                        showDetails(for: question)
                    } else {
                        loseLife()
                    }
                }
            }
            
        } else if state == 1 {
            butons.forEach { button in
                if button.contains(node) {
                    handleClick(button)
                    let option = button.name
                    if option == question.whoHeIs {
                        currentQuestion += 1
                        showNextQuestion()
                    } else {
                        loseLife()
                    }
                }
            }
            
        }
    }
    
    func handleClick(_ node: SKNode) {
        node.run(SKAction.sequence([
            SKAction.scale(to: 1.2, duration: 0.1),
            SKAction.scale(to: 1.0, duration: 0.1)
        ]))
    }
    func loseLife() {
        Sound.metalHit()
        lives -= 1
        if lives > -1 {
            heartNodes[lives].run(SKAction.fadeOut(withDuration: 0.5))
        }
        if lives == 0 {
            Sound.horrorlose()
            startVibrationMedium()
            resultNode = GameResultNode(isWin: false, starCount: 0, size: self.size)
            resultNode.alpha = 0
            addChild(resultNode)
            resultNode.run(SKAction.fadeIn(withDuration: 0.3))
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        if resultNode != nil {
            if resultNode.restartButton.contains(location) {
                startVibration()
                let sequence = SKAction.sequence([
                    SKAction.run {self.handleClick(self.resultNode.restartButton) } ,
                    SKAction.wait(forDuration: 0.2),
                    SKAction.run { self.restartLevel() }
                ])
                self.run(sequence)
                
               
            }
        }
        else {
            if currentQuestion < questions.count {
                checkAnswer(location, for: questions[currentQuestion])
            }
        }
    }
    func createRoundedRectangleTexture(size: CGSize, cornerRadius: CGFloat, color: UIColor) -> SKTexture {
        let rect = CGRect(origin: .zero, size: size)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()!
        
        let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        context.addPath(path.cgPath)
        context.setFillColor(color.cgColor)
        context.fillPath()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return SKTexture(image: image)
    }
    func restartLevel() {
        if resultNode != nil {
            resultNode.run(SKAction.fadeOut(withDuration: 0.1))
        }
        
        currentQuestion = 0
        lives = maxLives
        numberOfQuestions = 5 + currentLevel
        
        removeAllChildren()
        heartNodes = []
        setupUI()
        setupQuestions()
        showNextQuestion()
        setupBackground()
        resultNode = nil
    }
}
extension SKScene {
    func startVibrationMedium() {
        if CopenDa.isVibro {
            let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
            feedbackGenerator.impactOccurred()
        }
    }
    func startVibration() {
        if CopenDa.isVibro {
            let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
            feedbackGenerator.impactOccurred()
        }
    }
}
