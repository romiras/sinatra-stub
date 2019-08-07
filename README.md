# sinatra-stub
Skeleton for Sinatra API stubs

## Requirements

Ruby >= 2.3

## How to install

```
bundle install
```

## How to run server

```
bundle exec puma -C config/puma.rb
```

## Docker

### Building container
```
docker build -t sinatra-stub .
```

### Run server

```
docker run -p 3000:3000 --rm -it sinatra-stub
```
