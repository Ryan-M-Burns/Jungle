/// <reference types = "cypress" />

describe('example to-do app', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('visits the homepage. Welcome to the Jungle! ', () => {
    cy.visit('/');
  });

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});