import UIKit

class TableHeaderView: UIView {

    let headerTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.text = "Quiz App"
        label.textColor = .white
        label.textAlignment = .center
        label.isAccessibilityElement = true
        label.accessibilityLabel = "quiz application"

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addGradient()
        addSubview(headerTitle)
        addConstraints()
    }

    func addGradient() {
        let colorTop = UIColor(red: 100 / 255.0, green: 38.0 / 255.0, blue: 200 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 76 / 255.0, green: 2.0 / 255.0, blue: 150 / 255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }

    func addConstraints() {
        headerTitle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerTitle.heightAnchor.constraint(equalToConstant: 50),
            headerTitle.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
