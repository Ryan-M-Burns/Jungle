/// <reference types = "cypress" />

describe('example to-do app', () => {
  beforeEach(() => {
    cy.visit('http://0.0.0.0:3000/');
  });

  it('visits the homepage. Welcome to the Jungle! ', () => {
    cy.visit('http://0.0.0.0:3000/');
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  
});