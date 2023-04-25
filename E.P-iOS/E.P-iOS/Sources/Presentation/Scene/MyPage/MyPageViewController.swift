import UIKit

import SnapKit
import Then

class MyPageViewController: UIViewController {

    // MARK: - UI
    private let profileImage = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.image = UIImage(named: "Profile")
    }
    private let userName = UILabel().then {
        $0.font = .notoSansFont(ofSize: 17, family: .medium)
        $0.text = "오상우"
    }
    private let styleTitle = UILabel().then {
        $0.font = .notoSansFont(ofSize: 15, family: .regular)
        $0.text = "홀리몰리"
    }
    private let contentView = UIView().then {
        $0.backgroundColor = .green1
    }
    private let noticeLabel = UILabel().then {
        $0.text = "우리가 사는 지구\n언제까지 죽일건가요\n더 이상 죽이지 말고 살립시다\n절약을 하며\n여러분이 살 세상을 만드세요"
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = .notoSansFont(ofSize: 26, family: .medium)
        $0.textColor = .white
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }
}

// MARK: - Layout
extension MyPageViewController {
    func addSubviews() {
        [profileImage, userName, styleTitle, noticeLabel, contentView].forEach { view.addSubview($0)}
        
        contentView.addSubview(noticeLabel)
    }
    func makeSubviewConstraints() {
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(63)
            $0.left.equalToSuperview().inset(47)
            $0.width.height.equalTo(85)
        }
        userName.snp.makeConstraints {
            $0.top.equalToSuperview().inset(98)
            $0.leading.equalTo(profileImage.snp.trailing).offset(16)
        }
        styleTitle.snp.makeConstraints {
            $0.top.equalTo(userName.snp.bottom)
            $0.leading.equalTo(profileImage.snp.trailing).offset(16)
        }
        contentView.snp.makeConstraints {
            $0.top.equalTo(styleTitle.snp.bottom).offset(25)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(626)
        }
        noticeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(157)
            $0.centerX.equalToSuperview()
        }
    }
}
