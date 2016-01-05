FROM alpine:3.3

RUN apk add --update bash curl unzip openjdk7 && \
    rm /var/cache/apk/*

# epubcheck
ENV EPUBCHECK epubcheck-4.0.1

RUN curl -L -o "/tmp/$EPUBCHECK.zip" "https://github.com/IDPF/epubcheck/releases/download/v${EPUBCHECK#*-}/$EPUBCHECK.zip" \
 && unzip "/tmp/$EPUBCHECK.zip" -d /app \
 && rm "/tmp/$EPUBCHECK.zip" \
 && ( cd /app; ln -s "$EPUBCHECK" epubcheck )
ADD app /app/

VOLUME ["/app/data"]
WORKDIR /app

ENTRYPOINT ["/app/bin/epubcheck"]
