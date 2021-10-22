//
//  TogetherAppTests.swift
//  TogetherAppTests
//
//  Created by Randolf Dini-ay on 10/8/21.
//

import XCTest
import RxSwift
@testable import TogetherApp

class MockDashboardService: DashboardServiceProtocol {
    
    var loadCurrentWeekStepsCount = 0
    var mockValue = "Success"
    var loadCurrentWeekStepsObserver: AnyObserver<[DayStep]>?
    
    func loadCurrentWeekSteps() -> Observable<[DayStep]> {
        
        let observer = Observable<[DayStep]>
            .create { (observer) -> Disposable in
                
            self.loadCurrentWeekStepsCount += 1
            self.loadCurrentWeekStepsObserver = observer
                
            return Disposables.create()
        }
        return observer
        
    }
    
    func triggerOnNext() {
        if let mockObserver = loadCurrentWeekStepsObserver {
            mockObserver.onNext([])
            mockObserver.onCompleted()
        }
    }
    
    func triggerOnError() {
        if let mockObserver = self.loadCurrentWeekStepsObserver {
            
        }
    }
    
}

class TogetherAppTests: XCTestCase {
    
    let disposeBag = DisposeBag()
    var mockDashboardService: MockDashboardService = MockDashboardService()
    
    func testLoadCurrentWeekStepsSuccess() throws {
        
        // action
        let _ = mockDashboardService.loadCurrentWeekSteps()
            .subscribe(
                onNext: { response in
                    XCTAssertNotNil(response)
            },
                onError: { error in
                    XCTFail("there should be no error in this test case")
            },
                onCompleted: {
            },
                onDisposed: {
                    print("Test Disposed")
            }
            )
            .disposed(by: disposeBag)
        
        mockDashboardService.triggerOnNext()
        
        // verify
        XCTAssertEqual(mockDashboardService.loadCurrentWeekStepsCount, 1)
        
    }
    
    func testLoadCurrentWeekStepsFailkure() throws {
        
        // action
        let _ = mockDashboardService.loadCurrentWeekSteps()
            .subscribe(
                onNext: { response in
                    XCTAssertNotNil(response)
            },
                onError: { error in
                    XCTFail("there should be no error in this test case")
                    
            },
                onCompleted: {
            },
                onDisposed: {
                    print("Test Disposed")
            }
            )
            .disposed(by: disposeBag)
        
        mockDashboardService.triggerOnError()
        
        // verify
        XCTAssertEqual(mockDashboardService.loadCurrentWeekStepsCount, 1)
        
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
