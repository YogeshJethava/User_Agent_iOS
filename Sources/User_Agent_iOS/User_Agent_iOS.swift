// The Swift Programming Language
// https://docs.swift.org/swift-book
//
//  UserAgentManager.swift
//  User_Agent_iOS
//
//  Created by Yogesh Jethava on 02/04/24.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif
public class UserAgentManager {
    static let shared = UserAgentManager()
    
    //eg. Darwin/16.3.0
    public func DarwinVersion() -> String {
        var sysinfo = utsname()
        uname(&sysinfo)
        let dv = String(bytes: Data(bytes: &sysinfo.release, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
        return "Darwin/\(dv)"
    }
    
    //eg. CFNetwork/808.3
    public func CFNetworkVersion() -> String {
        let dictionary = Bundle(identifier: "com.apple.CFNetwork")?.infoDictionary!
        let version = dictionary?["CFBundleVersion"] as! String
        return "CFNetwork/\(version)"
    }

    //eg. iOS/10_1
    public func deviceVersion() -> String {
        #if canImport(UIKit)
            let currentDevice = UIDevice.current
            return "\(currentDevice.systemName)/\(currentDevice.systemVersion)"
        #else
            return  ""
        #endif
    }
    
    //eg. iPhone/15_Pro_Max
    public func deviceName() -> String {
        var sysinfo = utsname()
        uname(&sysinfo)
        let deviceIdentifier = String(bytes: Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
        
        let deviceNames: [String: String] = [
            //************ iPOD *************
            "iPod1,1"   : "iPod",               // (Original)
            "iPod2,1"   : "iPod",               // (Second Generation)
            "iPod3,1"   : "iPod",               // (Third Generation)
            "iPod4,1"   : "iPod",               // (Fourth Generation)
            "iPod5,1"   : "iPod",               // (Fifth Generation)
            "iPod7,1"   : "iPod",               // (Sixth Generation)
            "iPod9,1"   : "iPod",               // (Seven Generation)
            
            //************ iPad *************
            "iPad1,1"   : "iPad",               // (Original)
            "iPad1,2"   : "iPad",               // iPad 3G
            "iPad2,1"   : "iPad/2",             // 2nd Gen iPad
            "iPad2,2"   : "iPad/2",             // 2nd Gen iPad GSM
            "iPad2,3"   : "iPad/2",             // 2nd Gen iPad CDMA
            "iPad2,4"   : "iPad/2",             // 2nd Gen iPad New Revision
            "iPad3,1"   : "iPad",               // (3rd Generation)
            "iPad3,2"   : "iPad",               // (3rd Generation)
            "iPad3,3"   : "iPad",               // (3rd Generation)
            "iPad3,4"   : "iPad",               // (4th Generation)
            "iPad3,5"   : "iPad",               // (4th Generation)
            "iPad3,6"   : "iPad",               // (4th Generation)
            "iPad2,5"   : "iPad/Mini",          // (Original)
            "iPad2,6"   : "iPad/Mini",          // (Original)
            "iPad2,7"   : "iPad/Mini",          // (Original)
            "iPad4,1"   : "iPad/Air",           // 5th Generation iPad (iPad Air) - Wifi
            "iPad4,2"   : "iPad/Air",           // 5th Generation iPad (iPad Air) - Cellular
            "iPad4,3"   : "iPad/Air",           // 5th Generation iPad (iPad Air)
            "iPad4,4"   : "iPad/Mini_2",        // (2nd Generation iPad Mini - Wifi)
            "iPad4,5"   : "iPad/Mini_2",        // (2nd Generation iPad Mini - Cellular)
            "iPad4,6"   : "iPad/Mini_2",        // (2nd Generation iPad Mini)
            "iPad4,7"   : "iPad/Mini_3",        // (3rd Generation iPad Mini)
            "iPad4,8"   : "iPad/Mini_3",        // (3rd Generation iPad Mini)
            "iPad4,9"   : "iPad/Mini_3",        // (3rd Generation iPad Mini)
            "iPad5,1"   : "iPad/Mini_4",        // (4th Generation iPad Mini)
            "iPad5,2"   : "iPad/Mini_4",        // (4th Generation iPad Mini)
            "iPad5,3"   : "iPad/Air_2",         // 6th Generation iPad (iPad/Air_2)
            "iPad5,4"   : "iPad/Air_2",         // 6th Generation iPad (iPad/Air_2)
            "iPad6,3"   : "iPad/Pro_9.7-inch",  // iPad/Pro_9.7-inch
            "iPad6,4"   : "iPad/Pro_9.7-inch",  // iPad/Pro_9.7-inch
            "iPad6,7"   : "iPad/Pro_12.9-inch", // iPad/Pro_12.9-inch
            "iPad6,8"   : "iPad/Pro_12.9-inch", // iPad/Pro_12.9-inch
            "iPad7,1"   : "iPad/Pro_12.9-inch", // 2nd Generation iPad Pro 12.5-inch - Wifi
            "iPad7,2"   : "iPad/Pro_12.9-inch", // 2nd Generation iPad Pro 12.5-inch - Cellular
            "iPad7,3"   : "iPad/Pro_10.5-inch", // iPad/Pro_10.5-inch - Wifi
            "iPad7,4"   : "iPad/Pro_10.5-inch", // iPad/Pro_10.5-inch - Cellular
            "iPad7,5"   : "iPad/6",             // iPad/6th_Gen_(WiFi)"
            "iPad7,6"   : "iPad/6",             // iPad/6th_Gen_(WiFi+Cellular)
            "iPad7,11"  : "iPad/7",             // iPad/7th_Gen_10.2-inch_(WiFi)
            "iPad7,12"  : "iPad/7",             // iPad/7th_Gen_10.2-inch_(WiFi+Cellular)
            "iPad8,1"   : "iPad/Pro_11",        // iPad/Pro_11_inch_3rd_Gen_(WiFi)
            "iPad8,2"   : "iPad/Pro_11",        // iPad/Pro_11_inch_3rd_Gen_(1TB, WiFi)
            "iPad8,3"   : "iPad/Pro_11",        // iPad/Pro_11_inch_3rd_Gen_(WiFi+Cellular)
            "iPad8,4"   : "iPad/Pro_11",        // iPad/Pro_11_inch_3rd_Gen_(1TB, WiFi+Cellular)
            "iPad8,5"   : "iPad/Pro_12.9",      // iPad/Pro_12.9_inch_3rd_Gen_(WiFi)
            "iPad8,6"   : "iPad/Pro_12.9",      // iPad/Pro_12.9_inch_3rd_Gen_(1TB, WiFi)
            "iPad8,7"   : "iPad/Pro_12.9",      // iPad/Pro_12.9_inch_3rd_Gen_(WiFi+Cellular)
            "iPad8,8"   : "iPad/Pro_12.9",      // iPad/Pro_12.9_inch_3rd_Gen_(1TB, WiFi+Cellular)
            "iPad8,9"   : "iPad/Pro_11",        // iPad/Pro_11 inch_4th_Gen_(WiFi)
            "iPad8,10"  : "iPad/Pro_11",        // iPad/Pro_11 inch_4th_Gen_(WiFi+Cellular)
            "iPad8,11"  : "iPad/Pro_12.9",      // iPad/Pro_12.9_inch_4th_Gen_(WiFi)
            "iPad8,12"  : "iPad/Pro_12.9",      // iPad/Pro_12.9_inch_4th_Gen_(WiFi+Cellular)
            "iPad11,1"  : "iPad/mini_5",        // iPad/mini_5th_Gen_(WiFi)
            "iPad11,2"  : "iPad/mini_5",        // iPad/mini_5th_Gen
            "iPad11,3"  : "iPad/Air_3",         // iPad/Air_3rd_Gen_(WiFi)
            "iPad11,4"  : "iPad/Air_3",         // iPad/Air_3rd_Gen
            "iPad11,6"  : "iPad/8",             // iPad/8th_Gen_(WiFi)
            "iPad11,7"  : "iPad/8",             // iPad/8th_Gen_(WiFi+Cellular)
            "iPad12,1"  : "iPad/9",             // iPad/9th_Gen_(WiFi)
            "iPad12,2"  : "iPad/9",             // iPad/9th_Gen_(WiFi+Cellular)
            "iPad14,1"  : "iPad/mini_6",        // iPad/mini_6th_Gen_(WiFi)
            "iPad14,2"  : "iPad/mini_6",        // iPad/mini_6th_Gen_(WiFi+Cellular)
            "iPad13,1"  : "iPad/Air_4",         // iPad/Air_4th_Gen_(WiFi)
            "iPad13,2"  : "iPad/Air_4",         // iPad/Air_4th_Gen_(WiFi+Cellular)
            "iPad13,4"  : "iPad/Pro_11",        // iPad/Pro_11_inch_5th_Gen
            "iPad13,5"  : "iPad/Pro_11",        // iPad/Pro_11_inch_5th_Gen
            "iPad13,6"  : "iPad/Pro_11",        // iPad/Pro_11_inch_5th_Gen
            "iPad13,7"  : "iPad/Pro_11",        // iPad/Pro_11_inch_5th_Gen
            "iPad13,8"  : "iPad/Pro_12.9",      // iPad/Pro_12.9_inch_5th_Gen
            "iPad13,9"  : "iPad/Pro_12.9",      // iPad/Pro_12.9_inch_5th_Gen
            "iPad13,10" : "iPad/Pro_12.9",      // iPad/Pro_12.9_inch_5th_Gen
            "iPad13,11" : "iPad/Pro_12.9",      // iPad/Pro_12.9_inch_5th_Gen
            "iPad13,16" : "iPad/Air_5",         // iPad/Air_5th_Gen_(WiFi)
            "iPad13,17" : "iPad/Air_5",         // iPad/Air_5th_Gen_(WiFi+Cellular)
            "iPad13,18" : "iPad/10",            // iPad/10th_Gen
            "iPad13,19" : "iPad/10",            // iPad/10th_Gen
            "iPad14,3"  : "iPad/Pro_11",        // iPad/Pro_11_inch_4th_Gen
            "iPad14,4"  : "iPad/Pro_11",        // iPad/Pro_11_inch_4th_Gen
            "iPad14,5"  : "iPad/Pro_12.9",      // iPad/Pro_12.9_inch_6th_Gen
            "iPad14,6"  : "iPad/Pro_12.9",      // iPad/Pro_12.9_inch_6th_Gen
            
            //************ iPhone *************
            "iPhone1,1" : "iPhone",             // (Original)
            "i386"      : "iPhone/Simulator",   // iPhone Simulator
            "x86_64"    : "iPhone/Simulator",   // iPhone Simulator
            "arm64"     : "iPhone/Simulator",   // iPhone Simulator
            "iPhone1,2" : "iPhone/3G",          // (3G)
            "iPhone2,1" : "iPhone/3GS",         // (3GS)
            "iPhone3,1" : "iPhone/4",           // (GSM)
            "iPhone3,2" : "iPhone/4",           // iPhone 4
            "iPhone3,3" : "iPhone/4",           // (CDMA/Verizon/Sprint)
            "iPhone4,1" : "iPhone/4S",          // iPhone 4S
            "iPhone5,1" : "iPhone/5",           // iPhone 5 (GSM)
            "iPhone5,2" : "iPhone/5",           // iPhone 5 (GSM+CDMA)
            "iPhone5,3" : "iPhone/5c",          // iPhone 5C (GSM)
            "iPhone5,4" : "iPhone/5c",          // iPhone 5C (Global)
            "iPhone6,1" : "iPhone/5s",          // iPhone 5S (GSM)
            "iPhone6,2" : "iPhone/5s",          // iPhone 5S (Global)
            "iPhone7,2" : "iPhone/6",           // iPhone 6
            "iPhone7,1" : "iPhone/6_Plus",      // iPhone 6 Plus
            "iPhone8,1" : "iPhone/6s",          // iPhone 6s
            "iPhone8,2" : "iPhone/6s_Plus",     // iPhone 6s Plus
            "iPhone9,1" : "iPhone/7",           // iPhone 7
            "iPhone9,3" : "iPhone/7",           // iPhone 7
            "iPhone9,2" : "iPhone/7_Plus",      // iPhone 7 Plus
            "iPhone9,4" : "iPhone/7_Plus",      // iPhone 7 Plus
            "iPhone10,1": "iPhone/8",           // iPhone 8
            "iPhone10,4": "iPhone/8",           // iPhone 8
            "iPhone10,2": "iPhone/8_Plus",      // iPhone 8 Plus
            "iPhone10,5": "iPhone/8_Plus",      // iPhone 8 Plus
            "iPhone10,3": "iPhone/X",           // iPhone X Global
            "iPhone10,6": "iPhone/X",           // iPhone X GSM
            "iPhone11,2": "iPhone/XS",          // iPhone XS
            "iPhone11,4": "iPhone/XS_Max",      // iPhone XS MAX
            "iPhone11,6": "iPhone/XS_Max",      // iPhone XS MAX
            "iPhone11,8": "iPhone/XR",          // iPhone XS XR
            "iPhone12,1": "iPhone/11",          // iPhone 11
            "iPhone12,3": "iPhone/11_Pro",      // iPhone 11 Pro
            "iPhone12,5": "iPhone/11_Pro_Max",  // iPhone 11 Pro Max
            "iPhone13,1": "iPhone/12_mini",     // iPhone 12 Mini
            "iPhone13,2": "iPhone/12",          // iPhone 12
            "iPhone13,3": "iPhone/12_Pro",      // iPhone 12 Pro
            "iPhone13,4": "iPhone/12_Pro_Max",  // iPhone 12 Pro Max
            "iPhone14,4": "iPhone/13_mini",     // iPhone 13 Mini
            "iPhone14,5": "iPhone/13",          // iPhone 13
            "iPhone14,2": "iPhone/13_Pro",      // iPhone 13 Pro
            "iPhone14,3": "iPhone/13_Pro_Max",  // iPhone 13 Pro Max
            "iPhone14,7": "iPhone/14",          // iPhone 14
            "iPhone14,8": "iPhone/14_Plus",     // iPhone 14 Plus
            "iPhone15,2": "iPhone/14_Pro",      // iPhone 14 Pro
            "iPhone15,3": "iPhone/14_Pro_Max",  // iPhone 14 Pro Max
            "iPhone8,4" : "iPhone/SE",          // iPhone SE (GSM)
            "iPhone12,8": "iPhone/SE",          // iPhone SE 2nd Gen
            "iPhone14,6": "iPhone/SE",          // iPhone SE 3rd Gen
            "iPhone15,4" : "iPhone/15",         // iPhone 15
            "iPhone15,5" : "iPhone/15_Plus",    // iPhone 15 Plus
            "iPhone16,1" : "iPhone/15_Pro",     // iPhone 15 Pro
            "iPhone16,2" : "iPhone/15_Pro_Max", // iPhone 15 Pro Max
            
            //************ Watch *************
            "Watch1,1"  : "AppleWatch",   // Apple Watch 38mm case
            "Watch1,2"  : "AppleWatch",   // Apple Watch 42mm case
            "Watch2,6"  : "AppleWatch/Series_1",  // Apple Watch Series 1 38mm case
            "Watch2,7"  : "AppleWatch/Series_1",  // Apple Watch Series 1 42mm case
            "Watch2,3"  : "AppleWatch/Series_2",  // Apple Watch Series 2 38mm case
            "Watch2,4"  : "AppleWatch/Series_2",  // Apple Watch Series 2 42mm case
            "Watch3,1"  : "AppleWatch/Series_3",   // Apple Watch Series 3 38mm case (GPS+Cellular)
            "Watch3,2"  : "AppleWatch/Series_3",   // Apple Watch Series 3 42mm case (GPS+Cellular)
            "Watch3,3"  : "AppleWatch/Series_3",    // Apple Watch Series 3 38mm case (GPS)
            "Watch3,4"  : "AppleWatch/Series_3",    // Apple Watch Series 3 42mm case (GPS)
            "Watch4,1"  : "AppleWatch/Series_4",    // Apple Watch Series 4 40mm case (GPS)
            "Watch4,2"  : "AppleWatch/Series_4",    // Apple Watch Series 4 44mm case (GPS)
            "Watch4,3"  : "AppleWatch/Series_4",   // Apple Watch Series 4 40mm case (GPS+Cellular)
            "Watch4,4"  : "AppleWatch/Series_4",   // Apple Watch Series 4 44mm case (GPS+Cellular)
            "Watch5,1"  : "AppleWatch/Series_5",    // Apple Watch Series 5 40mm case (GPS)
            "Watch5,2"  : "AppleWatch/Series_5",    // Apple Watch Series 5 44mm case (GPS)
            "Watch5,3"  : "AppleWatch/Series_5",   // Apple Watch Series 5 40mm case (GPS+Cellular)
            "Watch5,4"  : "AppleWatch/Series_5",   // Apple Watch Series 5 44mm case (GPS+Cellular)
            "Watch5,9"  : "AppleWatch/SE",  // Apple Watch SE 40mm case (GPS)
            "Watch5,10" : "AppleWatch/SE", // Apple Watch SE 44mm case (GPS)
            "Watch5,11" : "AppleWatch/SE",    // Apple Watch SE 40mm case (GPS+Cellular)
            "Watch5,12" : "AppleWatch/SE",    // Apple Watch SE 44mm case (GPS+Cellular)
            "Watch6,1"  : "AppleWatch/Series_6",    // Apple Watch Series 6 40mm case (GPS)
            "Watch6,2"  : "AppleWatch/Series_6",    // Apple Watch Series 6 44mm case (GPS)
            "Watch6,3"  : "AppleWatch/Series_6",   // Apple Watch Series 6 40mm case (GPS+Cellular)
            "Watch6,4"  : "AppleWatch/Series_6",   // Apple Watch Series 6 44mm case (GPS+Cellular)
            "Watch6,6"  : "AppleWatch/Series_7",    // Apple Watch Series 7 41mm case (GPS)
            "Watch6,7"  : "AppleWatch/Series_7",    // Apple Watch Series 7 45mm case (GPS)
            "Watch6,8"  : "AppleWatch/Series_7",   // Apple Watch Series 7 41mm case (GPS+Cellular)
            "Watch6,9"  : "AppleWatch/Series_7",   // Apple Watch Series 7 45mm case (GPS+Cellular)
            "Watch6,10" : "AppleWatch/SE", // Apple Watch SE 40mm case (GPS)
            "Watch6,11" : "AppleWatch/SE", // Apple Watch SE 44mm case (GPS)
            "Watch6,12" : "AppleWatch/SE",    //Apple Watch SE 40mm case (GPS+Cellular)
            "Watch6,13" : "AppleWatch/SE",    // Apple Watch SE 44mm case (GPS+Cellular)
            "Watch6,14" : "AppleWatch/Series_8",   // Apple Watch Series 8 41mm case (GPS)
            "Watch6,15" : "AppleWatch/Series_8",   // Apple Watch Series 8 45mm case (GPS)
            "Watch6,16" : "AppleWatch/Series_8",  // Apple Watch Series 8 41mm case (GPS+Cellular)
            "Watch6,17" : "AppleWatch/Series_8",  // Apple Watch Series 8 45mm case (GPS+Cellular)
            "Watch6,18" : "AppleWatch/Ultra",  // Apple Watch Ultra
            "Watch7,1"  : "AppleWatch/Series_9",    // Apple Watch Series 9 41mm case (GPS)
            "Watch7,2"  : "AppleWatch/Series_9",    // Apple Watch Series 9 45mm case (GPS)
            "Watch7,3"  : "AppleWatch/Series_9",   // Apple Watch Series 9 41mm case (GPS+Cellular)
            "Watch7,4"  : "AppleWatch/Series_9",   // Apple Watch Series 9 45mm case (GPS+Cellular)
            "Watch7,5"  : "AppleWatch/Ultra_2", // Apple Watch Ultra 2
        ]
      
        let deviceName = deviceNames[deviceIdentifier]
        return deviceName ?? deviceIdentifier
        
    }
    
    //eg. MyApp/1
    public func appNameAndVersion() -> String {
        guard let dictionary = Bundle.main.infoDictionary else {
            return ""
        }
        let version = dictionary["CFBundleShortVersionString"] as! String
        let name = dictionary["CFBundleName"] as! String
        return "\(name)/\(version)"
    }

    public func UAString() -> String {
        return "\(CFNetworkVersion()) \(DarwinVersion()) (\(deviceName()) \(deviceVersion()))"
    }
}
