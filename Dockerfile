# Build step
FROM python:3.9-slim AS builder

WORKDIR /app

COPY ./builder.py /app/builder.py

RUN pip install pandas && \
    python /app/builder.py

# Run step
FROM python:3.9-slim AS runner

EXPOSE 8050

WORKDIR /app

COPY --from=builder /app/file_to_run_app.csv /app/

COPY . .

CMD ["python", "app.py", "file_to_run_app.csv"]
