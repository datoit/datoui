English | [简体中文](https://github.com/datoit/datoui/blob/master/README-zh_CN.md)

<br />
<p align="center">
    <a href="https://flui.datoit.com">
        <img width="200" src="https://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-18-Artboard.png">
    </a>
</p>

<h1 align="center">DATOUI</h1>

<div align="center">
<p>A powerful UI framework for Google Flutter <a href="https://github.com/Rannie/Rannie.github.io/raw/master/app-release-0-9-2.apk">Demo apk</a></p>


[![pub package](https://img.shields.io/pub/v/flui.svg)](https://pub.dev/packages/flui)
[![CI Status](https://github.com/rannie/flui/workflows/test/badge.svg)](https://github.com/Rannie/flui/actions)
[![Documentation](https://img.shields.io/badge/read_the-docs-2196f3.svg)](https://flui.datoit.com/en/widgets/button.html)
[![GitHub stars](https://img.shields.io/github/stars/Rannie/flui)](https://github.com/Rannie/flui/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/Rannie/flui.svg)](https://github.com/Rannie/flui)
[![GitHub license](https://img.shields.io/github/license/Rannie/flui.svg)](https://github.com/Rannie/flui/blob/master/LICENSE)


<img src="https://raw.githubusercontent.com/Rannie/Rannie.github.io/master/images/2019-12-18-overview-2.png" />

</div>

## Features

* A set of high-quality Flutter widgets out of the box
* Comprehensive usage examples and documentation
* Fine-grained non-stylized widgets for different types of applications
* Supports [Dark Mode](https://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-27-dark_shots.png) and [RTL](https://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-27-rtl_shots.png)
* Dynamic rendering module -- [Dynamic](https://flui.datoit.com/en/dynamic.html)

## Compatibility

**DATOIT** has good compatibility on multiple clients, and the framework will be developed based on Flutter Stable Channel.

Currently supports *v1.17.0* .

## Getting Started

#### Setup

```yaml
dependencies:
  datoit: 0.0.1
```

Then run `flutter pub get` to download the dependencies.

#### Usage

After the dependency installed, you can directly import the widget.

```dart
import 'package:datoit/datoit.dart';

// in somewhere
FLAppBarTitle(
    title: 'AppBar',
    subtitle: '(subtitle)',
    layout: FLAppBarTitleLayout.vertical,
    showLoading: true
)
```

## Widgets

- [Button](https://flui.datoit.com/en/widgets/button.html)
- [Label](https://flui.datoit.com/en/widgets/label.html)
- [Toast](https://flui.datoit.com/en/widgets/toast.html)
- [Bubble](https://flui.datoit.com/en/widgets/bubble.html)
- [Input](https://flui.datoit.com/en/widgets/input.html)
- [Avatar](https://flui.datoit.com/en/widgets/avatar.html)
- [Badge](https://flui.datoit.com/en/widgets/badge.html)
- [Image](https://flui.datoit.com/en/widgets/image.html)
- [CountStepper](https://flui.datoit.com/en/widgets/counter.html)
- [AppBar](https://flui.datoit.com/en/widgets/appbar.html)
- [NoticeBar](https://flui.datoit.com/en/widgets/notice-bar.html)
- [Empty](https://flui.datoit.com/en/widgets/empty.html)
- [Skeleton](https://flui.datoit.com/en/widgets/skeleton.html)
- [BottomSheet](https://flui.datoit.com/en/widgets/bottom-sheet.html)
- [List](https://flui.datoit.com/en/widgets/list.html)
- [Theme](https://flui.datoit.com/en/widgets/theme.html)

## Dynamic

![dynamic-post](https://abtfun.oss-cn-beijing.aliyuncs.com/img/2020-03-11-dynamic-poster-1.png)

**DATOIT-Dynamic** is a dynamic rendering module that supports rendering widgets based on json strings or objects of a specified type. For more introduction and usage, please see [Dynamic](https://flui.datoit.com/en/dynamic.html)

``` dart
Widget buildDynamicWidget() {
    return FLDyContainer(
       jsonObject: $JSON_STRING_OR_OBJECT,
       placeholder: CircularProgressIndicator(
         strokeWidth: 3.0,
         valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
       ),
    );
}
```

## Contributing

Principles:

* Branches that submit new widgets should be named *'feature-'* + widget name. Fixing issues need to be prefixed with *'bugfix-'*
* The submitted widgets need to be general. If the widget is rare or not sure whether it needs to be added to **DATOIT**, you can raise a [issue](https://github.com/datoit/datoui/issues) which starts with *\[feature\]* for discussion
* The API design of the new widget is as standard and readable as possible, following the naming and usage rules of Flutter's official widgets.
* Please comment above properties and methods how to use it so that I can add to the documentation and examples.
* Commit messages: prefix with `feat | fix | docs | style | refactor | perf | test | workflow | ci | chore | types:`.


## License

MIT License
