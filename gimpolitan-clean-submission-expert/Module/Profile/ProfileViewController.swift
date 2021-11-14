//
//  ProfileViewController.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 13/11/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtShortBiography: UILabel!
    @IBOutlet weak var txtHobby: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfileImage()
    }
    override func viewDidAppear(_ animated: Bool) {
        loadProfile()
    }
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let editProfileVC = EditProfileViewController()
        editProfileVC.saveCallback = {
            self.loadProfile()
        }
        present(editProfileVC, animated: true)
    }
    private func setupProfileImage() {
        imgProfile.image = UIImage(named: "GalangAji")
        imgProfile.setupCorners(cornerRadius: .circle)
    }
    private func loadProfile() {
        Profile.synchronize()
        txtName.text = Profile.name
        txtShortBiography.text = Profile.biography
        txtHobby.text = Profile.hobby
    }
}
