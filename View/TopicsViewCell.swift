import UIKit

class TopicsViewCell: UITableViewCell {

    static public var identifier = "TopicsViewCell"
    public var onTapGesture: (() -> Void)?

    let labelText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.isAccessibilityElement = true

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(labelText)
        addConstraints()
        addTapGesture()
    }

    func addConstraints() {
        labelText.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            labelText.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelText.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelText.heightAnchor.constraint(equalToConstant: 50),
            labelText.widthAnchor.constraint(equalToConstant: 150)
        ])
    }

    func addGradient() {
        let colorTop = UIColor(red: 120 / 255.0, green: 38.0 / 255.0, blue: 150 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 100 / 255.0, green: 2.0 / 255.0, blue: 100 / 255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }

    func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let onTapGesture = onTapGesture else { return }
        onTapGesture()
      }

    func setTitle(title: String) {
        labelText.text = title
        labelText.accessibilityLabel = "topic \(title)"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
