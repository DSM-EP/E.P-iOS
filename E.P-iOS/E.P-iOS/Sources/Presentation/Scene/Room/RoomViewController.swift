import UIKit

import SnapKit
import Then

import RxSwift
import RxCocoa

class RoomViewController: UIViewController {

    let roomAddSheetViewController = RoomAddSheetViewController()
    private var disposeBag = DisposeBag()

    // MARK: - UI
    private let roomLabel = UILabel().then {
        $0.text = "Room"
        $0.font = .niconneFont(ofSize: 30, alone: .regular)
    }
    private let roomTableView = UITableView().then {
        $0.register(RoomTableViewCell.self, forCellReuseIdentifier: RoomTableViewCell.identifier)
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
    }
    private let plusButton = UIButton(type: .system).then {
        $0.backgroundColor = .green1
        $0.setTitle("✚", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .notoSansFont(ofSize: 38, family: .medium)
        $0.layer.cornerRadius = 25
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
        setButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }
    private func configure() {
        self.roomTableView.dataSource = self
        self.roomTableView.rowHeight = 100
        self.roomTableView.delegate = self
    }
    // MARK: - Button
    private func setButton() {
        plusButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.presentModal()
            })
            .disposed(by: disposeBag)
    }
    private func presentModal() {
        roomAddSheetViewController.modalPresentationStyle = .pageSheet

        if let sheet = roomAddSheetViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 40
        }
        self.present(roomAddSheetViewController, animated: true)
    }
}

// MARK: - Layout
extension RoomViewController {
    func addSubviews() {
        [roomLabel, roomTableView, plusButton].forEach { view.addSubview($0)}
    }
    func makeSubviewConstraints() {
        roomLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.centerX.equalToSuperview()
        }
        roomTableView.snp.makeConstraints {
            $0.top.equalTo(roomLabel.snp.bottom).offset(49)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.bottom.equalToSuperview()
        }
        plusButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(24)
            $0.right.equalToSuperview().inset(20)
            $0.width.height.equalTo(50)
        }
    }
}

extension RoomViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RoomTableViewCell.identifier, for: indexPath)
        return cell
    }
}

extension RoomViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select \(indexPath.row)")
    }
}
