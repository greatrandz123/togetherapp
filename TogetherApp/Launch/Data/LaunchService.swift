//
//  LaunchService.swift
//  TogetherApp
//
//  Created by Randolf Dini-ay on 10/8/21.
//

import Foundation
import RxSwift

final class LaunchService {
    typealias T = LaunchCoordinator.scene
    
    func load() -> Observable<LaunchCoordinator.scene> {
        let observer = Observable<LaunchCoordinator.scene>
            .create { (observer) -> Disposable in
            
            self.launch(observer: observer)
            return Disposables.create()
        }
        return observer
    }
    
    private func launch(observer: AnyObserver<LaunchCoordinator.scene>) {
        
        observer.onNext(.dashboard)
        observer.onCompleted()
    }
    
}
