//
//  MainViewController.swift
//  
//
//  Created by Murilo de Souza Lopes on 02/08/19.
//  Copyright (c) 2019 Murilo de Souza Lopes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MainDisplayLogic: class {
    func displaySomething(viewModel: Main.Something.ViewModel)
    func displayRepo(viewModel: Main.Repo.ViewModel)
}

class MainViewController: UIViewController, MainDisplayLogic {
    var interactor: MainBusinessLogic?
    var router: (NSObjectProtocol & MainRoutingLogic & MainDataPassing)?
    var items: [Item] = []
    let mainView = MainView()
    var refreshControl = UIRefreshControl()
    var refreshView: RefreshView!
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainView()
        
        doInit()
        refreshSetup()
    }
    
    func setupMainView() {
        title = "Github API"
        mainView.tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.idCell)
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
    
    //MARK: Refresh Controll
    
    func refreshSetup(){
        //refreshControl.attributedTitle = NSAttributedString(string: "Carregando")
        refreshControl.backgroundColor = .clear
        refreshControl.tintColor = .clear
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        mainView.tableView.refreshControl = refreshControl
    }
    
    
    @objc func refresh(sender:AnyObject) {
        getRefereshView()
        let request = Main.Something.Request()
        interactor?.doSomething(request: request)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.mainView.tableView.refreshControl?.endRefreshing()
        }
    }
    
    func getRefereshView() {
        refreshView = RefreshView()
        refreshView.frame = refreshControl.frame
        refreshControl.add(refreshView)
    }
    
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doInit() {
        let request = Main.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Main.Something.ViewModel) {
        items = viewModel.item
        mainView.tableView.reloadData()
    }
    
    func displayRepo(viewModel: Main.Repo.ViewModel) {
        router?.routeToRepo()
    }
}

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.idCell, for: indexPath) as? MainTableViewCell {
            
            let item = items[indexPath.row]
            cell.populate(item: item)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        let request = Main.Repo.Request(item: item)
        interactor?.loadRepo(request: request)
    }
}
