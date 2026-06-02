// import js from "@eslint/js";
// import globals from "globals";
// import { defineConfig } from "eslint/config";

// export default defineConfig([
//   { files: ["**/*.{js,mjs,cjs}"], plugins: { js }, extends: ["js/recommended"], languageOptions: { globals: globals.browser } },
// ]);
import js from '@eslint/js';
import globals from 'globals';
import { defineConfig } from 'eslint/config';

export default defineConfig([
  js.configs.recommended,
  {
    files: ['**/*.js'],
    languageOptions: {
      globals: {
        ...globals.browser,
        GameManager: 'readonly',
        KeyboardInputManager: 'readonly',
        HTMLActuator: 'readonly',
        LocalStorageManager: 'readonly',
        Grid: 'readonly',
        Tile: 'readonly'
      }
    }
  }
]);
