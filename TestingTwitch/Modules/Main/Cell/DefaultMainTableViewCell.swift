//
//  DefaultMainTableViewCell.swift
//  TestingTwitch
//
//  Created by Pavel Zveglyanich on 7/6/21.
//

import UIKit
import Kingfisher

class DefaultMainTableViewCell: UITableViewCell {
	
	static let height: CGFloat = 120
	
	var imputViewModel: DataModel? {
		didSet {
			guard let object = imputViewModel else { return }
			nameGameLabel.text = object.name
			countCanalsLabel.text = String(object.channels)
			countSeesLabel.text = String(object.viewers)
			
			if let url = URL(string: object.image) {
				iconImageView.kf.setImage(with: url)
			}
		}
	}
	
	private let iconImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.backgroundColor = .blue
		return imageView
	}()
	
	private let nameGameLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 1
		label.textAlignment = .left
		label.font = UIFont.boldSystemFont(ofSize: 12)
		return label
	}()
	
	private let countCanalsLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.textAlignment = .left
		label.font = UIFont.boldSystemFont(ofSize: 10)
		return label
	}()
	
	private let countSeesLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.textAlignment = .left
		label.font = UIFont.boldSystemFont(ofSize: 10)
		return label
	}()
	
	// MARK: Initializers
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setup()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(with object: DataModel) {
		imputViewModel = object
	}
}

private extension DefaultMainTableViewCell {
	func setup() {
		[iconImageView, nameGameLabel, countCanalsLabel, countSeesLabel].forEach {contentView.addSubview($0)}
		
		iconImageView.snp.makeConstraints({ make in
			make.top.equalToSuperview().inset(20)
			make.leading.equalToSuperview().inset(20)
			make.width.equalTo(100)
			make.bottom.equalToSuperview().inset(20)
		})
		nameGameLabel.snp.makeConstraints({ make in
			make.top.equalTo(iconImageView.snp.top)
			make.leading.equalTo(iconImageView.snp.trailing).offset(20)
			make.height.equalTo(20)
			make.trailing.equalToSuperview().inset(20)
		})
		countCanalsLabel.snp.makeConstraints({ make in
			make.top.equalTo(nameGameLabel.snp.bottom).offset(10)
			make.leading.equalTo(iconImageView.snp.trailing).offset(20)
			make.height.equalTo(20)
			make.trailing.equalToSuperview().inset(20)
		})
		countSeesLabel.snp.makeConstraints({ make in
			make.top.equalTo(countCanalsLabel.snp.bottom).offset(10)
			make.leading.equalTo(iconImageView.snp.trailing).offset(20)
			make.bottom.equalTo(iconImageView.snp.bottom)
			make.trailing.equalToSuperview().inset(20)
		})
	}
	

}
