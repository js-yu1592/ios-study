//
//  SceneDelegate.m
//  ProjectWithoutStoryboard_objective_c
//
//  Created by 유준상 on 2020/12/14.
//

#import "SceneDelegate.h"
#import "ViewController.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate

// 화면 연결 전
- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    //윈도우 씬 인스턴스 생성
    UIWindowScene* windowScene = (UIWindowScene*) scene;
    
    //윈도우의 크기 설정
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //뷰컨트롤러 인스턴스 생성
    ViewController* initialVC = [[ViewController alloc] init];
    
    //네비게이션 컨트롤러 설정
    UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:initialVC];
    
    //루트 뷰 컨트롤러 설정
    _window.rootViewController = navVC;
    
    // 화면에 보이게끔 설정
    [_window makeKeyAndVisible];
    
    //윈도우씬을 설정
    _window.windowScene = windowScene;
    
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
