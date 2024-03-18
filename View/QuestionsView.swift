import UIKit

class QuestionsView: UIView {

    // MARK: - Subviews

    private let topicLabel = UILabel()
    private let questionLabel = UILabel()
    private var choice1 = UILabel()
    private var choice2 = UILabel()
    private var choice3 = UILabel()
    private var choice4 = UILabel()

    private var changeColorLabel: UILabel? = nil

    public var choiceSelected: String = ""

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.isAccessibilityElement = false
        addSubview(topicLabel)
        addSubview(questionLabel)

        addSubview(choice1)
        addSubview(choice2)
        addSubview(choice3)
        addSubview(choice4)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        topicLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        choice1.translatesAutoresizingMaskIntoConstraints = false
        choice2.translatesAutoresizingMaskIntoConstraints = false
        choice3.translatesAutoresizingMaskIntoConstraints = false
        choice4.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            topicLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            topicLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            topicLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            topicLabel.heightAnchor.constraint(equalToConstant: 70),

            questionLabel.topAnchor.constraint(equalTo: topicLabel.bottomAnchor, constant: 20),
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            questionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            questionLabel.heightAnchor.constraint(equalToConstant: 100),

            choice1.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20),
            choice1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            choice1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            choice1.heightAnchor.constraint(equalToConstant: 50),

            choice2.topAnchor.constraint(equalTo: choice1.bottomAnchor, constant: 20),
            choice2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            choice2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            choice2.heightAnchor.constraint(equalToConstant: 50),

            choice3.topAnchor.constraint(equalTo: choice2.bottomAnchor, constant: 20),
            choice3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            choice3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            choice3.heightAnchor.constraint(equalToConstant: 50),

            choice4.topAnchor.constraint(equalTo: choice3.bottomAnchor, constant: 20),
            choice4.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            choice4.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            choice4.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    public func bindToView(topic: String, question: String, choices: [String?]) {
        DispatchQueue.main.async { [weak self] in
            self?.topicLabel.text = topic
            self?.topicLabel.accessibilityLabel = "topic \(topic)"

            self?.questionLabel.text = question
            self?.questionLabel.accessibilityLabel = "question \(question)"

            self?.choice1.text = choices[0]
            self?.choice1.accessibilityLabel = "first choice \(choices[0] as String?)"

            self?.choice2.text = choices[1]
            self?.choice2.accessibilityLabel = "second choice \(choices[1] as String?)"

            self?.choice3.text = choices[2]
            self?.choice3.accessibilityLabel = "third choice \(choices[2] as String?)"

            self?.choice4.text = choices[3]
            self?.choice4.accessibilityLabel = "fourth choice \(choices[3] as String?)"

            self?.stylizeView()
        }
    }

    private func stylizeView() {
        topicLabel.numberOfLines = 1
        topicLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        topicLabel.textAlignment = .center
        topicLabel.isAccessibilityElement = true

        questionLabel.numberOfLines = 0
        questionLabel.isAccessibilityElement = true

        let borderColor: UIColor =  .black
        choice1.numberOfLines = 1
        choice1.textColor = .black
        choice1.textAlignment = .center
        choice1.layer.borderWidth = 2
        choice1.layer.borderColor = borderColor.cgColor
        choice1.layer.cornerRadius = 25
        choice1.isAccessibilityElement = true
        choice1.isUserInteractionEnabled = true
        let gesture1 = UITapGestureRecognizer(target: self, action: #selector(choice1Tapped))
        choice1.addGestureRecognizer(gesture1)

        choice2.numberOfLines = 1
        choice2.textColor = .black
        choice2.textAlignment = .center
        choice2.layer.borderWidth = 2
        choice2.layer.borderColor = borderColor.cgColor
        choice2.layer.cornerRadius = 25
        choice2.isAccessibilityElement = true
        choice2.isUserInteractionEnabled = true
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(choice2Tapped))
        choice2.addGestureRecognizer(gesture2)

        choice3.numberOfLines = 1
        choice3.textColor = .black
        choice3.textAlignment = .center
        choice3.layer.borderWidth = 2
        choice3.layer.borderColor = borderColor.cgColor
        choice3.layer.cornerRadius = 25
        choice3.isAccessibilityElement = true
        choice3.isUserInteractionEnabled = true
        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(choice3Tapped))
        choice3.addGestureRecognizer(gesture3)

        choice4.numberOfLines = 1
        choice4.textColor = .black
        choice4.textAlignment = .center
        choice4.layer.borderWidth = 2
        choice4.layer.borderColor = borderColor.cgColor
        choice4.layer.cornerRadius = 25
        choice4.isAccessibilityElement = true
        choice4.isUserInteractionEnabled = true
        let gesture4 = UITapGestureRecognizer(target: self, action: #selector(choice4Tapped))
        choice4.addGestureRecognizer(gesture4)
    }

    @objc func choice1Tapped() {
        if (changeColorLabel != nil) {
            let borderColor: UIColor =  .black
            changeColorLabel?.layer.borderColor = borderColor.cgColor
        }

        if let choice = choice1.text {
            choiceSelected = choice
            let borderColor: UIColor =  .green
            self.choice1.layer.borderColor = borderColor.cgColor
            changeColorLabel = choice1
        }
    }

    @objc func choice2Tapped() {
        if (changeColorLabel != nil) {
            let borderColor: UIColor =  .black
            changeColorLabel?.layer.borderColor = borderColor.cgColor
        }

        if let choice = choice2.text {
            choiceSelected = choice
            let borderColor: UIColor =  .green
            self.choice2.layer.borderColor = borderColor.cgColor
            changeColorLabel = choice2
        }
    }

    @objc func choice3Tapped() {
        if (changeColorLabel != nil) {
            let borderColor: UIColor =  .black
            changeColorLabel?.layer.borderColor = borderColor.cgColor
        }

        if let choice = choice3.text {
            choiceSelected = choice
            let borderColor: UIColor =  .green
            self.choice3.layer.borderColor = borderColor.cgColor
            changeColorLabel = choice3
        }
    }

    @objc func choice4Tapped() {
        if (changeColorLabel != nil) {
            let borderColor: UIColor =  .black
            changeColorLabel?.layer.borderColor = borderColor.cgColor
        }

        if let choice = choice4.text {
            choiceSelected = choice
            let borderColor: UIColor =  .green
            self.choice4.layer.borderColor = borderColor.cgColor
            changeColorLabel = choice4
        }
    }

    public func reset() {
        self.choice1.layer.backgroundColor = CGColor.init(gray: 1, alpha: 0)
        self.choice2.layer.backgroundColor = CGColor.init(gray: 1, alpha: 0)
        self.choice3.layer.backgroundColor = CGColor.init(gray: 1, alpha: 0)
        self.choice4.layer.backgroundColor = CGColor.init(gray: 1, alpha: 0)
    }
}
