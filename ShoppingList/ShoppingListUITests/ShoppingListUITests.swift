//
//  ShoppingListUITests.swift
//  ShoppingListUITests
//
//  Created by user279425 on 1/17/26.
//

import XCTest

class ShoppingListUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    func testDetailedUserJourney() {
        let productListNav = app.navigationBars["Produkty"]
        XCTAssertTrue(productListNav.waitForExistence(timeout: 5), "1. Brak nagłówka Produkty")
        
        let firstCell = app.cells.firstMatch
        XCTAssertTrue(firstCell.exists, "2. Lista produktów jest pusta")
        
        let productName = firstCell.staticTexts.element(boundBy: 0)
        let nameString = productName.label
        XCTAssertTrue(productName.exists, "3. Produkt nie ma nazwy")
        
        let productPrice = firstCell.staticTexts.containing(NSPredicate(format: "label CONTAINS 'zł'")).firstMatch
        XCTAssertTrue(productPrice.exists, "4. Brak ceny lub waluty na liście")
        
        let plusButton = firstCell.buttons["plus.circle"]
        XCTAssertTrue(plusButton.exists, "5. Brak przycisku dodawania (plus.circle)")
        XCTAssertTrue(plusButton.isHittable, "6. Przycisk dodawania jest zasłonięty")
        
        let tabBar = app.tabBars.firstMatch
        XCTAssertTrue(tabBar.buttons["Produkty"].isSelected, "7. Zakładka produkty nie jest aktywna")
        XCTAssertTrue(tabBar.buttons["Koszyk"].exists, "8. Brak zakładki Koszyk")

        productName.tap()

        let detailTitle = app.staticTexts.matching(identifier: nameString).firstMatch
        XCTAssertTrue(detailTitle.waitForExistence(timeout: 5), "9. Nagłówek detali nie pojawił się (szukano: \(nameString))")
        
        let addToCartBigButton = app.buttons["Dodaj do koszyka"]
        XCTAssertTrue(addToCartBigButton.exists, "10. Brak przycisku dodawania w detalach")
        XCTAssertEqual(addToCartBigButton.label, "Dodaj do koszyka", "11. Błędny tekst przycisku")
        
        let priceInDetail = app.staticTexts.containing(NSPredicate(format: "label CONTAINS 'Cena:'")).firstMatch
        XCTAssertTrue(priceInDetail.exists, "12. Brak ceny w detalach")
        
        addToCartBigButton.tap()
        addToCartBigButton.tap()
        addToCartBigButton.tap()
        
        let backButton = app.navigationBars.buttons.element(boundBy: 0)
                XCTAssertTrue(backButton.exists && backButton.isHittable, "13. Przycisk powrotu jest nieaktywny")
                backButton.tap()
                
                XCTAssertTrue(productListNav.waitForExistence(timeout: 2), "14. Powrót nie zadziałał")

                XCTAssertTrue(app.tabBars.buttons["Koszyk"].isEnabled, "16. Tab koszyka jest zablokowany")

                app.tabBars.buttons["Koszyk"].tap()
                
                let cartNav = app.navigationBars["Koszyk"]
                XCTAssertTrue(cartNav.waitForExistence(timeout: 2), "17. Nie przeszło do ekranu Koszyka")
                
                let cartItem = app.staticTexts[nameString].firstMatch
                XCTAssertTrue(cartItem.exists, "18. Produktu \(nameString) nie ma w koszyku")
                
                let quantityText = app.staticTexts.containing(NSPredicate(format: "label CONTAINS 'Ilość: 3'")).firstMatch
                XCTAssertTrue(quantityText.exists, "19. Błędna ilość w koszyku (powinno być 3)")
                
                let totalPriceLabel = app.staticTexts.containing(NSPredicate(format: "label CONTAINS 'Łączna'")).firstMatch
                XCTAssertTrue(totalPriceLabel.exists, "20. Brak etykiety sumy całkowitej")
                
                XCTAssertTrue(tabBar.buttons["Koszyk"].isSelected, "21. Ikona koszyka nie jest podświetlona")
                XCTAssertTrue(tabBar.buttons["Produkty"].isEnabled, "22. Nie można wrócić do produktów z poziomu koszyka")
                XCTAssertFalse(app.staticTexts["Twoja lista jest pusta"].exists, "23. Widnieje komunikat o pustym koszyku")
                
                XCTAssertTrue(app.staticTexts.count > 3, "24. Zbyt mało informacji w koszyku")
                
                XCUIDevice.shared.orientation = .portrait
                XCTAssertTrue(totalPriceLabel.isHittable, "25. Suma nieklikalna")
                XCTAssertFalse(totalPriceLabel.label.isEmpty, "26. Etykieta sumy jest pusta")
                
                XCTAssertFalse(app.tables.buttons["Delete"].exists, "27. Lista nie powinna być w trybie edycji")

                XCTAssertNotNil(app.windows.firstMatch, "29. Brak głównego okna")
                XCTAssertTrue(app.isEnabled, "30. Aplikacja zamrożona")
    }
}
