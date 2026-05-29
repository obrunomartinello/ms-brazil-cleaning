/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./index.html', './script.js'],
  theme: {
    extend: {
      colors: {
        primary: '#6c0051',
        'primary-container': '#8b1e6b',
        'on-primary': '#ffffff',
        'on-primary-container': '#ffa1d8',
        secondary: '#705765',
        'secondary-container': '#f8d7e8',
        'on-secondary-container': '#755b6a',
        surface: '#f8f8f9',
        'surface-dim': '#eeeced',
        'surface-container-lowest': '#f4f3f5',
        'surface-container-low': '#f0eef1',
        'surface-container': '#f6f5f6',
        'surface-container-high': '#eceaec',
        'on-surface': '#1b1c1d',
        'on-surface-variant': '#54424b',
        outline: '#86717b',
        'outline-variant': '#d9c0cb',
        'primary-fixed': '#ffd8eb',
        'primary-fixed-dim': '#ffaedc',
        'surface-tint': '#a0327d',
      },
      fontFamily: {
        serif: ['Lora', 'Georgia', 'serif'],
        sans: ['Manrope', 'sans-serif'],
      },
    }
  },
  plugins: [
    require('@tailwindcss/forms'),
  ],
}
