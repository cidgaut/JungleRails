describe('Product Details', () => {
  it('should click on the first product and see the product view', () => {
    cy.visit('/');

    cy.get('.products article').find('img').first().click();

    cy.url().should('include', '/products/');

    cy.get('h1').should('contain', 'Scented Blade');
  });
});