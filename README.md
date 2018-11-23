# Instagram Crawler

> The easiest way to download instagram photos, posts and videos.

<img src="screenshots/logo.png" width="200" align="center">

### Instagram Crawler is a ruby gem to crawl instagram photos, posts and videos for download.

## Installation

```
$ gem install instagram-crawler
```

## Setting env variable

```
export sessionid=[your instagram sessionid]
```

![](screenshots/sessionid.png)

## Getting Started

![](screenshots/instagram_crawler_demo.gif)

### Show all file link

`-u || --user_name`

```ruby
instagram-crawler -u <user_name>
```

### Download files after this date (YYYYMMDD)

`-a || --after `

```ruby
instagram-crawler -u <user_name> -d -a 20181120
```

### Generate log file

`-l || --log `

```ruby
instagram-crawler -u <user_name> -l
```

### Help

`instagram-crawler -h | --help`

```ruby
Usage:
  instagram-crawler [options]
  See https://github.com/mgleon08/instagram-crawler for more information.

options:
    -u, --username USERNAME          Instagram username
    -d, --download                   Download files
    -a, --after DATE                 Download files after this date (YYYYMMDD)
    -l, --log                        Generate a log file in the current directory
    -v, --version                    Show the instagram-crawler version
    -h, --help                       Show this message
```

## Contributing

Bug reports and pull requests are welcome on GitHub at [`https://github.com/mgleon08/instagram-crawler/pulls`](https://github.com/mgleon08/instagram-crawler/pulls)

## License

* Copyright (c) 2018 Leon Ji. See [LICENSE.txt](https://github.com/mgleon08/instagram-crawler/blob/master/LICENSE.txt) for further details.
* The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
