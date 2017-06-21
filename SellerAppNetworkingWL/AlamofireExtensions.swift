//
//  AlamofireExtensions.swift
//  SAA
//
//  Created by Weston Chambers on 3/2/15.
//  Copyright (c) 2015 Deloitte Digital. All rights reserved.
//

import Foundation
import Alamofire

extension DataRequest
{
    
    
    /*
     BEFORE
    public static func WorklightResponseSerializer(options: JSONSerialization.ReadingOptions = .allowFragments) -> DataResponseSerializer<Any>
    {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            
            if let response = response, response.statusCode == 204 { return .success(NSNull()) }
            
            guard let validData = data, validData.count > 0 else {
                let failureReason = "JSON could not be serialized. Input data was nil or zero length."
                let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
                let error = NSError(domain: "Error.domain", code: 1000, userInfo: userInfo) //Before Error.Domain and Error.Code.JSONSerializationFailed.rawValue
                return .failure(error)
            }
            
            do {
                var rawString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
                if rawString.hasPrefix("/*-secure-") {
                    rawString = rawString.replacingCharacters(in: NSMakeRange(0, 10), with: "") as NSString
                }
                if rawString.hasSuffix("*/") {
                    rawString = rawString.replacingCharacters(in: NSMakeRange(rawString.length - 2, 2), with: "") as NSString
                }
                let sanitizedData = rawString.data(using: String.Encoding.utf8.rawValue)!
                let JSON = try JSONSerialization.jsonObject(with: sanitizedData, options: options)
                return .success(JSON)
            } catch {
                return .failure(error as NSError)
            }
        }
    }*/
    
    
    /*
    public class func WorklightResponseSerializer(options: NSJSONReadingOptions = .AllowFragments) -> Serializer {
        return { (request, response, data) in
            if data == nil || data?.length == 0 {
                return (nil, nil)
            }
            
            var serializationError: NSError?
            var rawString = NSString(data: data!, encoding: NSUTF8StringEncoding)!
            if rawString.hasPrefix("/*-secure-") {
                rawString = rawString.stringByReplacingCharactersInRange(NSMakeRange(0, 10), withString: "")
            }
            if rawString.hasSuffix("*/") {
                rawString = rawString.stringByReplacingCharactersInRange(NSMakeRange(rawString.length - 2, 2), withString: "")
            }
            let sanitizedData = rawString.dataUsingEncoding(NSUTF8StringEncoding)!
            let JSON: AnyObject? = NSJSONSerialization.JSONObjectWithData(sanitizedData, options: options, error: &serializationError)
            return (JSON, serializationError)
        }
    }
    */
    public func responseWorklight(completionHandler: @escaping (DataResponse<Data>) -> Void) -> Self
    {
    
        return responseData(completionHandler: { (response) in
            
            let queue = DispatchQueue(label: "Services.Worklight.Concurrent")
            queue.async {
                var newResponse = response
                if let theError = response.result.error{
                    if (theError as NSError).code == 3840 {
                        let error:NSError = NSError(domain: NSCocoaErrorDomain, code: 3840, userInfo:[NSLocalizedDescriptionKey:"Servicio no disponible."])
                        let newResult = Result<Data>.failure(error)
                        newResponse = DataResponse(request: response.request, response: response.response, data: response.data, result: newResult)
                    }
                }
                completionHandler(newResponse)
            }
        
            /*
            var newResponse = response
            if let theError = response.result.error{
                if (theError as NSError).code == 3840 {
                    let error:NSError = NSError(domain: NSCocoaErrorDomain, code: 3840, userInfo:[NSLocalizedDescriptionKey:"Servicio no disponible."])
                    let newResult = Result<Data>.failure(error)
                    newResponse = DataResponse(request: response.request, response: response.response, data: response.data, result: newResult)
                }
            }
            completionHandler(newResponse)*/
        
        })

    }
    
}
