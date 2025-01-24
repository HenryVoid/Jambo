//
//  LocationClient.swift
//  Jambo
//
//  Created by 송형욱 on 1/24/25.
//

import Foundation
import Dependencies
import DependenciesMacros
import CoreLocation

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    static let shared: LocationManager = .init()
    private var manager: CLLocationManager = .init()
    @Published var location: CLLocation? = nil
    @Published var isOn: Bool = false
    
    override init() {
        super.init()
        self.manager.delegate = self
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
    }
    
    func requestUseAuthorization() {
        self.manager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.location = location
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            Log.debug("권한 설정")
            self.isOn = true
        case .notDetermined:
            Log.debug("권한 설정 안 됨")
            self.isOn = false
        case .restricted, .denied:
            Log.debug("권한 요청 거부")
            self.isOn = false
        default:
            Log.debug("알 수 없는 위치")
            self.isOn = false
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Log.error("위치 정보를 가져오는데 실패했습니다.", error.localizedDescription)
        guard let clError = error as? CLError else { return }
        switch clError.code {
        case .denied:
            // 위치 서비스가 비활성화되었습니다. 설정에서 활성화해주세요.
            Toast.shared.present(title: "Location service is disabled. Please enable it in Settings.")
        case .network:
            // 네트워크 오류가 발생했습니다.
            Toast.shared.present(title: "A network error has occurred.")
        default:
            // 알 수 없는 오류가 발생했습니다.
            Toast.shared.present(title: "An unknown error occurred.")
        }
    }
    
    func distance(latitude: Double?, longitude: Double?) -> String {
        guard let latitude, let longitude else { return "" }
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        if let distance = self.location?.distance(from: location) {
            return distance.toDistanceText
        }
        return ""
    }
}
