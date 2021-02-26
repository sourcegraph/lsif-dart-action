FROM google/dart:2.10

ENV INDEXER_COMMIT=9987ef9325e08fa3f650c88ef28e2074f6fcaadf

LABEL version="0.1.0"
LABEL repository="http://github.com/sourcegraph/lsif-dart-action"
LABEL homepage="http://github.com/sourcegraph/lsif-dart-action"
LABEL maintainer="Sourcegraph Support <support@sourcegraph.com>"

LABEL "com.github.actions.name"="Sourcegraph Dart LSIF Indexer"
LABEL "com.github.actions.description"="Generate LSIF data from Dart source code"
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="purple"

WORKDIR /crossdart
RUN git clone https://github.com/sourcegraph/lsif-dart.git . && \
    git checkout -q "${INDEXER_COMMIT}" && \
    pub get

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
