//
//  HomeViewController.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 16/07/23.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var initialViewController : UIViewController?
    private var viewModel = HomeViewModel()
    let diposeBag = DisposeBag()
    var listTest :[RecipesModel] = []

    @IBOutlet weak var tabHome: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabHome.register(UINib(nibName: "RowHomeViewCell", bundle: nil), forCellReuseIdentifier: "rowHome")
        tabHome.delegate = self
        tabHome.dataSource = self
        tabHome.separatorStyle = .none
        tabHome.showsVerticalScrollIndicator = false
        viewModel.getlistHome()
    }
    
    func configObserver(){
        viewModel.successList.subscribe(onNext: {list in
            self.listTest = list
            self.tabHome.reloadData()
            
        }
        ).disposed(by:diposeBag)
        
        viewModel.errorList.subscribe(onNext: {error in
            self.showErrorMessage(error){_ in }
            
        }).disposed(by:diposeBag)
    }
    
    func tableView(_ tableView: UITableView,heightForRowAt indexPath : IndexPath) -> CGFloat {return 200}
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return listTest.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let row = tabHome.dequeueReusableCell(withIdentifier: "rowHome",for : indexPath) as! RowHomeViewCell
           row.rowTitle?.text = listTest[indexPath.row].title
           row.rowDescription?.text = listTest[indexPath.row].description
           
          Utils.setImageUrlService(urlMaggi: listTest[indexPath.row].urlImg,row: row)
           row.rowView.layer.cornerRadius = 20
          return row
       }

}

class HomeNavigation {
    
    static func newInstance(usingNavigationFactory factory : NavigationFactory) -> UINavigationController{
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        return factory(view)
    }
}
