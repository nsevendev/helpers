# Config Prettier

## Install `Prettier`

#### Prérequis dans vscode

- Plugin `Prettier` doit etre installé
- Plugin `ESLint` doit etre installé

#### Prérequis dans le projet en cours

- eslint:recommande doit être installer

#### Étape 1 : Installer Prettier dans le projet

```bash
# Installer Prettier
npm install --save-dev --save-exact prettier

# Installer ESLint config pour Prettier
npm install --save-dev eslint-config-prettier eslint-plugin-prettier
```

#### Étape 2 : Modifier le fichier `.eslintrc.js ou .json` (config avec fichier `.eslintrc`)

```js
module.exports = {
  env: {
    browser: true,
    es2021: true,
  },
  extends: [
    "plugin:react/recommended", // Config eSLint pour React
    "plugin:@typescript-eslint/recommended", // Config pour TypeScript
    "plugin:prettier/recommended", // Préintègre Prettier pour gérer les conflits
  ],
  parser: "@typescript-eslint/parser", // Utiliser le parser TypeScript
  parserOptions: {
    ecmaFeatures: {
      jsx: true, // Pour JSX
    },
    ecmaVersion: 12, // Version ECMAScript
    sourceType: "module", // Utilisation de modules ES6
  },
  plugins: ["react", "@typescript-eslint", "prettier"], // Plugins nécessaires
  rules: {
    "prettier/prettier": ["error"], // Signale les erreurs Prettier comme erreurs ESLint
    "react/react-in-jsx-scope": "off", // Inutile avec les versions modernes de React
    "@typescript-eslint/explicit-module-boundary-types": "off", // Désactiver les types explicites
  },
};
```

#### Étape 2 : Modifier le fichier `.eslint.config.js` (config avec fichier `.eslint.config`)

```js
import js from "@eslint/js";
import globals from "globals";
import reactHooks from "eslint-plugin-react-hooks";
import reactRefresh from "eslint-plugin-react-refresh";
import tseslint from "typescript-eslint";

export default tseslint.config(
  { ignores: ["dist"] }, // Ignorer le dossier dist

  {
    extends: [
      js.configs.recommended, // Config eslint pour JavaScript
      ...tseslint.configs.recommended, // Config eslint pour TypeScript
      "plugin:prettier/recommended", // Préintègre Prettier pour gérer les conflits
    ],

    files: ["**/*.{ts,tsx}"], // Fichiers TypeScript et TypeScript React sont pris en charge

    languageOptions: {
      ecmaVersion: 2020, // Version ECMAScript
      globals: globals.browser, // Variables globales pour le navigateur
    },

    plugins: {
      "react-hooks": reactHooks, // Plugin pour les hooks React
      "react-refresh": reactRefresh, // Plugin pour React Refresh
      prettier: prettierPlugin, // Plugin pour Prettier
    },

    rules: {
      ...reactHooks.configs.recommended.rules, // Règles recommandées pour les hooks React

      "react-refresh/only-export-components": [
        "warn",
        { allowConstantExport: true },
      ], // Avertissement si les composants sont exportés en dehors de React

      "prettier/prettier": "error", // Signale les erreurs Prettier comme erreurs ESLint

      //.. ajouter des regles au besoin
    },
  }
);
```

#### Étape 3 : Créer un fichier `.prettierrc`

```json
{
  "semi": false, // Pas de point-virgule
  "singleQuote": true, // Utiliser des guillemets simples
  "trailingComma": "es5", // virgule objet, tableau
  "printWidth": 80, // longueur de ligne maximale
  "tabWidth": 4 // taille espace tabulation
  // ... ajouter des regles au besoin
}
```

#### Etape 4 : Ajouter la config dans votre `setting.json` de vscode

```json
# ajout formateur prettier au save
# ajout eslint fix au save
(fixe les erreurs que eslint peut fixer)

{
  "editor.formatOnSave": true, // Formater le code à chaque sauvegarde
  "editor.defaultFormatter": "esbenp.prettier-vscode", // Utiliser Prettier comme formateur par défaut

  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true // Utiliser ESLint pour corriger les erreurs
  }, // Corriger les erreurs ESLint à chaque sauvegarde

  "eslint.validate": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact"
  ] // Valider les fichiers JavaScript et TypeScript
}
```

#### Etape 5 : Ajouter des restrictions, création des fichiers `.eslintignore` et `.prettierignore`

```json
# ajouter les dossiers ou fichier à exclure

node_modules/
dist/
```
