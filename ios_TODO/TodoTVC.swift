//
//  TodoTVC.swift
//  ios_TODO
//
//  Created by chulyeon kim on 2023/02/08.
//

import UIKit

class TodoTVC: UITableViewCell {

	
	@IBOutlet weak var priorityLevel: UIView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	//MARK: - func ============================================
	func configure() {
		selectionStyle = .none
	}
    
}
