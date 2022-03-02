//
//  ViewController.swift
//  ScrollView
//
//  Created by Hithakshi on 02/03/22.
//

import UIKit

enum ScrollViewType: String, CaseIterable {
    case vertical = "Vertical Scroll - With container"
    case verticalSingleLabel = "Vertical Scroll - Without Container"
    case horizontal = "Horizontal Scroll View"
}

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var items = ScrollViewType.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.name)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func navigate(to itemType: ScrollViewType) {
        let vc: UIViewController
        switch itemType {
        case .vertical:
            vc = VerticalScrollViewController.loadFromNib()
        case .horizontal:
            vc = HorizontalScrollViewController.loadFromNib()
        case .verticalSingleLabel:
            vc = SingleLabelScrollViewController.loadFromNib()
        }
        vc.title = itemType.rawValue
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.name)!
        var defaultConfig = cell.defaultContentConfiguration()
        defaultConfig.text = items[indexPath.row].rawValue
        cell.contentConfiguration = defaultConfig
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        navigate(to: items[indexPath.row])
    }
}

extension NSObject {
    static var name: String { String(describing: Self.self) }
}


extension UIViewController {
    static func loadFromNib() -> Self {
        return Self.init(nibName: Self.name, bundle: nil)
    }
}
