import SpriteKit

final class GameResultNode: SKSpriteNode {
    let restartButton = SKSpriteNode(imageNamed: "restart_button")
    
    init(isWin: Bool, starCount: Int, size: CGSize) {
        super.init(texture: nil, color: .clear, size: size)
        
        let blurNode = SKEffectNode()
        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter?.setValue(10.0, forKey: kCIInputRadiusKey)
        blurNode.filter = blurFilter
        blurNode.shouldRasterize = true
        blurNode.alpha = 1
        blurNode.zPosition = 1
        blurNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(blurNode)
        
        let backgroundSprite = SKSpriteNode(color: .black, size: size)
        backgroundSprite.alpha = 0.5
        blurNode.addChild(backgroundSprite)
        
        let validStarCount = min(max(starCount, 0), 3)
        
        // Create the back view with rounded rectangle
        let rectSize = CGSize(width: 300, height: 400)
        let rect = CGRect(origin: .zero, size: rectSize)
        let shapeNode = SKShapeNode(rect: rect, cornerRadius: 15)
        shapeNode.fillColor = UIColor(red: 32/255, green: 124/255, blue: 76/255, alpha: 0.6)
        shapeNode.strokeColor = .clear
        shapeNode.zPosition = 2
        shapeNode.position = CGPoint(x: size.width / 2 - rectSize.width / 2, y: size.height / 2 - rectSize.height / 2)
        addChild(shapeNode)
        
        // Create and position the message label
        let messageLabel = SKLabelNode(fontNamed: "Inika-Bold")
        messageLabel.fontSize = 30
        messageLabel.fontColor = .white
        messageLabel.position = CGPoint(x: size.width / 2, y: size.height / 2 + 150)
        messageLabel.horizontalAlignmentMode = .center
        messageLabel.verticalAlignmentMode = .center
        messageLabel.text = isWin ? "Congrat, You Win!" : "Lose, Try Again!"
        messageLabel.numberOfLines = 1
        messageLabel.zPosition = 10
        addChild(messageLabel)
        
        // Add stars if it's a win
        if isWin {
            for i in 0..<validStarCount {
                let star = SKSpriteNode(imageNamed: "star")
                star.position = CGPoint(x: size.width / 2 + CGFloat(i * 45) - CGFloat(validStarCount * 20 - 20), y: size.height / 2 + 90)
                star.size = CGSize(width: 40, height: 40)
                star.zPosition = 10
                addChild(star)
            }
        }
        
        // Add restart button
        restartButton.position = CGPoint(x: size.width / 2, y: size.height / 2 - 100)
        restartButton.size = CGSize(width: 100, height: 100)
        restartButton.zPosition = 10
        addChild(restartButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
