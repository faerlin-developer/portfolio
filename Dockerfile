FROM python:3.11-slim

# Install build tools (needed for some Python wheels) and clean up after
RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /docs
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000
CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]
