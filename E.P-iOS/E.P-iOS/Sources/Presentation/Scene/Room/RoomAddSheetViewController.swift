import UIKit

import SnapKit
import Then

class RoomAddSheetViewController: UIViewController {
    
    // MARK: - UI
    private let roomAddLabel = UILabel().then {
        $0.text = "룸 추가"
        $0.font = .notoSansFont(ofSize: 24, family: .medium)
        $0.textColor = .white
    }
    let roomListTableView = UITableView().then {
        $0.register(RoomAddTableViewCell.self, forCellReuseIdentifier: RoomAddTableViewCell.identifier)
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green1
        configure()
        self.roomListTableView.backgroundColor = UIColor.green1
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        makeSubviewConstraints()
    }
    private func configure() {
        self.roomListTableView.dataSource = self
        self.roomListTableView.rowHeight = 100
        self.roomListTableView.delegate = self
    }
}

// MARK: - Layout
extension RoomAddSheetViewController {
    private func addSubviews() {
        [roomAddLabel, roomListTableView].forEach { view.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        roomAddLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(9)
        }
        roomListTableView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.bottom.equalToSuperview()
            $0.top.equalTo(roomAddLabel.snp.bottom).offset(16)
        }
    }
}

extension RoomAddSheetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RoomAddTableViewCell.identifier, for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.green1
    }
}

extension RoomAddSheetViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select \(indexPath.row)")
    }
}
