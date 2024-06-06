//
//  TimerManager.swift
//  Ball Master
//
//  Created by Mykyta Kurochka on 06.06.2024.
//

import Foundation
import Combine
import UIKit
//import BackgroundTasks
//class TimerManager: ObservableObject {
//    static let shared = TimerManager()
//    
//    @Published var timerTick = Date()
//    
//    private var cancellables = Set<AnyCancellable>()
//    
//    private init() {
////        setupBackgroundTimer()
//    }
//    
////    func setupBackgroundTimer() {
////        UIApplication.shared.setMinimumBackgroundFetchInterval(1)
////    }
//    
//    func start() {
//        Timer.publish(every: 1.0, on: .main, in: .default)
//            .autoconnect()
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] _ in
//                self?.timerTick = Date()
//            }
//            .store(in: &cancellables)
//    }
//    
//    func stop() {
//        cancellables.forEach { $0.cancel() }
//        cancellables.removeAll()
//    }
//}

class TimerManager: ObservableObject {
    static let shared = TimerManager()

    @Published var timerTick = Date()
    private var timer: AnyCancellable?
    private(set) var isRunning = false

    private init() {}

    func start() {
        guard !isRunning else { return }
        isRunning = true
        timer = Timer.publish(every: 1.0, on: .main, in: .default)
            .autoconnect()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.timerTick = Date()
            }
    }

    func stop() {
        guard isRunning else { return }
        isRunning = false
        timer?.cancel()
        timer = nil
    }
}
