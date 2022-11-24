describe('Jungle Product Details Page', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it("Visits Product Page when product clicked", () => {
    cy.get(".products article").should("be.visible");
    cy.get("[alt='Scented Blade']").click();
    cy.contains("The Scented Blade is an extremely rare");
  });

  it("Should add product to cart when clicking add", () => {
    cy.get("[alt='Scented Blade']").click();
    cy.get(".products-show").should('exist');
    cy.get("form").contains("Add").click();
    cy.contains("My Cart").contains("1");
  });
});