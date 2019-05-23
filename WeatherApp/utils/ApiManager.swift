//
//  ApiManager.swift
//  WheaterApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import Alamofire
import CoreLocation

typealias OnSuccess<T> = (_ response: T) -> Void
typealias OnFail = (_ error: Error?) -> Void

class ApiManager {
    private static func parseData<T: Decodable>(_ response: DataResponse<Data>, _ type: T.Type, _ onFail: @escaping OnFail) -> T? {
        if let _error = response.error {
            onFail(_error)
        } else {
            do {
                if let _data = response.data, response.error == nil {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    return try decoder.decode(type, from: _data)
                }
                onFail(response.error)
            } catch DecodingError.dataCorrupted(let context) {
                onFail(DecodingError.dataCorrupted(context))
            } catch {
                onFail(error)
            }
        }
        return nil
    }
    
    private static func getApiUrl(_ coords: CLLocationCoordinate2D) -> String {
        let apiKey = "8509ca59d63715fe79b671731751dd30"
        return "https://api.darksky.net/forecast/\(apiKey)/\(coords.latitude),\(coords.longitude)?units=\(Settings.unitSystem.rawValue)&lang=\(Settings.language.rawValue)&exclude=minutely,flags"
    }
    
    static func getWeatherForecast(city: City, onSuccess: @escaping OnSuccess<Forecast>, onFail: @escaping OnFail) {
        Alamofire.request(getApiUrl(city.coordinates)).responseData { response in
            if let _houses = parseData(response, Forecast.self, onFail) {
                onSuccess(_houses)
            }
        }
    }
}
