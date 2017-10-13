# elastic_rest_api

Пакет для работы с Elastic Search через REST API


## Установка

```
dependencies:
    elastic_rest_api:
        git: https://github.com/kseregal/elastic_rest_api.git

```

## Использование


```
import 'package:delidela_synchr/src/synchr_changes_server.dart';

main (List<String> arguments) async {
  print('Слушатель изменений в БД ДелиДела RethinkDB запускается.');

  await new SynchrChangesServer(
      elasticHost: 'http://localhost:9200',
      rethinkDbName: 'dbname',
      rethinkDbHost: 'rethink-host',
      rethinkDbPort: 28015
  )..start();

  print('Слушатель запустился');

}
```