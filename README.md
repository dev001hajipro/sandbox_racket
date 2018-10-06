# sandbox_racket

Racketの学習プロジェクト

## Racket入門

DrRacketで簡単なSchemeプログラミング。DrRacketはGUIが付属しているのでそれでWindow表示なども学習します。

[Quick: An Introduction to Racket with Pictures](https://docs.racket-lang.org/quick/)

### パッケージ作成チュートリアル

[Tutorial: Creating a Package](http://blog.racket-lang.org/2017/10/tutorial-creating-a-package.html)

### Racketのパッケージについて

Racketをはじめて使ってみると、`module`、`collection`、`package`の違いが分からなかったので整理。

`module`は、.rktファイルのことで、以下のようにファイルパスでインポートします。

```racket
(require "path/to/filename.rkt")
```

`collection`は、上記モジュールを束ねたもので、Racketのパッケージマネージャー(racoまたはGUI)でインストールされたものです。
コレクションは、`raco install <package>`を実行すると、ローカルのパッケージマネージャが管理しているディレクトリーにソースコードをダウンロードします。よって、コレクションは、require時に、パスを指定する必要がありません。

```racket
(require myutil)
```

`package`は、Racketのコレクション配布の仕組みです。パッケージには、複数のコレクションを含めることが可能です。
[official Racket package catalog](https://pkgs.racket-lang.org/)があり、githubでパッケージを作り(通常のプロジェクト)、公式パッケージにindex付けすれば、racoでインストールできます。

#### ローカルパッケージをPackageManagerにインストール

パッケージのディレクトリーに移動し、`raco pkg install`でディレクトリーからインストールします。

```racket
$ cd plot-bestfit
$ raco pkg install
Linking current directory as a package
raco setup: version: 7.0
...
```

または、ディレクトリー指定すると、(/)、racoコマンドはローカルパッケージと判断します。

```racket
$ raco pkg install plot-bestfit/
Linking current directory as a package
raco setup: version: 7.0
...
```

#### 依存関係の構築

```racket
raco setup --fix-pkg-deps bestfit
```

