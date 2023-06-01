import UIKit

import SnapKit
import Then

class RoomAddTableViewCell: UITableViewCell {

    static let identifier = "RoomAddTableViewCell"

    // MARK: - UI
    let roomTitle = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
    }
    let addButton = UIButton(type: .system).then {
        $0.backgroundColor = .white
        $0.setTitle("✚", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .notoSansFont(ofSize: 30, family: .medium)
        $0.layer.cornerRadius = 20
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 2
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
    }

    // MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        setData()
        addSubviews()
        makeSubviewConstraints()
        self.layer.borderColor = UIColor.black.cgColor
        self.contentView.layer.cornerRadius = 15
        self.contentView.layer.borderWidth = 0.5
        self.contentView.backgroundColor = .white
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 19, right: 0))
        self.selectionStyle = .none
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setData() {
        self.roomTitle.text = "3-1반"
    }
}

// MARK: - Layout
extension RoomAddTableViewCell {
    func addSubviews() {
        [roomTitle, addButton].forEach { self.contentView.addSubview($0)}
    }
    func makeSubviewConstraints() {
        roomTitle.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        addButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(40)
            $0.right.equalToSuperview().inset(13)
        }
    }
}
