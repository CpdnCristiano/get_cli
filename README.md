# Get Cli
## Description
A CLI flutter based on [**GetX**](https://pub.dev/packages/get),

### Installation
requires [Dart](https://dart.dev/get-dart) to run.
```sh
pub global activate -sgit https://github.com/CpdnCristiano/get_cli.git
```

### Create Screen
run the command in the flutter project directory
```sh
get arctekko create screen --name="Screen name"
```
or in an abbreviated form
```sh
get arctekko c s --n="Screen name"
```

### Create Widget in screen directory
run the command in the flutter project directory
```sh
get arctekko create wigdet screenFolderName --name="widget name"
```
or in an abbreviated form
```sh
get arctekko c w screenFolderName --name="widget name"
```
### Create Widget in common directory
run the command in the flutter project directory
```sh
get arctekko create wigdet common --name="widget name"
```
or in an abbreviated form
```sh
get arctekko c w --n="widget name"
```

### Test phase feature
* ##### init 
use to create a new project in the current directory
``` 
get arctekko init .
```

**Attention**
this command will overwrite some existing files. Do not use this command in an already started project


the next command should create a new project but at the moment it has flaws
 ``` 
getarctekko init my_fist_project
```

### Future Feature
* #### Intall
    Dependencies easy to install via the command line
* #### create binding
    generate initial binding structure
* #### init 
    generate all directories with a single command
* #### getx_pattern support
    generate code and directories basead on getx_pattern;