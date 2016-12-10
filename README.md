# 概要
気楽にrailsを試す為の環境用のDockerfileとGemfile。

こちらの方のDockerfileをベースに少し調整
https://github.com/alim/alpine-rails


dockerイメージのビルド
============================

Gemfileに記述されたGemをインストールしたイメージを作成

```
docker build -t rails:4.2.6 .
```

コンテナ作成
============================
```
docker run --name test -itd -p 3000:3000 -v "$PWD":/project rails:4.2.6 /bin/sh
```

コンテナ内に入る
============================
```
docker -it test /bin/sh
```

コンテナ起動
============================
```
docker start test
```

コンテナ停止
============================
```
docker stop test
```

railsプロジェクト作成
============================
```
rails new <project-name> --skip-bundle
cd <project-name>
bundle install
```



