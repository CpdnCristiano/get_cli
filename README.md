# CLI arctekko
### Description
A CLI flutter based on the code structure proposed by [*@Katekko*](https://github.com/Katekko) to use in  [**GetX**](https://pub.dev/packages/get),
see structure details [**here**](https://github.com/Katekko/arctekko).

### Installation
requires [Dart](https://dart.dev/get-dart) to run.
```sh
pub global activate -sgit https://github.com/CpdnCristiano/cpdn-cli.git
```

### Create Screen
run the command in the flutter project directory
```sh
arctekko create screen --name="Screen name"
```
or in an abbreviated form
```sh
arctekko c s --n="Screen name"
```

### Create Widget in screen directory
run the command in the flutter project directory
```sh
arctekko create wigdet screenFolderName --name="widget name"
```
or in an abbreviated form
```sh
arctekko c w screenFolderName --name="widget name"
```
### Create Widget in common directory
run the command in the flutter project directory
```sh
arctekko create wigdet common --name="widget name"
```
or in an abbreviated form
```sh
arctekko c w --n="widget name"
```