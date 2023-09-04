module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
  ],
  theme: {
    fontFamily: {
      sans: ["VT323", "monospace"],
    },
  },
  extend: {
    fontFamily: {
      primary: ["VT323", "monospace"],
    },
  },
  plugins: [require("@tailwindcss/forms")],
};
