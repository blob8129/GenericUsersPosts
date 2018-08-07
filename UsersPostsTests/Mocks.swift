//
//  Mocks.swift
//  UsersPostsTests
//
//  Created by Andrey Volobuev on 8/6/18.
//  Copyright © 2018 blob8129. All rights reserved.
//

import Foundation
@testable import UsersPosts



class SessionMock: SessionProtocol {

    var data: Data?
    var urlResponse: URLResponse?
    var error: Error?
    
    func dataTask(with url: URL,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let dataMock = DataTaskMock()
        dataMock.data = data
        dataMock.urlResponse = urlResponse
        dataMock.mockError = error
        dataMock.completionHandler = completionHandler
        return dataMock
    }
}

class DataTaskMock: URLSessionDataTask  {
    var data: Data?
    var urlResponse: URLResponse?
    var mockError: Error?
    
    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
    
    override func resume() {
        completionHandler?(data, urlResponse, mockError)
    }
}
