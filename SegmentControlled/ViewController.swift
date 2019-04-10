//
//  ViewController.swift
//  SegmentControlled
//
//  Created by Buse ERKUŞ on 10.04.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = rowsDisplay[indexPath.row]
        return cell
    }
    let segmentedController: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Games","TV Series","Devices"])
        sc.selectedSegmentIndex = 0
        
        let font = UIFont.systemFont(ofSize: 20, weight: .bold)
        sc.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        sc.addTarget(self, action: #selector(segmentedChange), for: .valueChanged)
        return sc
    }()
    
    @objc fileprivate func segmentedChange(){
        switch segmentedController.selectedSegmentIndex {
        case 0:
            rowsDisplay = games
        case 1:
            rowsDisplay = movies
        default:
            rowsDisplay = devices
        }
        tableView.reloadData() // Tableview updating
    }
    
    //Master Array
    lazy var rowsDisplay = games
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    let games = [
    "GTA Vice City","Underground 2", "Silkroad ONLINE", "World Of Warcraft"
    ]
    let movies = [
    "Game Of Thrones","Vikings","Şahsiyet","This Is US"
    ]
    let devices = [
    "iMAC Pro","Mac Mini", "Mac Air"
    ]
    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        let paddingStackView = UIStackView(arrangedSubviews: [self.segmentedController])
        paddingStackView.layoutMargins = .init(top: 25, left: 12, bottom: 6, right: 12)
        paddingStackView.isLayoutMarginsRelativeArrangement = true
    
        
        
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .white
        navigationController?.title = "Segmented TableView"
        
        let stackView = UIStackView(arrangedSubviews: [
            segmentedController,tableView
            ])
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
    }


}

