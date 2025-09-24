import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'getit_utils.dart';

@module
abstract class LoggerModule {
  @singleton
  Talker talker() => TalkerFlutter.init(
    settings: TalkerSettings(
      useConsoleLogs: kDebugMode,
      colors: {
        TalkerLogType.debug.toString(): AnsiPen()..green(),
        TalkerLogType.warning.toString(): AnsiPen()..yellow(bold: true),
        TalkerLogType.error.toString(): AnsiPen()..red(bold: true)
      },
    ),
  );
}

final logger = _Logger(getIt<Talker>());


class _Logger {
  final Talker talker;
  _Logger(this.talker);

  // White text
  d(dynamic msg, {
    Object? exception,
    StackTrace? stackTrace,
  }) => talker.debug(msg, exception, stackTrace);


  // Blue text
  i(dynamic msg, {
    Object? exception,
    StackTrace? stackTrace,
  }) => talker.info(msg, exception, stackTrace);

  // Yellow text
  w(dynamic msg, {
    Object? exception,
    StackTrace? stackTrace,
  }) => talker.warning(msg, exception, stackTrace);

  // Red text
  e(dynamic msg, Object e, StackTrace s, {
    Object? exception,
    StackTrace? stackTrace,
  }) => talker.error(msg, exception, stackTrace);
}

enum TalkerLogType {
  /// Base logs section
  error('error'),
  critical('critical'),
  info('info'),
  debug('debug'),
  verbose('verbose'),
  warning('warning'),
  exception('exception'),

  /// Http section
  httpError('http-error'),
  httpRequest('http-request'),
  httpResponse('http-response'),

  /// Bloc section
  blocEvent('bloc-event'),
  blocTransition('bloc-transition'),
  blocClose('bloc-close'),
  blocCreate('bloc-create'),

  /// Riverpod section
  riverpodAdd('riverpod-add'),
  riverpodUpdate('riverpod-update'),
  riverpodDispose('riverpod-dispose'),
  riverpodFail('riverpod-fail'),

  /// Flutter section
  route('route');

  const TalkerLogType(this.key);
  final String key;

  static TalkerLogType fromLogLevel(LogLevel logLevel) {
    return TalkerLogType.values.firstWhere((e) => e.logLevel == logLevel);
  }

  static TalkerLogType? fromKey(String key) {
    return TalkerLogType.values.firstWhereLogTypeOrNull((e) => e.key == key);
  }
}

extension TalkerLogTypeExt on TalkerLogType {
  /// Mapping [TalkerLogType] into [LogLevel]
  LogLevel get logLevel {
    switch (this) {
      case TalkerLogType.error:
        return LogLevel.error;
      case TalkerLogType.critical:
        return LogLevel.critical;
      case TalkerLogType.info:
        return LogLevel.info;
      case TalkerLogType.debug:
        return LogLevel.debug;
      case TalkerLogType.verbose:
        return LogLevel.verbose;
      case TalkerLogType.warning:
        return LogLevel.warning;
      default:
        return LogLevel.debug;
    }
  }
}
