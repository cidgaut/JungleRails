describe('example to-do app', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('http://localhost:3000')
  })

  it("should click add to cart button on first product", () => {

    cy.get('.navbar').should('contain', 'My Cart (0)');

    cy.get('.products article').first().find('button').click({force: true});

    cy.get('.navbar').should('contain', 'My Cart (1)');
  });

})