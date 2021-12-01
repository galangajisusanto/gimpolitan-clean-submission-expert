//
//  EditProfileViewController.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 13/11/21.
//

import UIKit
import Core

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var biographyTextField: UITextField!
    @IBOutlet weak var hobbyTextField: UITextField!
    @IBOutlet weak var closeButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var biographyLabel: UILabel!
    @IBOutlet weak var hobbyLabel: UILabel!
    @IBOutlet weak var navItem: UINavigationItem!
    var saveCallback: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToView()
    }
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        saveProfile()
        dismiss(animated: true, completion: nil)
    }
    private func bindToView() {
        closeButton.title = "close".localized()
        saveButton.title = "save".localized()
        nameLabel.text = "name".localized()
        biographyLabel.text = "biography".localized()
        hobbyLabel.text = "hobby".localized()
        navItem.title = "edit_profile".localized()
        nameTextField.text = Profile.name
        biographyTextField.text = Profile.biography
        hobbyTextField.text = Profile.hobby
    }
    private func saveProfile() {
        Profile.name = nameTextField.text ?? ""
        Profile.biography = biographyTextField.text ?? ""
        Profile.hobby = hobbyTextField.text ?? ""
        Profile.synchronize()
        self.saveCallback?()
    }
    
}
