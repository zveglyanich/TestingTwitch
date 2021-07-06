//
//  FeedbackViewController.swift
//  TestingTwitch
//
//  Created by Pavel Zveglyanich on 7/6/21.
//

import UIKit
import AARatingBar

class FeedbackViewController: UIViewController, UITextViewDelegate {

	var ratingbar: AARatingBar?
	
	private let viewBar = UIView()
	private let textView: UITextView = {
		let textview = UITextView()
		textview.text = "Напишите Ваш отзыв"
		textview.font = UIFont.systemFont(ofSize: 20)
		textview.textColor = UIColor.lightGray
		textview.keyboardDismissMode = .onDrag
		return textview
		
	}()
	
	private let sendButton: UIButton = {
		let button = UIButton()
		button.setTitle("Отправить", for: .normal)
		button.titleLabel?.textAlignment = .center
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
		button.setTitleColor(.white, for: .normal)
		button.backgroundColor = .blue
		button.layer.cornerRadius = 25
		button.layer.masksToBounds = true
		button.addTarget(nil, action: #selector(close), for: .touchUpInside)
		return button
	}()
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		textView.delegate = self
		setup()
		
		let ratingbar = viewBar.aa_addRatingBar { $0 }
		self.ratingbar = ratingbar
		
    }
	
	func textViewDidBeginEditing(_ textView: UITextView) {
		if textView.textColor == UIColor.lightGray {
			textView.text = nil
			textView.textColor = UIColor.black
		}
	}

	@objc func close() {
		navigationController?.popViewController(animated: true)
	}
}

private extension FeedbackViewController {
	func setup() {
		[viewBar, textView, sendButton].forEach {view.addSubview($0)}
		viewBar.snp.makeConstraints({ make in
			make.top.equalToSuperview().inset(120)
			make.leading.equalToSuperview().inset(20)
			make.trailing.equalToSuperview().inset(20)
			make.height.equalTo(60)
		})
		sendButton.snp.makeConstraints({ make in
			make.leading.equalToSuperview().inset(20)
			make.bottom.equalToSuperview().inset(60)
			make.trailing.equalToSuperview().inset(20)
			make.height.equalTo(60)
		})

		textView.snp.makeConstraints({ make in
			make.top.equalTo(viewBar.snp.bottom).offset(20)
			make.leading.equalToSuperview().inset(20)
			make.trailing.equalToSuperview().inset(20)
			make.bottom.equalTo(sendButton.snp.top).inset(20)
		})

	}
}
