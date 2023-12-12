## Environment
- ruby 3.2.2

## Get Start
```bash
$ docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t rbs-playground .

$ docker run --rm --name playground -v .:/myapp -itd rbs-playground /bin/bash
```

### irb mode
```bash
$ docker exec -it playground bundle exec irb
irb(main):001:0>

```

### execute ruby
```bash
# src/hello.rbを実行
$ docker exec -i playground bundle exec ruby src/hello.rb
```
