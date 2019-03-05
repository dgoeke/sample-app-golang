FROM golang:1.12.0-stretch

RUN mkdir /app
ADD . /app/
WORKDIR /app

RUN cd cmd/myapp && go build -o ../../bin/myapp -v
RUN useradd --system --no-create-home --home-dir /app appuser

USER appuser
CMD ["./bin/myapp"]
