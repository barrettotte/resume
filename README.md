# resume

My resume written in LaTeX.

[View Resume](https://github.com/barrettotte/resume/blob/master/barrettotte-resume.pdf)

[LinkedIn](https://www.linkedin.com/in/barrettotte/)

## Build

```sh
docker build -t barrettotte-resume .
docker run -e "RESUME_NAME=barrettotte-resume" --rm -v $(shell pwd):/out barrettotte-resume

# or with make
make image
make build
```
