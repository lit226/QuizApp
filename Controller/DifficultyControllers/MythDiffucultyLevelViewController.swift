import UIKit

class MythDiffucultyLevelViewController: UIViewController {

    let difficultyView = DifficultyView()

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

    override func viewDidLoad() {
        super.viewDidLoad()

        addGradient()
        view.addSubview(backButton)
        view.addSubview(difficultyView)

        addConstraints()
        setup()
    }

    func addGradient() {
        let colorTop = UIColor(red: 180 / 255.0, green: 238 / 255.0, blue: 180 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 30 / 255.0, green: 15 / 255.0, blue: 100 / 255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }

    func addConstraints() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        difficultyView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.widthAnchor.constraint(equalToConstant: 100),

            difficultyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            difficultyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            difficultyView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            difficultyView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20)
        ])
    }

    @objc func handleTap() {
        navigationController?.popViewController(animated: true)
    }

    // Call the APIs for the respective difficulty
    func setup() {
        backButton.addTarget(self, action: #selector(handleTap), for: .touchUpInside)

        difficultyView.easyCellTapped = { [weak self] () -> Void in
            let questionsVC = QuestionViewController()
            APICaller.shared.fetchMythEasyQuestion { results in
                switch results {
                case .success(let result):
                    questionsVC.configure(result: result)
                case .failure(let error):
                    print("\(error)")
                }
            }

            self?.navigationController?.pushViewController(questionsVC, animated: true)
        }

        difficultyView.mediumCellTapped = { [weak self] () -> Void in
            let questionsVC = QuestionViewController()
            APICaller.shared.fetchMythMediumQuestion { results in
                switch results {
                case .success(let result):
                    questionsVC.configure(result: result)
                case .failure(let error):
                    print("\(error)")
                }
            }

            self?.navigationController?.pushViewController(questionsVC, animated: true)
        }

        difficultyView.hardCellTapped = { [weak self] () -> Void in
            let questionsVC = QuestionViewController()
            APICaller.shared.fetchMythHardQuestion { results in
                switch results {
                case .success(let result):
                    questionsVC.configure(result: result)
                case .failure(let error):
                    print("\(error)")
                }
            }

            self?.navigationController?.pushViewController(questionsVC, animated: true)
        }
    }
}
