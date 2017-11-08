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
import 'package:elastic_rest_api/elastic_rest.dart';
esApi = new ElasticApi(
          _elasticHost,
          _elasticLogin,
          _elasticPassword
      );
```