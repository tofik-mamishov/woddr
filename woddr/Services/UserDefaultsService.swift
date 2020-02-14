//
//  UserDefaultsService.swift
//  woddr
//
//  Created by Tofik Mamishov on 16/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import Foundation

class UserDefaultsService {
    private let defaults = UserDefaults.standard

    func save(key: String, value: Any) {
        self.defaults.set(value, forKey: key)
    }

    func bool(key: String) -> Bool {
        return self.defaults.bool(forKey: key)
    }

    func int(key: String, defaultValue: Int? = 0) -> Int {
        guard let value = self.defaults.object(forKey: key) as? Int else {
                return defaultValue!
        }
        return value
    }
}
