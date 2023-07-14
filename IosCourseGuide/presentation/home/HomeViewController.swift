//
//  HomeViewController.swift
//  IosCourseGuide
//
//  Created by MacBook Pro on 13/07/23.
//

import UIKit

class HomeViewController: UIViewController,IHomePresenter, UITableViewDelegate, UITableViewDataSource{
   
    var presenter = HomePresenter()

    @IBOutlet weak var tabHome: UITableView!
    var listTest :[RecipesModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegado = self
        presenter.getList()
        tabHome.register(UINib(nibName: "RowHomeViewCell", bundle: nil), forCellReuseIdentifier: "rowHome")
      
        tabHome.delegate = self
        tabHome.dataSource = self
        tabHome.separatorStyle = .none
        tabHome.showsVerticalScrollIndicator = false
        // Do any additional setup after loading the view.
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
    
    
    func loadList(list: [RecipesModel]) {
        listTest = list
        DispatchQueue.main.async {self.tabHome.reloadData()}
    
    }
    
    func errorService(message: String) {
        showErrorMessage(message){_ in }
    }
    
    
}
