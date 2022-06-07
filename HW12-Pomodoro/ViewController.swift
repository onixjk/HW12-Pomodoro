import UIKit
 
class ViewController: UIViewController {
    
    private lazy var container: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = Metric.containerSpacing
        
        return stackView
    }()
    
    private lazy var timerLabel: UILabel = {
        
        let label = UILabel()
        label.text = Strings.labelWorkModeText
        label.textColor = Color.workTimeColor
        label.font = .systemFont(ofSize: Metric.timerLabelFontSize, weight: Weight.fontWeight)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var startButton: UIButton = {
        
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: IconName.play)
        config.baseForegroundColor = Color.workTimeColor
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: Metric.buttonImageFontSize,
                                                                                  weight: Weight.iconWeight)
        
        let button = UIButton(configuration: config, primaryAction: nil)
        button.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        
        view.addSubview(container)
        
        container.addArrangedSubview(timerLabel)
        container.addArrangedSubview(startButton)
    }
    
    private func setupLayout() {
        
        container.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func startButtonAction() {
        
    }
}
 
// MARK: - Constants
 
extension ViewController {
    
    enum Metric {
        static let timerLabelFontSize: CGFloat = 60
        static let buttonImageFontSize: CGFloat = 40
        static let containerSpacing: CGFloat = 40
    }
    
    enum Weight {
        static let iconWeight: UIImage.SymbolWeight = .thin
        static let fontWeight: UIFont.Weight = .thin
    }
    
    enum Color {
        static let workTimeColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        static let breakTimeColor = #colorLiteral(red: 0, green: 0.7121946216, blue: 0.6342482567, alpha: 1)
    }
    
    enum Strings {
        static let labelWorkModeText: String = String(format: "%02i:%02i",
                                                      TimerDuration.workModeDuration / 60,
                                                      TimerDuration.workModeDuration % 60)
        static let labelBreakModeText: String = String(format: "%02i:%02i",
                                                       TimerDuration.breakModeDuration / 60,
                                                       TimerDuration.breakModeDuration % 60)
    }
    
    enum TimerDuration {
        static let workModeDuration = 1500
        static let breakModeDuration = 300
    }
    
    enum IconName {
        static let play = "play"
    }
}
 
