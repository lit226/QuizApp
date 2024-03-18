import UIKit

class CompleteView: UIView {

    let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.isAccessibilityElement = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "Congratulations, You have completed the quiz 🥳"
        label.textAlignment = .center
        label.numberOfLines = 0

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(messageLabel)
        addConstraints()
    }

    func addConstraints() {
        messageLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            messageLabel.heightAnchor.constraint(equalToConstant: 300),
            messageLabel.widthAnchor.constraint(equalToConstant: 300)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
