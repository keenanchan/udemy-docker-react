import { render, screen } from '@testing-library/react';
import App from './App';

test('renders learn react link', () => {
  render(<App />);
  const linkElement = screen.getByText(/I changed myself on Feature!/i);
  expect(linkElement).toBeInTheDocument();
});

test('renders learn react link number 2', () => {
  render(<App />);
  const linkElement = screen.getByText(/I changed myself on Feature!/i);
  expect(linkElement).toBeInTheDocument();
});
