//
//  stripeApp.swift
//  stripe
//
//  Created by user279425 on 1/9/26.
//



import SwiftUI
import Stripe

@main
struct MyApp: App {

    init() {
        StripeAPI.defaultPublishableKey = "pk_test_51SpYeXJxxnD3fqm1nyA4O9Ld99QcUp1ZVAalLYQ3HJk3Xr7966kmHqBvQdb8ATJz6YIibMKdv1WkQMrtLLJPl69K00rWceDy3Z"
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
//            StripePaymentTestView()
        }
    }
}
