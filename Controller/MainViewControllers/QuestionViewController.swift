import UIKit

class QuestionViewController: UIViewController {

    // MARK: - Subviews

    let backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.isAccessibilityElement = true
        button.accessibilityLabel = "Back button"
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.layer.shadowOpacity = 1.0
        button.setTitle("Back", for: .normal)

        return button
    }()

    let nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.isAccessibilityElement = true
        button.accessibilityLabel = "Next question button"
        button.layer.cornerRadius = 25
        button.layer.shadowOpacity = 1.0
        button.setTitle("Next", for: .normal)

        return button
    }()

    let scoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.isAccessibilityElement = true
        label.text = "Score: 0"
        label.textAlignment = .center

        return label
    }()

    let questionView = QuestionsView()
    let messageView = CompleteView()

    public var results: [Results] = []
    private var index: Int = 0
    private var score: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.accessibilityLabel = "score \(score)"

        addGradient()
        view.addSubview(backButton)
        view.addSubview(nextButton)
        view.addSubview(scoreLabel)
        view.addSubview(questionView)
        view.addSubview(messageView)

        messageView.isHidden = true
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(handleTap), for: .touchUpInside)

        setupConstraints()
    }

    private func setupConstraints() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        questionView.translatesAutoresizingMaskIntoConstraints = false
        messageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            messageView.topAnchor.constraint(equalTo: backButton.bottomAnchor),
            messageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            messageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            messageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.widthAnchor.constraint(equalToConstant: 100),

            scoreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            scoreLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 5),
            scoreLabel.heightAnchor.constraint(equalToConstant: 50),
            scoreLabel.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor, constant: -5),

            nextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.widthAnchor.constraint(equalToConstant: 100),

            questionView.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 10),
            questionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            questionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            questionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // Adding gradient to background
    func addGradient() {
        let colorTop = UIColor(red: 200 / 255.0, green: 120 / 255.0, blue: 200 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 90 / 255.0, green: 80.0 / 255.0, blue: 250 / 255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }

    // Configuring the data
    public func configure(result: [Results]) {
        DispatchQueue.main.sync { [weak self] in
            self?.results += result
            self?.index = 0
        }

        setup()
    }

    private func setup() {
        let question = results[index].question
        let category = results[index].category

        var choices = results[index].incorrect_answers
        choices.append(results[index].correct_answer)
        choices.shuffle()

        if let category = category, let question = question {
            questionView.bindToView(topic: category, question: question, choices: choices)
        }

        questionView.choiceSelected = ""
    }

    @objc func handleTap() {
        navigationController?.popViewController(animated: true)
    }

    @objc func nextButtonTapped() {
        if (index == results.count - 1) {
            messageView.isHidden = false
            questionView.isHidden = true
            scoreLabel.isHidden = true
            nextButton.isHidden = true

            return
        }

        questionView.reset()
        if (questionView.choiceSelected == "") {
            // Show alert when the choice is not selected
            let alert = UIAlertController(title: "Warning", message: "Please choose any option", preferredStyle: .alert)
            let action = UIAlertAction(title: "Cancel", style: .destructive)
            alert.addAction(action)
            present(alert, animated: true)
        } else {
            // Keep track of the score
            if (questionView.choiceSelected == results[index].correct_answer) {
                score += 1
                scoreLabel.text = "Score: \(score)"
            }

            index += 1
            setup()
        }
    }
}
