import UIKit

class DifficultyView: UIView {

    // MARK: - Subviews

    public var easyCellTapped: (() -> Void)?
    public var mediumCellTapped: (() -> Void)?
    public var hardCellTapped: (() -> Void)?

    let difficultyLabel: UILabel = {
        let label = UILabel()
        label.text = "Select a Difficulty"
        label.numberOfLines = 0
        label.textColor = .black
        label.layer.borderWidth = 2
        label.textAlignment = .center
        label.isAccessibilityElement = true
        label.accessibilityLabel = "Select a Difficulty"

        return label
    }()

    let easyLabel: UILabel = {
        let label = UILabel()
        label.text = "Easy"
        label.numberOfLines = 0
        label.textColor = .black
        label.layer.shadowOpacity = 1.0
        label.layer.borderWidth = 2
        label.textAlignment = .center
        label.backgroundColor = .green
        label.isAccessibilityElement = true
        label.accessibilityLabel = "Easy level"

        return label
    }()

    let mediumLabel: UILabel = {
        let label = UILabel()
        label.text = "Medium"
        label.numberOfLines = 0
        label.textColor = .black
        label.layer.shadowOpacity = 1.0
        label.layer.borderWidth = 2
        label.textAlignment = .center
        label.backgroundColor = .yellow
        label.isAccessibilityElement = true
        label.accessibilityLabel = "Medium level"

        return label
    }()

    let hardLabel: UILabel = {
        let label = UILabel()
        label.text = "Hard"
        label.numberOfLines = 0
        label.textColor = .black
        label.layer.shadowOpacity = 1.0
        label.backgroundColor = .red
        label.layer.borderWidth = 2
        label.textAlignment = .center
        label.isAccessibilityElement = true
        label.accessibilityLabel = "Hard level"

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(difficultyLabel)
        addSubview(easyLabel)
        addSubview(mediumLabel)
        addSubview(hardLabel)

        addConstraints()
        addTapGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addConstraints() {
        difficultyLabel.translatesAutoresizingMaskIntoConstraints = false
        easyLabel.translatesAutoresizingMaskIntoConstraints = false
        mediumLabel.translatesAutoresizingMaskIntoConstraints = false
        hardLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            difficultyLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            difficultyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            difficultyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            difficultyLabel.heightAnchor.constraint(equalToConstant: 70),

            easyLabel.topAnchor.constraint(equalTo: difficultyLabel.bottomAnchor, constant: 20),
            easyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            easyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            easyLabel.heightAnchor.constraint(equalToConstant: 50),

            mediumLabel.topAnchor.constraint(equalTo: easyLabel.bottomAnchor, constant: 20),
            mediumLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mediumLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            mediumLabel.heightAnchor.constraint(equalToConstant: 50),

            hardLabel.topAnchor.constraint(equalTo: mediumLabel.bottomAnchor, constant: 20),
            hardLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            hardLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            hardLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func addTapGesture() {
        let easyTap = UITapGestureRecognizer(target: self, action: #selector(self.handleEasyDifficultyTap))
        easyLabel.addGestureRecognizer(easyTap)
        easyLabel.isUserInteractionEnabled = true

        let mediumTap = UITapGestureRecognizer(target: self, action: #selector(handleMediumDifficultyTap))
        mediumLabel.addGestureRecognizer(mediumTap)
        mediumLabel.isUserInteractionEnabled = true

        let hardTap = UITapGestureRecognizer(target: self, action: #selector(handleHardDifficultyTap))
        hardLabel.addGestureRecognizer(hardTap)
        hardLabel.isUserInteractionEnabled = true
    }

    @objc func handleEasyDifficultyTap() {
        guard let onTapGesture = easyCellTapped else { return }
        onTapGesture()
    }

    @objc func handleMediumDifficultyTap() {
        guard let onTapGesture = mediumCellTapped else { return }
        onTapGesture()
    }

    @objc func handleHardDifficultyTap() {
        guard let onTapGesture = hardCellTapped else { return }
        onTapGesture()
    }
}
