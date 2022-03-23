//
//  HttpError.swift
//  Data
//
//  Created by Rafael Nunes Rios on 3/18/22.
//

import Foundation

public enum HttpError: Error {
    case noConnectivity
    case badRequest
    case serverError
    case unauthorized
    case forbidden
}
