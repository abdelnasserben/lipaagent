// Regenerates the typed API client (lib/api/generated) from the backend's
// OpenAPI contract, group `agent`. The backend must be running.
//
//   dart run tool/api_generate.dart [contract URL]
//
// Steps: download the contract to openapi/agent.json, run swagger_parser
// (models + Retrofit clients), then build_runner (JSON and client code).
// After a backend change, run it and fix the compile errors it reveals.
import 'dart:convert';
import 'dart:io';

const _defaultUrl = 'http://localhost:8080/v3/api-docs/agent';

Future<void> main(List<String> args) async {
  final url = Uri.parse(args.isEmpty ? _defaultUrl : args.first);
  stdout.writeln('Downloading $url');
  final client = HttpClient();
  final response = await (await client.getUrl(url)).close();
  if (response.statusCode != 200) {
    stderr.writeln('HTTP ${response.statusCode}: is the backend running?');
    exit(1);
  }
  final contract = jsonDecode(await response.transform(utf8.decoder).join());
  client.close();

  _keepDatesAsText(contract);
  await File(
    'openapi/agent.json',
  ).writeAsString('${const JsonEncoder.withIndent('  ').convert(contract)}\n');

  await _run('dart', ['run', 'swagger_parser']);
  await _run('dart', ['run', 'build_runner', 'build', '-d']);
  await _run('dart', ['format', 'lib/api/generated']);
  stdout.writeln('Done. Now run: dart format lib test && flutter analyze');
}

/// `format: date` fields (e.g. `dateOfBirth`) are `YYYY-MM-DD` strings in the
/// API. The generator would turn them into DateTime and send a full timestamp
/// that the backend refuses, so they stay plain strings (as in the back-office).
void _keepDatesAsText(Object? node) {
  if (node is Map) {
    if (node['type'] == 'string' && node['format'] == 'date') {
      node.remove('format');
    }
    node.values.forEach(_keepDatesAsText);
  } else if (node is List) {
    node.forEach(_keepDatesAsText);
  }
}

Future<void> _run(String command, List<String> arguments) async {
  stdout.writeln('> $command ${arguments.join(' ')}');
  final process = await Process.start(
    command,
    arguments,
    runInShell: true,
    mode: ProcessStartMode.inheritStdio,
  );
  final code = await process.exitCode;
  if (code != 0) exit(code);
}
