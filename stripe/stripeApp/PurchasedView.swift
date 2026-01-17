//
//  PurchasedView.swift
//  stripeApp
//
//  Created by user279425 on 1/17/26.
//


import SwiftUIstruct PurchasedView: View {    @ObservedObject var store = PaymentStore.shared    var body: some View {        NavigationStack {            if store.purchased.isEmpty {                Text("Brak zakupów")            } else {                List(store.purchased) { item in                    VStack(alignment: .leading) {                        Text(item.product.name)                        Text(item.date.formatted())                            .font(.caption)                    }                }            }        }        .navigationTitle("Moje zakupy")    }}