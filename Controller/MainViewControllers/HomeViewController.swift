import UIKit

enum Topics: Int {
    case GeneralKnowledge = 0
    case Entertainment = 1
    case Sports = 2
    case Science = 3
    case Mythology = 4
}

class HomeViewController: UIViewController {

    // MARK: - Constants

    let sectionHeader: [String] = ["General Knowledge", "Entertainment", "Sports", "Science", "Mythology"]

    // MARK: - Views

    private var headerView: TableHeaderView?
    private var homeFeedTable: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(TopicsViewCell.self, forCellReuseIdentifier: TopicsViewCell.identifier)
        return tableView
    }()

    // MARK: - Life Cycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(homeFeedTable)

        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self

        headerView = TableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200))
        headerView?.isAccessibilityElement = true
        headerView?.accessibilityLabel = "Header of the table"
        homeFeedTable.tableHeaderView = headerView
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        homeFeedTable.frame = view.bounds
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TopicsViewCell.identifier, for: indexPath) as? TopicsViewCell else {
            return UITableViewCell()
        }

        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 20
        cell.layer.shadowOffset = CGSize(width: 20, height: 10)
        cell.layer.shadowOpacity = 1.0
        cell.isAccessibilityElement = false

        switch indexPath.section {
        case Topics.GeneralKnowledge.rawValue:
            cell.setTitle(title: "General Knowledge")
            cell.onTapGesture = { [weak self] () -> Void in
                let GKVC = GKDifficultyLavelViewController()
                self?.navigationController?.pushViewController(GKVC, animated: true)
            }

        case Topics.Entertainment.rawValue:
            cell.setTitle(title: "Entertainment")
            cell.onTapGesture = { [weak self] () -> Void in
                let entertainmentVC = EntertainmentDiffucultyLevelViewController()
                self?.navigationController?.pushViewController(entertainmentVC, animated: true)
            }

        case Topics.Sports.rawValue:
            cell.setTitle(title: "Sports")
            cell.onTapGesture = { [weak self] () -> Void in
                let sportsVC = SportsDiffucultyLevelViewController()
                self?.navigationController?.pushViewController(sportsVC, animated: true)
            }

        case Topics.Science.rawValue:
            cell.setTitle(title: "Science")
            cell.onTapGesture = { [weak self] () -> Void in
                let scienceVC = ScienceDiffucultyLevelViewController()
                self?.navigationController?.pushViewController(scienceVC, animated: true)
            }

        case Topics.Mythology.rawValue:
            cell.setTitle(title: "Mythology")
            cell.onTapGesture = { [weak self] () -> Void in
                let mythVC = MythDiffucultyLevelViewController()
                self?.navigationController?.pushViewController(mythVC, animated: true)
            }

        default:
            return UITableViewCell()
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeader.count
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset

        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}
