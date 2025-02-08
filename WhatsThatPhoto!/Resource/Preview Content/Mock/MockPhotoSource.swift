//
//  MockPhotoSource.swift
//  WhatsThatPhoto!
//
//  Created by Rakibur Khan on 08/02/2025.
//

import Foundation

extension PhotoSource {
    static var mock1: Self {
       .init(original: URL(string: "https://images.pexels.com/photos/30473423/pexels-photo-30473423.jpeg"), large: URL(string: "https://images.pexels.com/photos/30473423/pexels-photo-30473423.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"), medium: URL(string: "https://images.pexels.com/photos/30473423/pexels-photo-30473423.jpeg?auto=compress&cs=tinysrgb&h=350"), small: URL(string: "https://images.pexels.com/photos/30473423/pexels-photo-30473423.jpeg?auto=compress&cs=tinysrgb&h=130"), potrait: URL(string: "https://images.pexels.com/photos/30473423/pexels-photo-30473423.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800"), landscape: URL(string: "https://images.pexels.com/photos/30473423/pexels-photo-30473423.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"))
    }
}
