import UIKit

import SnapKit
import Then

class RoomTableViewCell: UITableViewCell {

    static let identifier = "RoomTableViewCell"

    // MARK: - UI
    let iconText = UILabel().then {
        $0.font = .notoSansFont(ofSize: 30, family: .medium)
    }
    let roomTitle = UILabel().then {
        $0.font = .notoSansFont(ofSize: 20, family: .regular)
    }

    // MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubviews()
        makeSubviewConstraints()
        setData()
        self.layer.borderColor = UIColor.black.cgColor
        self.contentView.layer.cornerRadius = 20
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
        self.iconText.text = "🤣"
        self.roomTitle.text = "3 - 1반"
    }
}

// MARK: - Layout
extension RoomTableViewCell {
    func addSubviews() {
        [iconText, roomTitle].forEach { self.contentView.addSubview($0)}
    }
    func makeSubviewConstraints() {
        iconText.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().inset(20)
        }
        roomTitle.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
