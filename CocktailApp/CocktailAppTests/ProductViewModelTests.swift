//
//  ProductViewModelTests.swift
//  CocktailAppTests
//
//  Created by Chirag on 28/12/22.
//

import XCTest
@testable import CocktailApp

final class ProductViewModelTests: XCTestCase {
    
    private var viewModel: ProductViewModel!
    private var dataService: APIService!


    override func setUpWithError() throws {
        dataService = APIService()
        viewModel = ProductViewModel(dataService: dataService)
        
    }
    
    override func tearDownWithError() throws {
        dataService = nil
        viewModel = nil
    }
  
    func testProductListEmpty() {
        viewModel.fetchProductList()
        XCTAssertTrue(viewModel.products.isEmpty)
    }
    
    func testIsShowDetailsShouldBeFalse() {
        XCTAssertFalse(viewModel.isHideLoader)
    }
    

   
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
