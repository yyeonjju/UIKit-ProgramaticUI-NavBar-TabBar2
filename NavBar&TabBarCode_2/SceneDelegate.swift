//
//  SceneDelegate.swift
//  NavBar&TabBarCode_2
//
//  Created by 하연주 on 2023/10/25.
//

import UIKit

//⭐️⭐️⭐️⭐️⭐️ 시작하는뷰에다가 어떻게 ⭐️네비게이션바/탭바⭐️를 넣는가?
// => SceneDelegate 사용해야한다

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    //⭐️⭐️⭐️⭐️⭐️⭐️ 첫화면이 뜨기전에(willConnectTo), 탭바를 내장시키기 ⭐️⭐️⭐️⭐️⭐️⭐️
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let _ = (scene as? UIWindowScene) else { return }
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        window?.backgroundColor = .brown //전체적 배경색 해줄려면 이렇게해야하네..
        
        //⭐️ 탭바 컨트롤러 생성
        let tabBarVC = UITabBarController()
        
        //⭐️ 첫번째 화면은 네비게이션 컨트롤러로 만들기 ( 기본루트뷰 설정)
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
//        let vc2 = SecondViewController()
        let vc3 = ThirdViewController()
        let vc4 = FourthViewController()
        
//        FirstViewController().view.backgroundColor = .gray
        vc1.navigationBar.backgroundColor = .yellow
        
        // 탭바 이름들 설정
//        vc1.title = "Main"
//        vc2.title = "Search"
//        vc3.title = "Post"
//        vc4.title = "Likes"

        // 탭바로 사용하기 위한 뷰 컨트롤러들 설정
        tabBarVC.setViewControllers([vc1,vc2,vc3,vc4], animated: true)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.backgroundColor = .gray
        
        // 탭바 이름/이미지 설정 (이미지는 애플이 제공하는 것으로 사용)
        guard let items = tabBarVC.tabBar.items else { return }
        items[0].title = "Main"
        items[1].title = "Search"
        items[2].title = "Post"
        items[3].title = "Likes"
        
        items[0].image = UIImage(systemName: "trash")
        items[1].image = UIImage(systemName: "folder")
        items[2].image = UIImage(systemName: "paperplane")
        items[3].image = UIImage(systemName: "doc")


        //⭐️⭐️⭐️⭐️⭐️⭐️ 기본루트뷰를 탭바컨트롤러로 설정 ⭐️⭐️⭐️⭐️⭐️⭐️
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible() //⭐️ 스토리보드로 만들때는 자동으로 로직이 들어가있는데 코드로 짜줄 때는 이렇게 해줘야한다
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

