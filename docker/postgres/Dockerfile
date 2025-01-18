FROM postgres:15-alpine

# Custom configurations can be copied to /docker-entrypoint-initdb.d/
# Any .sql, .sql.gz, or .sh files in this directory will be executed in alphabetical order
COPY ./init.sql /docker-entrypoint-initdb.d/

# Add custom PostgreSQL configuration if needed
# COPY postgresql.conf /etc/postgresql/postgresql.conf

# Set timezone
ENV TZ=UTC

# Optimize PostgreSQL for better performance
RUN echo "max_connections = 100" >> /usr/local/share/postgresql/postgresql.conf.sample && \
    echo "shared_buffers = 256MB" >> /usr/local/share/postgresql/postgresql.conf.sample && \
    echo "effective_cache_size = 768MB" >> /usr/local/share/postgresql/postgresql.conf.sample && \
    echo "maintenance_work_mem = 64MB" >> /usr/local/share/postgresql/postgresql.conf.sample && \
    echo "checkpoint_completion_target = 0.9" >> /usr/local/share/postgresql/postgresql.conf.sample && \
    echo "wal_buffers = 7864kB" >> /usr/local/share/postgresql/postgresql.conf.sample && \
    echo "default_statistics_target = 100" >> /usr/local/share/postgresql/postgresql.conf.sample && \
    echo "random_page_cost = 1.1" >> /usr/local/share/postgresql/postgresql.conf.sample && \
    echo "effective_io_concurrency = 200" >> /usr/local/share/postgresql/postgresql.conf.sample