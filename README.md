<!-- 本文件由 ./readme.make.md 自动生成，请不要直接修改此文件 -->

# dart_template

hook on dart process exit

## use

```dart
import 'package:dart_template/init.dart';

void main() async {
  onExit(() {
    print('on exit callback');
  });
  print('hi');
  await onExit.exit(0);
}

```
