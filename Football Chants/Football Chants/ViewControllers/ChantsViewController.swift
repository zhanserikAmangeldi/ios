import UIKit

class ChantsViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cellid)

        return tableView
    }()
    
    private lazy var teamsViewModel = TeamsViewModel()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}

private extension ChantsViewController {
    
    func setup() {
        self.navigationController?.navigationBar.topItem?.title = "Football Chants"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
        ])
    }
}

// MARK: - UITableViewDataSource
            
extension ChantsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsViewModel.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let team = teamsViewModel.teams[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.cellid, for: indexPath) as! TeamTableViewCell
        cell.configure(with: team, delegate: self)
        return cell
    }
}

extension ChantsViewController: TeamTableViewCellDelegate {
    func didTapPlayback(for team: Team) {
        teamsViewModel.togglePlayback(for: team)
        tableView.reloadData()
    }
    
}
