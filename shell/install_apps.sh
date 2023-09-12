#!/bin/bash

# アプリのリスト
apps=(
    google-chrome
    iterm2
    cmd-eikana
    deepl
    notion
    todoist
    discord
    visual-studio-code
    kindle
    displaylink
    clipy
)

# 各アプリをインストール
for app in "${apps[@]}"; do
    brew install --cask "$app"
done

# 実行方法:
# 1. このスクリプトを install_apps.sh という名前で保存します。
# 2. ターミナルを開き、スクリプトが保存されたディレクトリに移動します。
# 3. 実行権限を付与します: chmod +x install_apps.sh
# 4. スクリプトを実行します: ./install_apps.sh
