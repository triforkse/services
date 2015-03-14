# Docker Registry - Trifork Stockholm

Scripts for provisioning a docker registry used in Trifork Stockholm.

## Open Tasks

Open tasks include:

- Make Nginx run in a docker container
- Use Redis for LRU Cache

## Installation

First copy the source to the server.

Then set the following env variables (See all required settings below):

```bash
$ export TF_S3_API_KEY=876f07dd76818a9ab0bbb038aff0810021748f888ac
$ export ...
```

then place the `SSL` certificate and private key in `triforkse.crt` and
`triforkse.key`. Ask an admin for those files. Then run:

```bash
$ make provision
```

Don't forget to open port `443` on the server once the script it done.

Enjoy!


## Required Settings (Env)

- TF_S3_BUCKET

The S3 bucket to store the data in.

- TF_S3_API_KEY

The AWS API key to access the bucket.

- TF_S3_SECRET_KEY

The AWS Secret key to access the bucket. This can only be seen when creating
the IAM account. Not afterwards.

- TF_USERNAME

The username all users will log in with.

- TF_PASSWORD

The password for that user.

## License

The MIT License (MIT)

Copyright (c) 2015 Trifork AB

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
