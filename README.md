# todo-app

## 概要

タスク管理アプリです。

目的は以下の通りです。

- React Native の学習用
- Docker (Docker Compose) x React Native で動作できるようにすること

## 事前準備

- Docker
- Docker-Compose
- Expo GO
- Git
- Visual Studio Code

## 使用方法

### 1. Dockerコンテナのビルド

```powershell
docker-compose build
```

### 2. Dockerコンテナの起動

```powershell
docker-compose up
```

または

```powershell
docker-compose up -d
```

### 3. Dockerコンテナ内でアプリケーションの作成

```sh
docker-compose run --rm app bash
```

#### 3.1. Expo によるアプリケーション作成

テンプレートは `Blank(TypeScript)` を選択している。

```sh
expo init todo-app
```

***実行結果***

```sh
bash-5.1# expo init todo-app

Migrate to using:
› npx create-expo-app --template

✔ Choose a template: › blank (TypeScript)  same as blank but with TypeScript configuration
✔ Downloaded template.
🧶 Using Yarn to install packages. Pass --npm to use npm instead.
✔ Installed JavaScript dependencies.

✅ Your project is ready!

To run your project, navigate to the directory and run one of the following yarn commands.

- cd todo-app
- yarn start # you can open iOS, Android, or web from here, or run them directly with the commands below.
- yarn android
- yarn ios # requires an iOS device or macOS for access to an iOS simulator
- yarn web
```

#### 3.2. 終了

```sh
exit
```

`./todo-app` 以下にアプリケーションを作成されるため、 `todo-app` 内のファイルをすべて `app` 以下に移動し、 `todo-app` ディレクトリは削除しておく。

※空のディレクトリ内でないと、 `expo init` が使用できないため。

### 4. Dockerコンテナ内でアプリケーションの起動

```powershell
docker-compose exec app yarn start
```

### 5. QRコードを「Expo Go」で読み取り

### 6. Yarnコマンドの実行

```powershell
docker-compose run --rm app yarn <commands>
```

#### 6.1. パッケージの追加

```powershell
docker-compose run --rm app yarn add <Package Name>
```

### 各種パッケージ

#### React Native Web を開発する場合

```powershell
docker-compose run --rm app yarn react-dom react-native-web @expo/webpack-config
```

#### ESLint のインストール

```sh
docker-compose run --rm app yarn add --dev --exact eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin eslint-config-prettier eslint-plugin-prettier eslint-plugin-react @react-native-community/eslint-config eslint-plugin-jest eslint-import-resolver-typescript eslint-plugin-import eslint-plugin-unused-imports
```

```sh
docker-compose run --rm app npx eslint --init
```

***実行結果***

```sh
> docker-compose run --rm app npx eslint --init
Creating app_app_run ... done
Need to install the following packages:
  eslint@8.26.0
Ok to proceed? (y) y
You can also run this command directly using 'npm init @eslint/config'.
Need to install the following packages:
  @eslint/create-config@0.4.1
Ok to proceed? (y) y
✔ How would you like to use ESLint? · style
✔ What type of modules does your project use? · esm
✔ Which framework does your project use? · react
✔ Does your project use TypeScript? · No / Yes
✔ Where does your code run? · browser
✔ How would you like to define a style for your project? · guide
✔ Which style guide do you want to follow? · standard-with-typescript
✔ What format do you want your config file to be in? · JSON
Checking peerDependencies of eslint-config-standard-with-typescript@latest
Local ESLint installation not found.
The config that you've selected requires the following dependencies:

eslint-plugin-react@latest eslint-config-standard-with-typescript@latest @typescript-eslint/eslint-plugin@^5.0.0 eslint@^8.0.1 eslint-plugin-import@^2.25.2 eslint-plugin-n@^15.0.0 eslint-plugin-promise@^6.0.0 typescript@*
✔ Would you like to install them now? · No / Yes
✔ Which package manager do you want to use? · yarn
Installing eslint-plugin-react@latest, eslint-config-standard-with-typescript@latest, @typescript-eslint/eslint-plugin@^5.0.0, eslint@^8.0.1, eslint-plugin-import@^2.25.2, eslint-plugin-n@^15.0.0, eslint-plugin-promise@^6.0.0, typescript@*
yarn add v1.22.19
[1/4] Resolving packages...
[2/4] Fetching packages...
[3/4] Linking dependencies...
warning "react-native > react-native-codegen > jscodeshift@0.13.1" has unmet peer dependency "@babel/preset-env@^7.1.6".
warning " > @typescript-eslint/eslint-plugin@5.42.0" has unmet peer dependency "@typescript-eslint/parser@^5.0.0".
[4/4] Building fresh packages...
success Saved lockfile.
success Saved 88 new dependencies.
info Direct dependencies
├─ @typescript-eslint/eslint-plugin@5.42.0
├─ eslint-config-standard-with-typescript@23.0.0
├─ eslint-plugin-import@2.26.0
├─ eslint-plugin-n@15.4.0
├─ eslint-plugin-promise@6.1.1
├─ eslint-plugin-react@7.31.10
├─ eslint@8.26.0
└─ typescript@4.8.4
info All dependencies
├─ @eslint/eslintrc@1.3.3
...
└─ word-wrap@1.2.3
Done in 107.67s.
Successfully created .eslintrc.json file in /usr/src/app
npm notice
npm notice New patch version of npm available! 8.19.2 -> 8.19.3
npm notice Changelog: https://github.com/npm/cli/releases/tag/v8.19.3
npm notice Run npm install -g npm@8.19.3 to update!
npm notice
```

#### Prettier のインストール

```sh
docker-compose run --rm app yarn add --dev --exact prettier
```

#### Husky & lint-stage のインストール

```sh
docker-compose run --rm app yarn add --dev --exact husky lint-staged
```

```sh
docker-compose run --rm app npx husky install
```

```json
{
    "scripts": {
        "prepare": "husky install",
    },
    "lint-staged": {
        "*.js": [
            "yarn lint",
            "yarn fix"
        ]
    }
}
```

```sh
docker-compose run --rm app npx husky add .husky/pre-commit "yarn lint-staged"
```

```sh
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

yarn lint-staged
```

#### Jest のインストール

```sh
docker-compose run --rm app yarn add --dev jest-expo jest
```
