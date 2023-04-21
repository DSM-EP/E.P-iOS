import UIKit

import SnapKit
import Then

class OnboardingViewController: UIViewController {

    // MARK: - UI
    private let noticeLabel = UILabel().then {
        $0.text = "Save Energy \nPractice Yourself"
        $0.numberOfLines = 2
        $0.font = .niconneFont(ofSize: 45, alone: .regular)
        $0.textColor = .black
    }
    private let googleLoginButton = UIButton(type: .system).then {
        $0.backgroundColor = .green1
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("Google 계정으로 로그인", for: .normal)
        $0.titleLabel?.font = .notoSansFont(ofSize: 18, family: .bold)
        $0.contentHorizontalAlignment = .center
        $0.layer.cornerRadius = 5
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
extension OnboardingViewController {
    func addSubviews() {
        [noticeLabel, googleLoginButton].forEach { view.addSubview($0) }
    }

    func makeSubviewConstraints() {
        noticeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(270)
            $0.centerX.equalToSuperview()
        }
        googleLoginButton.snp.makeConstraints {
            $0.top.lessThanOrEqualTo(noticeLabel.snp.bottom).offset(350)
            $0.height.equalTo(43)
            $0.leading.trailing.equalToSuperview().inset(28)
        }
    }
}
