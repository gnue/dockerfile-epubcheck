# Docker Image for epubcheck

Run epubcheck on docker

## Installation

```sh
$ docker pull gnue/epubcheck
```

## Usage

```sh
$ docker run -t -i --rm -v "$(pwd):/app/data" gnue/epubcheck [OPTIONS] [file...]
```

* file is EPUB file only
* OPTIONS
  * show help `docker run -t -i --rm gnue/epubcheck -h`
  * can use variables
    * `$file` is file path
    * `$fname` is file name without file exstention

## docker-compose

```sh
$ docker-compose up
```

or

```sh
$ docker-compose run --rm epubcheck [OPTIONS] [file...]
```

Directory structure:

```
.
├── docker-compose.yml    # docker-compose configuration file
├── data                  # EPUB files
│   ├── book_01.epub
│   ├── book_02.epub
│   └── ...
└── log                   # Output log files
    └── ...
```

docker-compose.yml:

```yaml
epubcheck:
  environment:
    EPUBCHECK_FLAGS: "--json log/$$fname.json"
  image: gnue/epubcheck
  volumes:
    - "./data:/app/data:ro"
    - "./log:/app/log"
```

## License

[MIT](LICENSE.txt)
