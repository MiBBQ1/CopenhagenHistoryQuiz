import UIKit

class copenSlider: UIView {
    private var numberOfPages: Int = 0
    private var currentPage: Int = 0 {
        didSet {
            updateDotColors()
        }
    }
    private var dotLayers: [CALayer] = []
    private var isAnimating: Bool = false
    private var timer: Timer?

    private let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.InikaBold(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    init(numberOfPages: Int) {
        self.numberOfPages = numberOfPages
        super.init(frame: .zero)
        setupView()
        setupDots()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupDots()
    }
    
    private func setupView() {
        addSubview(textLabel)
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),
            
            textLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 5),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    private func setupDots() {
        dotLayers.forEach { $0.removeFromSuperlayer() }
        dotLayers.removeAll()
        for _ in 0..<numberOfPages {
            let dotLayer = CALayer()
            dotLayer.backgroundColor = UIColor.lightGray.cgColor
            dotLayer.cornerRadius = 4
            layer.addSublayer(dotLayer)
            dotLayers.append(dotLayer)
        }
        setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 15
        backgroundColor = .color(0x0D321E).withAlphaComponent(0.2)
        
        let dotSize: CGFloat = 8
        let spacing: CGFloat = 12
        let totalWidth = CGFloat(numberOfPages - 1) * spacing + CGFloat(numberOfPages) * dotSize
        var x: CGFloat = (bounds.width - totalWidth) / 2
        let y: CGFloat = bounds.height - dotSize - 10
        for dotLayer in dotLayers {
            dotLayer.frame = CGRect(x: x, y: y, width: dotSize, height: dotSize)
            x += dotSize + spacing
        }
        updateDotColors()
    }
    
    private func updateDotColors() {
        for (index, dotLayer) in dotLayers.enumerated() {
            dotLayer.backgroundColor = index == currentPage ? UIColor.white.cgColor : UIColor.lightGray.cgColor
        }
    }
    
    func setCurrentPage(_ page: Int) {
        guard !isAnimating else { return }
        currentPage = page
        resetTimer()
        UIView.transition(with: self, duration: 0.5, options: [.transitionCrossDissolve], animations: {
            self.iconImageView.isHidden = true
            self.textLabel.isHidden = true
            self.dotLayers.forEach { $0.isHidden = false }
        })
    }
    
    func animateToImageAndText(image: UIImage, text: String) {
        isAnimating = true

        UIView.transition(with: self, duration: 0.5, options: [.transitionCrossDissolve], animations: {
            self.iconImageView.image = image
            self.textLabel.text = text
            self.iconImageView.isHidden = false
            self.textLabel.isHidden = false
            self.dotLayers.forEach { $0.isHidden = true }
        }) { _ in
            self.isAnimating = false
        }
    }
    
    private func resetTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            let image = UIImage(named: "rusalka")?.withRenderingMode(.alwaysTemplate)
            let text = "Choose game"
            self.animateToImageAndText(image: image!, text: text)
        }
    }
    
    func setNumberOfPages(_ count: Int) {
        numberOfPages = count
        setupDots()
        setNeedsLayout()
    }
}
