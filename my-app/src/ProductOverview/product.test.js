const sum = require('../jest.js');
const ProductOverview = require('./ProductOverview.jsx');

test('it will add 5 + 5 to equal 10', () => {
  expect(sum(5, 5)).toBe(10);
})