//
//  ViewController.swift
//  ios_TODO
//
//  Created by chulyeon kim on 2023/02/08.
//

import UIKit

class TodoListVC: UIViewController {

	@IBOutlet weak var tableView: UITableView! {
		didSet {
			tableView.delegate = self
			tableView.dataSource = self
		}
	}
	
	//MARK: - lifecycle ============================================
	override func viewDidLoad() {
		super.viewDidLoad()
		
		registerCell()
	}
	
	//MARK: - func ============================================
	func registerCell() {
		let cellNib = UINib(nibName: "TodoTVC", bundle: nil)
		tableView.register(cellNib, forCellReuseIdentifier: "TodoTVC")
	}
	
	//MARK: - action ============================================
	@IBAction func moveToAddTodo(_ sender: Any) {
		let addTodoVC = DetailAddTodoVC()
		
		present(addTodoVC, animated: true)
	}
}


//MARK: - UITableViewDelegate, UITableViewDataSource ============================================
extension TodoListVC: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 20
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTVC", for: indexPath) as? TodoTVC else { return UITableViewCell()}
		
		return cell
	}
}

