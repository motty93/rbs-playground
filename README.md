## Environment
- ruby 3.2.2

## Get Start
```bash
$ docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t rbs-playground .

$ docker run --rm --name playground -v .:/myapp -itd rbs-playground /bin/bash
```

### 型生成
```bash
# 型生成
$ docker exec -it playground bundle exec rbs prototype rb --out-dir=sig/prototype --base-dir=. app

# 型再生成
$ sh lib/clean.sh
```

### 型チェック
```bash
# 型チェック
$ docker exec -it playground bundle exec rbs -Isig validate --silent

# gemの型更新
$ docker exec -it playground bundle exec rbs collection update
```

### irb
```bash
$ docker exec -it playground bundle exec irb
irb(main):001:0>

```

### execute ruby
```bash
# app/hello.rbを実行
$ docker exec -i playground bundle exec ruby app/hello.rb
```
