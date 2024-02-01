//
//  SwiftUITodoWalkthroughTests.swift
//  SwiftUITodoWalkthroughTests
//
//  Created by Austin Dobberfuhl on 2/1/24.
//

import XCTest
@testable import SwiftUITodoWalkthrough

final class SwiftUITodoWalkthroughTests: XCTestCase {
    
    var todoSection: TodoSection?
    let expectedTodo = Todo(id: UUID(), markedComplete: true, title: "School")
    let expectedSections = TodoSection(sectionTitle: "new section", todos: [])
    var controller = TodosController()

    override func setUpWithError() throws {
        self.todoSection = TodoSection(id: UUID(), sectionTitle: "Bob", todos: [expectedTodo])
        self.controller = TodosController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testSectionCreation() {
        XCTAssertNotNil(todoSection)
    }
    
    func testcontrollerCreated() {
        XCTAssertNotNil(controller)
    }
    
    func testTodoCreation() {
        XCTAssertTrue(todoSection!.todos.contains(expectedTodo))
        
    }
    
   
    func testEditTodo() {
        
    }
    
    func testDeleteTodo() {
        
    }
    
    func testAddTodo() {
        
        let add = CreateToNewView(todoController: controller)
        XCTAssertNotNil(add.todosController.sections.first)
        add.addNewTodo("homeywork", for: add.todosController.sections.first!)
        if let section = add.todosController.sections.first {
          XCTAssertNotNil(section.todos.first)
          if let todo = section.todos.last {
            print(todo)
            XCTAssert(todo.title == "homeywork")
          }
        }
      }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
