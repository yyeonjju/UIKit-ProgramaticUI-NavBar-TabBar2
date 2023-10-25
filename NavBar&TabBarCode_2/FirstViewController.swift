//
//  FirstViewController.swift
//  NavBar&TabBarCode_2
//
//  Created by 하연주 on 2023/10/25.
//

import UIKit

//⭐️ 이 화면을 기본화면으로 사용하도록
class FirstViewController: UIViewController {
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .blue
        button.setTitle("첫번째탭 다음페이지로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 로그인 여부에 관련된 참/거짓 저장하는 속성
    var isLoggedIn = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        // ⭐️ 로그인이 되어있지 않다면 로그인화면 띄우기
        // =====> viewDidAppear가 더 정확한 시점 (뷰가 뜬 다음으로 코드 옮기기) ⭐️⭐️⭐️
        
//        if !isLoggedIn {
//            let vc = LoginViewController()
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: false, completion: nil)
//        }
    }
    
    // 다음화면을 띄우는 더 정확한 시점 ⭐️⭐️⭐️
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // ⭐️ 로그인이 되어있지 않다면 로그인화면 띄우기
        if !isLoggedIn {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
            self.isLoggedIn = true
            
        }
    }
    
    func makeUI () {
        view.backgroundColor = .yellow
        view.addSubview(nextButton)
        
        // (네비게이션바 설정관련) iOS버전 업데이트 되면서 바뀐 설정⭐️⭐️⭐️
        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()  // 불투명으로
        //appearance.backgroundColor = .brown     // 색상설정
        //appearance.configureWithTransparentBackground()  // 투명으로
        
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
//        title = "Main"
        self.navigationItem.title = "Main - 네비게이션 제목"
        
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 180),
            nextButton.heightAnchor.constraint(equalToConstant: 70),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
    }
    
    @objc func nextButtonTapped () {
        let firstViewNextPageController = FirstViewNextPageController()
        firstViewNextPageController.modalPresentationStyle = .fullScreen
        //⭐️⭐️⭐️⭐️⭐️ 네비게이션할려면 present가 아니라 Push⭐️⭐️⭐️⭐️⭐️⭐️⭐️
//        present(firstViewNextPageController, animated: true, completion: nil)
        self.navigationController?.pushViewController(firstViewNextPageController, animated:
        true)
    }


}
