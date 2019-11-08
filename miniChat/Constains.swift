//
//  Constains.swift
//  miniChat
//
//  Created by rtc hubs on 10/31/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import Foundation

typealias CompletionHandler  = (_ success: Bool)->()

let TO_LOGIN = "toLogin"

let TO_CREATE_ACCOUNT = "toCreateAccount"
let TO_CHANNEL_VIEW = "SegueForBackTochannel"
let TO_AVATER_PICKER = "toCreateAvater"

let TOKEN_KEY = "token"

let LOGGED_IN_KEY = "loggedIn"

let USER_NAME = "userName"
let USER_UID = "user_uid"
let USER_EMAIL = "userEmail"
//let BASE_URL = "http://192.168.0.102/imakara_backend_api/api/v1/user/photo/test"
let BASE_URL = "https://api.mest.info/api/v1/"
let IMG_URL = "https://api.mest.info/api/v1/user/photo/test"

let HEADER = [
     "Content-type": "application/json; charset=UTF-8"]

let MY_SERVER_URL = "https://jsonplaceholder.typicode.com/"

let POST_GITHUB = "\(MY_SERVER_URL)/posts"


let URL_REGISTER = "\(BASE_URL)register"
let URL_LOGIN = "\(BASE_URL)login"


