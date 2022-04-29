//
//  WelcomeViewController.swift
//  Livscore
//
//  Created by Carlos Cardona on 28/04/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private var completeForm = ""
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    var appLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "applogo2")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var middleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 25
        return view
    }()
    
    var logoImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "logo")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var statsTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.scriptFont(size: 28)
        label.text = "Top Stats"
        return label
    }()
    
    var goalsTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.scriptFont(size: 20)
        label.text = "Goals on Season 21/22"
        return label
    }()
    
    var formLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.scriptFont(size: 20, style: "Light")
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        addSubviews()
        print("hola")
        
        APICaller.shared.fetchData(from: .teamStatistics,
                                   parameters: [
                                   URLQueryItem(name: "league", value: "39"),
                                   URLQueryItem(name: "season", value: "2021"),
                                   URLQueryItem(name: "team", value: "40")
                                   ],
                                   expecting: TeamBody.self) { result in
            switch result {
            case .success(let body):
                self.completeForm = body.response.form!
                let last5 = String(self.completeForm.suffix(5))
                DispatchQueue.main.async {
                    self.formLabel.text = last5
                }
            case .failure(let error):
                self.simpleAlert(title: "Error", message: error.localizedDescription)
                print(error)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logoImageView.frame = CGRect(x: view.width - 140, y: -70, width: 280, height: 280)
        appLogoImageView.frame = CGRect(x: 30, y: 60, width: 200, height: 100)
        middleView.frame = CGRect(x: 0, y: view.height / 6, width: view.width, height: view.height + 100)
        scrollView.frame = view.bounds
        
        scrollView.contentSize = CGSize(width: view.width, height: view.height + 200)
        
        statsTitleLabel.frame = CGRect(x: 20, y: 20, width: middleView.width - 120, height: 42)
        formLabel.frame = CGRect(x: statsTitleLabel.right + 5, y: 20, width: middleView.width - 105, height: 42)
        goalsTitleLabel.frame = CGRect(x: 20, y: formLabel.bottom + 15, width: middleView.width - 40, height: 42)
    }
    
    func configureView() {
        title = "Livscore"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = UIColor(hexString: "#D70040")
    }
    
    func addSubviews() {
        view.addSubview(logoImageView)
        view.addSubview(appLogoImageView)
        view.addSubview(scrollView)
        scrollView.addSubview(middleView)
        middleView.addSubview(statsTitleLabel)
        middleView.addSubview(formLabel)
        middleView.addSubview(goalsTitleLabel)
    }
    

}
