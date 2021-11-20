//
//  EditProfileViewController.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 13/11/21.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var biographyTextField: UITextField!
    @IBOutlet weak var hobbyTextField: UITextField!
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
