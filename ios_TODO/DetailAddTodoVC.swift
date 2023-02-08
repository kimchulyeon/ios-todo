//
//  DetailAddTodoVC.swift
//  ios_TODO
//
//  Created by chulyeon kim on 2023/02/08.
//

import UIKit
import CoreData

enum TodoPriority: Int16 {
	case row = 0
	case normal = 1
	case high = 2

	var color: UIColor {
		switch self {
		case .row:
			return .systemYellow
		case .normal:
			return .systemGreen
		case .high:
			return .systemRed
		}
	}

	var title: String {
		switch self {
		case .row:
			return "Low"
		case .normal:
			return "Normal"
		case .high:
			return "High"
		}
	}
}

class DetailAddTodoVC: UIViewController {

	//MARK: - properties ============================================
	@IBOutlet weak var datePickerHeightConstraint: NSLayoutConstraint!

	@IBOutlet weak var openCloseButton: UIButton!

	@IBOutlet weak var priority1: UIButton! {
		didSet {
			priority1.layer.cornerRadius = 20
			priority1.setTitle(TodoPriority.row.title, for: .normal)
		}
	}
	@IBOutlet weak var priority2: UIButton! {
		didSet {
			priority2.layer.cornerRadius = 20
			priority2.setTitle(TodoPriority.normal.title, for: .normal)
		}
	}
	@IBOutlet weak var priority3: UIButton! {
		didSet {
			priority3.layer.cornerRadius = 20
			priority3.setTitle(TodoPriority.high.title, for: .normal)
		}
	}
	@IBOutlet weak var titleTextField: UITextField!
	

	var isDatePickerOpen = true
	var selectedPriority = TodoPriority.row.rawValue
	
	var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
	


	//MARK: - lifecycle ============================================
	override func viewDidLoad() {
		super.viewDidLoad()

		openCloseButton.setTitle("close", for: .normal)
	}



	//MARK: - action ============================================
	@IBAction func openCloseDatePicker(_ sender: Any) {
		isDatePickerOpen.toggle()

		UIView.animate(withDuration: 0.25, delay: 0) {
			if self.isDatePickerOpen {
				self.datePickerHeightConstraint.priority = UILayoutPriority(240)
				self.openCloseButton.setTitle("close", for: .normal)

			} else {
				self.datePickerHeightConstraint.priority = UILayoutPriority(1000)
				self.openCloseButton.setTitle("open", for: .normal)
			}

			self.view.layoutIfNeeded()
		}
	}

	@IBAction func selectPriority(_ sender: UIButton) {
		
		priority1.backgroundColor = .clear
		priority1.tintColor = .systemBlue
		priority2.backgroundColor = .clear
		priority2.tintColor = .systemBlue
		priority3.backgroundColor = .clear
		priority3.tintColor = .systemBlue
		
		switch sender.currentTitle {
		case TodoPriority.row.title:
			sender.backgroundColor = TodoPriority.row.color
			sender.tintColor = .white
			selectedPriority = TodoPriority.row.rawValue
		case TodoPriority.normal.title:
			sender.backgroundColor = TodoPriority.normal.color
			sender.tintColor = .white
			selectedPriority = TodoPriority.normal.rawValue
		case TodoPriority.high.title:
			sender.backgroundColor = TodoPriority.high.color
			sender.tintColor = .white
			selectedPriority = TodoPriority.high.rawValue
		default:
			break
		}

	}
	
	@IBAction func tapSaveButton(_ sender: Any) {
		guard let todoListEntity = NSEntityDescription.entity(forEntityName: "TodoList", in: context) else { return }
		guard let todoList = NSManagedObject(entity: todoListEntity, insertInto: context) as? TodoList else { return }
		
		todoList.title = titleTextField.text
		todoList.priorityLevel = selectedPriority
		todoList.date = Date()
	}
	
}
