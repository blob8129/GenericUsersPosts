//
//  UsersVC.swift
//  UsersPosts
//
//  Created by Andrey Volobuev on 8/7/18.
//  Copyright © 2018 blob8129. All rights reserved.
//

import UIKit



class ViewVC<ViewModelType, InteractorType: InteractorInput, CellType: ViewModelConfigurable>: UIViewController, UITableViewDataSource, UITableViewDelegate
                                                            where InteractorType.ViewModelType == ViewModelType,
                                                                    CellType.ViewModelType == ViewModelType, CellType: UITableViewCell {
    
    var interactor: InteractorType?
    let cellId = "CellId"
    
    private lazy var tableView: UITableView = { tv in
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.dataSource = self
        tv.delegate = self
        tv.rowHeight = UITableViewAutomaticDimension
        tv.estimatedRowHeight = 200
        return tv
    }(UITableView(frame: CGRect.zero, style: UITableViewStyle.plain))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addAllSubviews()
        registerCells()
        interactor?.viewDidLoad()
    }
    
    private func addAllSubviews() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            view.topAnchor.constraint(equalTo: tableView.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]);
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let indexPathForSelectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }
    
    private func registerCells() {
        tableView.register(CellType.self, forCellReuseIdentifier: cellId)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.numberOfItems ?? 0
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CellType
        if let viewModel = interactor?.viewModel(at: indexPath).convert() {
            cell?.configure(for: viewModel)
        }
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor?.didSelectedItem(at: indexPath)
    }
}

extension ViewVC: InteractorOutput {
    func didLoadedViewModels() {
        tableView.reloadData()
    }
}
