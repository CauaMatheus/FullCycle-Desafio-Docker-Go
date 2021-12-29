FROM golang AS builder

WORKDIR /home/desafio-go

COPY ./main ./main

RUN go build -o bin/main/main.go main/main.go

FROM scratch

WORKDIR /home/desafio-go

COPY --from=builder /home/desafio-go/bin/main/main.go .

CMD ["./main.go"]