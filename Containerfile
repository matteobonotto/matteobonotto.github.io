FROM ruby:3.2-slim

ENV LANG=C.UTF-8 \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3 \
    JEKYLL_ENV=development

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    ca-certificates \
    libffi-dev \
    libssl-dev \
    zlib1g-dev \
    pkg-config \
    libxml2-dev \
    libxslt1-dev \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /srv/jekyll

# Copy the source before installing to ensure the gemspec's file globs resolve
COPY . /srv/jekyll

# Install gems (after copying) so the local gemspec can be evaluated correctly
RUN bundle install

EXPOSE 4000 35729

CMD ["bash", "-lc", "bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload"]
