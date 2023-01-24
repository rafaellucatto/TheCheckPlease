//
//  Constants.swift
//  Core
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation

/// An enum representing the constants throughout the app
public enum K {
    /// The main view
    public enum TotalCalculator {
        public static let calculateButtonTitle: String = "CALCULAR"
        public static let peopleSplittingTheBillLabel: String = "People splitting the bill:"
    }
    public enum ResultView {
        public static let totalLabel: String = "Total:"
    }
    public enum ErrorView {
        public static let mainLabel: String = "Not enough data."
        public static let dismissButton: String = "Dismiss"
    }
}
