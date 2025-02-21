import UIKit

protocol TeamTableViewCellDelegate: AnyObject {
    func didTapPlayback(for team: Team)
}

class TeamTableViewCell: UITableViewCell {
    
    static let cellid = "TeamTableViewCell"

    // MARK: - UI
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .vertical
        return stackView
    }()
    private lazy var badgeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var playbackBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .white
        return btn
    }()
    
    private lazy var nameLb1: UILabel = {
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.numberOfLines = 0
        label1.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label1.textColor = .white
        return label1
    }()
    private lazy var foundedLb1: UILabel = {
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.numberOfLines = 0
        label1.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label1.textColor = .white
        return label1
    }()
    private lazy var jobLb1: UILabel = {
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.numberOfLines = 0
        label1.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label1.textColor = .white
        return label1
    }()
    private lazy var infoLb1: UILabel = {
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.numberOfLines = 0
        label1.font = UIFont.systemFont(ofSize: 12, weight: . medium)
        label1.textColor = .white
        return label1
    }()
    
    private weak var delegate: TeamTableViewCellDelegate?
    private var team: Team?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.team = nil
        self.delegate = nil
        self.contentView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func configure(with item: Team, delegate: TeamTableViewCellDelegate) {
        
        self.team = item
        self.delegate = delegate
        
        playbackBtn.addTarget(self, action: #selector(didTapPlayback), for: .touchUpInside)
        
        containerView.backgroundColor = item.id.background
        
        badgeImageView.image = item.id.badge
        playbackBtn.setImage(item.isPlaying ? Assets.pause : Assets.play, for: .normal)
        
        nameLb1.text = item.name
        foundedLb1.text = item.founded
        jobLb1.text = "Current \(item.manager.job.rawValue): \(item.manager.name)"
        infoLb1.text = item.info
        
        self.contentView.addSubview(containerView)
        
        containerView.addSubview(contentStackView)
        containerView.addSubview(badgeImageView)
        containerView.addSubview(playbackBtn)
        contentStackView.addArrangedSubview(nameLb1)
        contentStackView.addArrangedSubview(foundedLb1)
        contentStackView.addArrangedSubview(jobLb1)
        contentStackView.addArrangedSubview(infoLb1)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            
            badgeImageView.heightAnchor.constraint(equalToConstant: 50),
            badgeImageView.widthAnchor.constraint(equalToConstant: 50),
            badgeImageView.topAnchor.constraint(equalTo: contentStackView.topAnchor),
            badgeImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            contentStackView.leadingAnchor.constraint(equalTo: badgeImageView.trailingAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo: playbackBtn.leadingAnchor, constant: -8),
            contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            
            playbackBtn.heightAnchor.constraint(equalToConstant: 44),
            playbackBtn.widthAnchor.constraint(equalToConstant: 44),
            playbackBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            playbackBtn.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
    
    @objc func didTapPlayback() {
        if let team = team {
            delegate?.didTapPlayback(for: team)
        }
    }
    
}
